part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

// class ProductsLoaded extends ProductsState {
//   final List<ProductEntity> products;
//   final List<ProductEntity> allProducts;

//   ProductsLoaded({this.products = const [], this.allProducts = const[]});
// }
final class BestSellingProductsLoaded extends ProductsState{ 
  final List<ProductEntity> bestSellingProducts;

  BestSellingProductsLoaded({required this.bestSellingProducts});
}
final class AllProductsLoaded extends ProductsState{ 
  final List<ProductEntity> allProducts;

  AllProductsLoaded({required this.allProducts});
}



class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}
