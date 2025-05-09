import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/product/mappers/product_mapper.dart';
import 'package:mobile_shop/data/product/models/product.dart';
import 'package:mobile_shop/data/product/source/product_api_data_source.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductApiDataSource _productApiDataSource;

  ProductRepositoryImpl({required ProductApiDataSource productApiDataSource}) : _productApiDataSource = productApiDataSource;

  Result<List<ProductEntity>> _mapProductModelsToEntities(Result<List<ProductModel>> result){
    if (result is Ok<List<ProductModel>>) {
      final entities = result.value
          .map((model) => ProductMapper.modelToEntitiy(model))
          .toList();
      return Result.ok(entities);
    }
    return Result.error((result as Error).error);
  }


  @override
  Future<Result<List<ProductEntity>>> getAllProducts() async{
    final result = await _productApiDataSource.getAllProducts();

    return _mapProductModelsToEntities(result);
    // if (result is Ok<List<ProductModel>>) {
    //   final entities = result.value
    //       .map((model) => ProductMapper.modelToEntitiy(model))
    //       .toList();
    //   return Result.ok(entities);
    // }
    // return Result.error((result as Error).error);
  }

  @override
  Future<Result<List<ProductEntity>>> getBestSellingProducts() async {
    final result = await _productApiDataSource.getBestSellingProducts();

    return _mapProductModelsToEntities(result);
    // if (result is Ok<List<ProductModel>>) {
    //   final entities = result.value
    //       .map((model) => ProductMapper.modelToEntitiy(model))
    //       .toList();
    //   return Result.ok(entities);
    // }
    // return Result.error((result as Error).error);
  }

  @override
  Future<Result<ProductEntity>> getProductById(int id) async{
    final result = await _productApiDataSource.getProductById(id);
    if(result is Ok<ProductModel>){
      final entity = ProductMapper.modelToEntitiy(result.value);

      return Result.ok(entity);
    }
    return Result.error((result as Error).error);
  }

  @override
  Future<Result<List<ProductEntity>>> getProductsByCategory(String categoryName) async {
    final result = await _productApiDataSource.getProductsByCategory(categoryName);
    return _mapProductModelsToEntities(result);
  }
  
}