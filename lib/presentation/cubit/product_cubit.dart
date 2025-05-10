import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/usecases/local/get_all_favorites.dart';
import 'package:mobile_shop/domain/product/usecases/local/get_by_id_from_favorite.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_all_products.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_best_selling_products.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_product_by_id.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_products_by_category.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
}
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductByIdUseCase _getRemoteProductById;
  final GetByIdFromFavoritesUseCase _getLocalProductById;
  int? _lastProductId;
  bool _isFavorite = false;

  ProductDetailsCubit(this._getRemoteProductById, this._getLocalProductById) : super(ProductDetailsInitial());

  Future<void> getProductById() async {
    if(_lastProductId == null){
      emit(ProductDetailsInitial());
      return;
    } 
    emit(ProductDetailsLoading());
    final Result<ProductEntity> result;
    if(_isFavorite){
      result = _getLocalProductById.call(_lastProductId!);
    }
    else{ 
      result = await _getRemoteProductById.call(_lastProductId!);
    }

    switch (result) {
      case Ok<ProductEntity>():
        emit(ProductDetailsLoaded(result.value));
      case Error():
        emit(ProductDetailsError(result.error));
    }
  }

  void saveProductId({required int? id,required bool isFavorite}){
    _lastProductId = id;
    _isFavorite = isFavorite;
  }
}
class BestSellingProductsCubit extends Cubit<BestSellingProductsState> {
  final GetBestSellingProductsUseCase _bestSellingProductsUseCase;

  BestSellingProductsCubit(this._bestSellingProductsUseCase) : super(BestSellingProductsInitial());

  Future<void> getBestSellingProducts() async {
    emit(BestSellingProductsLoading());

    final result = await _bestSellingProductsUseCase.call();
    switch (result) {
      case Ok<List<ProductEntity>>():
        emit(BestSellingProductsLoaded(result.value));
      case Error():
        emit(BestSellingProductsError(result.error));
    }
  }
}

class MoreToExploreProductsCubit extends Cubit<MoreToExploreProductsState> {
  final GetAllProductsUseCase _allProductsUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  final GetFavoritesUseCase _favoritesUseCase;

  MoreToExploreProductsCubit(
    this._allProductsUseCase, 
    this._getProductsByCategoryUseCase, 
    this._favoritesUseCase) : super(MoreToExploreProductsInitial());

  Future<void> getMoreToExploreProducts({
    page = 1,
    int size = 10,
    String categoryName = "",
  }) async {
    if (page == 1) emit(MoreToExploreProductsLoading());

    final Result<List<ProductEntity>> result;

    if(categoryName.isNotEmpty){
      result = await _getProductsByCategoryUseCase.call(page,size,categoryName);
    }
    else {
      result = await _allProductsUseCase.call(page,size);
    }

    // Get favorites from local storage
    List<ProductEntity> favoriteProducts = [];
    final favoritesResult = await _favoritesUseCase.call();
    if(result is Ok<List<ProductEntity>>){
      favoriteProducts = (favoritesResult as Ok<List<ProductEntity>>).value;
    }

    // debugPrint("++=======================================================++++");
    // for (var element in favoriteProducts) {
    //   debugPrint(element.toString());
    // }
    final favoriteIds = favoriteProducts.map((p) => p.id).toSet();

    switch (result) {
      case Ok<List<ProductEntity>>():
        // emit(MoreToExploreProductsLoaded(result.value));
        final newProducts = result.value;

        // Merge API products with isFavorite flag
        final mergedProducts = newProducts.map((product) {
          return product.copyWith(
            isFavorite: favoriteIds.contains(product.id),
          );
        }).toList();
        // debugPrint("++=======================================================++++");
        // for (var element in mergedProducts) {
        //   debugPrint(element.toString());
        // }

        // If it's page > 1 and already loaded, append
        if (state is MoreToExploreProductsLoaded && page > 1) {
          final currentProducts = (state as MoreToExploreProductsLoaded).products;
          emit(MoreToExploreProductsLoaded([...currentProducts, ...mergedProducts]),);
        } 
        else {
          // For initial load or first page
          emit(MoreToExploreProductsLoaded(mergedProducts));
        }
        //emit(FavoritesLoaded(products));
      case Error():
        emit(MoreToExploreProductsError(result.error));
    }
    // //return null;
  }
}
