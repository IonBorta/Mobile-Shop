// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_shop/core/result.dart';

import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/usecases/get_best_selling_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetBestSellingProductsUseCase _bestSellingProductsUseCase;

  ProductsBloc(
    this._bestSellingProductsUseCase,
  ) : super(ProductsInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  FutureOr<void> _onLoadProducts(LoadProducts event, Emitter<ProductsState> emit) async{
    emit(ProductsLoading());

    final result = await _bestSellingProductsUseCase.call();
    switch (result) {
      case Ok<List<ProductEntity>>():
        emit(ProductsLoaded(result.value));
      case Error():
        emit(ProductsError(result.error));
    }
  }
}
