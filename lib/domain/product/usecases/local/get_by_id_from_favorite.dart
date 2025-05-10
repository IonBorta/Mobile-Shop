import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/favorites_products_repository.dart';

class GetByIdFromFavoritesUseCase {
  final FavoritesProductsRepository repository;
  GetByIdFromFavoritesUseCase(this.repository);

  Result<ProductEntity> call(int id){
    return repository.getProductById(id);
  }
}
