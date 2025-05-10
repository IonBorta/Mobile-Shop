import 'package:hive/hive.dart';
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/product/models/product_model.dart';

abstract class FavoritesProductsLocalDataSource {
  Future<Result<void>> addOrRemoveProduct(ProductModel product);
  Result<ProductModel>  getProductById(int id);
  Future<Result<List<ProductModel>>> getAllFavorites();
}

class FavoritesProductsLocalDataSourceImpl extends FavoritesProductsLocalDataSource {

  final Box<ProductModel> _box;

  FavoritesProductsLocalDataSourceImpl(this._box);

  @override
  Future<Result<void>> addOrRemoveProduct(ProductModel product) async {
    try {
      if (_box.containsKey(product.id)) {
        await _box.delete(product.id);
      } else {
        await _box.put(product.id, product);
      }
      return Result.ok(null);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Result<ProductModel> getProductById(int id) {
    try {
      final product = _box.get(id);
      return product != null ? Result.ok(product) : Result.error("Product not found");
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<ProductModel>>> getAllFavorites() async {
    try {
      final products = _box.values.toList();
      return Result.ok(products);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
  
}