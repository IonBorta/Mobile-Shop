import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/favorites_products_repository.dart';

class AddOrRemoveFavoriteUseCase {
  final FavoritesProductsRepository repository;
  AddOrRemoveFavoriteUseCase(this.repository);

  Future<Result<void>> call(ProductEntity product) async {
    return await repository.addOrRemoveProduct(product);
  }
}