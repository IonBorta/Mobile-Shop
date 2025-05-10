import 'package:mobile_shop/data/category/mappers/category_mapper.dart';
import 'package:mobile_shop/data/product/mappers/review_mapper.dart';
import 'package:mobile_shop/data/product/models/product_model.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';

class ProductMapper {
  static ProductEntity modelToEntitiy(ProductModel? model){
    return ProductEntity(
      id: model?.id,
      name: model?.name,
      details: model?.details,
      size: model?.size,
      colour: model?.colour,
      mainImage: model?.mainImage,
      price: model?.price,
      category: model?.category != null ? CategoryMapper.modelToEntitiy(model?.category) : null,
      images: model?.images,
      reviews: model?.reviews?.map((r) => r != null ? ReviewMapper.modelToEntitiy(r) : null).toList(),
    );
  }
  static ProductModel entityToModel(ProductEntity entity){
    return ProductModel(
      id: entity.id,
      name: entity.name,
      details: entity.details,
      size: entity.size,
      colour: entity.colour,
      mainImage: entity.mainImage,
      price: entity.price,
      category: entity.category != null ? CategoryMapper.entityToModel(entity.category!) : null,
      images: entity.images,
      reviews: entity.reviews?.map((r) => r != null ? ReviewMapper.entityToModel(r) : null).toList(),
    );
  }
}