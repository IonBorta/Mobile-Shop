import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/category/mappers/category_mapper.dart';
import 'package:mobile_shop/data/category/models/category_model.dart';
import 'package:mobile_shop/data/category/source/category_api_data_source.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';
import 'package:mobile_shop/domain/category/repository/category.dart';

class CategoryRepositoryImpl extends CategoryRepository{
  final CategoryApiDataSource _categoryApiDataSource;

  CategoryRepositoryImpl({required CategoryApiDataSource categoryApiDataSource}) : _categoryApiDataSource = categoryApiDataSource;
  @override
  Future<Result<List<CategoryEntity>>> getCategories() async{
    final result = await _categoryApiDataSource.getCategories();

    if (result is Ok<List<CategoryModel>>) {
      final entities = result.value
          .map((model) => CategoryMapper.modelToEntitiy(model))
          .toList();
      return Result.ok(entities);
    }
    return Result.error((result as Error).error);
  }
  
}