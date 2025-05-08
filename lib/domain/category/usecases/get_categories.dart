import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';
import 'package:mobile_shop/domain/category/repository/category.dart';

class GetCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase({required CategoryRepository categoryRepository}) : _categoryRepository = categoryRepository;
  
  Future<Result<List<CategoryEntity>>> call() async {
    return await _categoryRepository.getCategories();
  }
}