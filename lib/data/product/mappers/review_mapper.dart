import 'package:mobile_shop/data/product/models/review_model.dart';
import 'package:mobile_shop/domain/product/entities/review.dart';

class ReviewMapper {
  static ReviewEntity modelToEntitiy(ReviewModel model){
    return ReviewEntity(
      id: model.id,
      modifiedAt: model.modifiedAt,
      createdAt: model.createdAt,
      firstName: model.firstName,
      lastName: model.lastName,
      rating: model.rating,
      message: model.message,
      image: model.image
    );
  }
  static ReviewModel entityToModel(ReviewEntity entity){
    return ReviewModel(
      id: entity.id,
      modifiedAt: entity.modifiedAt,
      createdAt: entity.createdAt,
      firstName: entity.firstName,
      lastName: entity.lastName,
      rating: entity.rating,
      message: entity.message,
      image: entity.image
    );
  }
}