import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/repository/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository _productRepository;

  GetProductByIdUseCase(this._productRepository); 
  
  Future<Result<ProductEntity>> call(int id) async{
    return await _productRepository.getProductById(id);
  }
}