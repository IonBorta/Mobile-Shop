part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}
