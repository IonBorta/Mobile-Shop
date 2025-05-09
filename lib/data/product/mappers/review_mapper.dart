import 'package:mobile_shop/data/product/models/review.dart';
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
}