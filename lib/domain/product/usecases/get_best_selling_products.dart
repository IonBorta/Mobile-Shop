import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/product_repository.dart';

class GetBestSellingProductsUseCase {
  final ProductRepository _productRepository;

  GetBestSellingProductsUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  Future<Result<List<ProductEntity>>> call() async{
    return await _productRepository.getBestSellingProducts();
  }
}