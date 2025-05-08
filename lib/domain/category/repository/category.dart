import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';

abstract class CategoryRepository {
  Future<Result<List<CategoryEntity>>> getCategories();
}