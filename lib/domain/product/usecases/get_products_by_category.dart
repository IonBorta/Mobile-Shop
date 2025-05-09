import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository _productRepository;

  GetProductsByCategoryUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  Future<Result<List<ProductEntity>>> call(int page,int size,String categoryName) async {
    return await _productRepository.getProductsByCategory(page,size,categoryName);
  }
}