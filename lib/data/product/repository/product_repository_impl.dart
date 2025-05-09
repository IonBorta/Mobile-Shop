import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/product/mappers/product_mapper.dart';
import 'package:mobile_shop/data/product/models/product.dart';
import 'package:mobile_shop/data/product/source/product_api_data_source.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductApiDataSource _productApiDataSource;

  ProductRepositoryImpl({required ProductApiDataSource productApiDataSource}) : _productApiDataSource = productApiDataSource;

  @override
  Future<Result<List<ProductEntity>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ProductEntity>>> getBestSellingProducts() async {
    final result = await _productApiDataSource.getBestSellingProducts();

    if (result is Ok<List<ProductModel>>) {
      final entities = result.value
          .map((model) => ProductMapper.modelToEntitiy(model))
          .toList();
      return Result.ok(entities);
    }
    return Result.error((result as Error).error);
  }

  @override
  Future<Result<ProductEntity>> getProductById() {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ProductEntity>>> getProductsByCategory() {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }
  
}