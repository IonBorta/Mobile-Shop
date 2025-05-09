import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';

abstract class ProductRepository {
  Future<Result<List<ProductEntity>>> getBestSellingProducts();
  Future<Result<List<ProductEntity>>> getAllProducts();
  Future<Result<List<ProductEntity>>> getProductsByCategory(String categoryName);
  Future<Result<ProductEntity>> getProductById(int id);
}