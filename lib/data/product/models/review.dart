// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReviewModel {
  final int? id;
  final String? modifiedAt;
  final String? createdAt;
  final String? firstName;
  final String? lastName;
  final double? rating;
  final String? message;
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

  ReviewModel copyWith({
    int? id,
    String? modifiedAt,
    String? createdAt,
    String? firstName,
    String? lastName,
    double? rating,
    String? message,
    String? image,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      rating: rating ?? this.rating,
      message: message ?? this.message,
      image: image ?? this.image,
    );
  }

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
      rating: map['rating'] != null ? map['rating'] as double : null,
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

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.modifiedAt == modifiedAt &&
      other.createdAt == createdAt &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.rating == rating &&
      other.message == message &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      modifiedAt.hashCode ^
      createdAt.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      rating.hashCode ^
      message.hashCode ^
      image.hashCode;
  }
}
