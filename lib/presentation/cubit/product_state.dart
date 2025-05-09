part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

@immutable
sealed class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductEntity product;
  ProductDetailsLoaded(this.product);
}
class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError(this.message);
}

@immutable
sealed class BestSellingProductsState {}

final class BestSellingProductsInitial extends BestSellingProductsState {}

final class BestSellingProductsLoading extends BestSellingProductsState {}

final class BestSellingProductsLoaded extends BestSellingProductsState {
  final List<ProductEntity> products;
  BestSellingProductsLoaded(this.products);
}

final class BestSellingProductsError extends BestSellingProductsState {
  final String message;
  BestSellingProductsError(this.message);
}

@immutable
sealed class MoreToExploreProductsState {}

final class MoreToExploreProductsInitial extends MoreToExploreProductsState {}

final class MoreToExploreProductsLoading extends MoreToExploreProductsState {}

final class MoreToExploreProductsLoaded extends MoreToExploreProductsState {
  final List<ProductEntity> products;
  MoreToExploreProductsLoaded(this.products);
}

final class MoreToExploreProductsError extends MoreToExploreProductsState {
  final String message;
  MoreToExploreProductsError(this.message);
}