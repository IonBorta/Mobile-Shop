import 'package:mobile_shop/data/category/models/category_model.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';

class CategoryMapper {
  static CategoryEntity modelToEntitiy(CategoryModel? model){
    return CategoryEntity(
      name: model?.name,
      icon: model?.icon,
      id: model?.id
    );
  }
  static CategoryModel entityToModel(CategoryEntity entity){
    return CategoryModel(
      name: entity.name,
      icon: entity.icon,
      id: entity.id
    );
  }
}