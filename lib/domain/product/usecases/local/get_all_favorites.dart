import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/favorites_products_repository.dart';

class GetFavoritesUseCase {
  final FavoritesProductsRepository repository;
  GetFavoritesUseCase(this.repository);

  Future<Result<List<ProductEntity>>> call() async{
    return await repository.getAllFavorites();
  }
}