import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/product/mappers/product_mapper.dart';
import 'package:mobile_shop/data/product/models/product_model.dart';
import 'package:mobile_shop/data/product/source/favorites_products_local_data_source.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/favorites_products_repository.dart';


class FavoritesProductsRepositoryImpl extends FavoritesProductsRepository{
  final FavoritesProductsLocalDataSource _favDataSource;

  FavoritesProductsRepositoryImpl({required FavoritesProductsLocalDataSource favDataSource}) : _favDataSource = favDataSource;
  @override
  Future<Result<void>> addOrRemoveProduct(ProductEntity product) async{
    final model = ProductMapper.entityToModel(product);
    return await _favDataSource.addOrRemoveProduct(model);
  }


  @override
  Future<Result<List<ProductEntity>>> getAllFavorites() async{
    final result = await _favDataSource.getAllFavorites();

    if (result is Ok<List<ProductModel>>) {
      final entities = result.value
          .map((model) => ProductMapper.modelToEntitiy(model).copyWith(isFavorite: true))
          .toList();
      return Result.ok(entities);
    }
    return Result.error((result as Error).error);
  }

  @override
  Result<ProductEntity> getProductById(int id){
    final result = _favDataSource.getProductById(id);
    if(result is Ok<ProductModel>){
      final entity = ProductMapper.modelToEntitiy(result.value);
      return Result.ok(entity);
    }
    return Result.error((result as Error).error);
  }

}