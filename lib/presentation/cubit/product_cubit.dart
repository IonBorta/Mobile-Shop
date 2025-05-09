import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/usecases/get_all_products.dart';
import 'package:mobile_shop/domain/product/usecases/get_best_selling_products.dart';
import 'package:mobile_shop/domain/product/usecases/get_product_by_id.dart';
import 'package:mobile_shop/domain/product/usecases/get_products_by_category.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
}
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductByIdUseCase _getProductById;

  ProductDetailsCubit(this._getProductById) : super(ProductDetailsInitial());

  Future<void> getProductById(int id) async {
    emit(ProductDetailsLoading());
    final result = await _getProductById.call(id);

    switch (result) {
      case Ok<ProductEntity>():
        emit(ProductDetailsLoaded(result.value));
      case Error():
        emit(ProductDetailsError(result.error));
    }
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

  MoreToExploreProductsCubit(this._allProductsUseCase, this._getProductsByCategoryUseCase) : super(MoreToExploreProductsInitial());

  Future<void> getMoreToExploreProducts([String categoryName = ""]) async {
    emit(MoreToExploreProductsLoading());
    final Result<List<ProductEntity>> result;

    if(categoryName.isNotEmpty){
      result = await _getProductsByCategoryUseCase.call(categoryName);
    }
    else {
      result = await _allProductsUseCase.call();
    }

    switch (result) {
      case Ok<List<ProductEntity>>():
        emit(MoreToExploreProductsLoaded(result.value));
      case Error():
        emit(MoreToExploreProductsError(result.error));
    }
  }
}
