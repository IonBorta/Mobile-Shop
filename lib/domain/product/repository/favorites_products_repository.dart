import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';

abstract class FavoritesProductsRepository {
  Future<Result<void>> addOrRemoveProduct(ProductEntity product);
  Result<ProductEntity> getProductById(int id);
  Future<Result<List<ProductEntity>>> getAllFavorites();
}