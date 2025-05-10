import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mobile_shop/hive_helper/hive_types.dart';
import 'package:mobile_shop/hive_helper/hive_adapters.dart';
import 'package:mobile_shop/hive_helper/fields/review_model_fields.dart';


part 'review_model.g.dart';


@HiveType(typeId: HiveTypes.reviewModel, adapterName: HiveAdapters.reviewModel)
class ReviewModel extends HiveObject{
	@HiveField(ReviewModelFields.id)
  final int? id;
	@HiveField(ReviewModelFields.modifiedAt)
  final String? modifiedAt;
	@HiveField(ReviewModelFields.createdAt)
  final String? createdAt;
	@HiveField(ReviewModelFields.firstName)
  final String? firstName;
	@HiveField(ReviewModelFields.lastName)
  final String? lastName;
	@HiveField(ReviewModelFields.rating)
  final int? rating;
	@HiveField(ReviewModelFields.message)
  final String? message;
	@HiveField(ReviewModelFields.image)
  final String? image;

  ReviewModel({
    this.id,
    this.modifiedAt,
    this.createdAt,
    this.firstName,
    this.lastName,
    this.rating,
    this.message,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'modified_at': modifiedAt,
      'created_at': createdAt,
      'first_name': firstName,
      'last_name': lastName,
      'rating': rating,
      'message': message,
      'image': image,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'] != null ? map['id'] as int : null,
      modifiedAt: map['modified_at'] != null ? map['modified_at'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) => ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewModel(id: $id, modifiedAt: $modifiedAt, createdAt: $createdAt, firstName: $firstName, lastName: $lastName, rating: $rating, message: $message, image: $image)';
  }
}