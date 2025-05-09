// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_shop/core/result.dart';

import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/usecases/get_all_products.dart';
import 'package:mobile_shop/domain/product/usecases/get_best_selling_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetBestSellingProductsUseCase _bestSellingProductsUseCase;
  final GetAllProductsUseCase _allProductsUseCase;

  ProductsBloc(
    this._bestSellingProductsUseCase,
    this._allProductsUseCase,
  ) : super(ProductsInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadAllProducts>(_onLoadAllProducts);
  }

  FutureOr<void> _onLoadProducts(LoadProducts event, Emitter<ProductsState> emit) async{
    emit(ProductsLoading());

    final result = await _bestSellingProductsUseCase.call();
    switch (result) {
      case Ok<List<ProductEntity>>():
        emit(BestSellingProductsLoaded(bestSellingProducts: result.value));
      case Error():
        emit(ProductsError(result.error));
    }
  }

  FutureOr<void> _onLoadAllProducts(LoadAllProducts event, Emitter<ProductsState> emit) async{
    emit(ProductsLoading());

    final result = await _allProductsUseCase.call();
    switch (result) {
      case Ok<List<ProductEntity>>():
        emit(AllProductsLoaded(allProducts: result.value));
      case Error():
        emit(ProductsError(result.error));
    }
  }
}
