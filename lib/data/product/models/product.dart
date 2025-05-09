// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobile_shop/data/category/models/category.dart';
import 'package:mobile_shop/data/product/models/review.dart';

class ProductModel {
  final int? id;
  final String? name;
  final String? details;
  final String? size;
  final String? colour;
  final String? mainImage;
  final double? price;
  final CategoryModel? category;
  final List<String?>? images;
  final List<ReviewModel?>? reviews;

  ProductModel({
    this.id,
    this.name,
    this.details,
    this.size,
    this.colour,
    this.mainImage,
    this.price,
    this.category,
    this.images,
    this.reviews,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? details,
    String? size,
    String? colour,
    String? mainImage,
    double? price,
    CategoryModel? category,
    List<String?>? images,
    List<ReviewModel?>? reviews,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      size: size ?? this.size,
      colour: colour ?? this.colour,
      mainImage: mainImage ?? this.mainImage,
      price: price ?? this.price,
      category: category ?? this.category,
      images: images ?? this.images,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'details': details,
      'size': size,
      'colour': colour,
      'main_image': mainImage,
      'price': price,
      'category': category?.toMap(),
      'images': images?.map((img) => {'image': img}).toList(),
      'reviews': reviews?.map((rev) => rev?.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      size: map['size'] != null ? map['size'] as String : null,
      colour: map['colour'] != null ? map['colour'] as String : null,
      mainImage: map['main_image'] != null ? map['main_image'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      category: map['category'] != null ? CategoryModel.fromMap(map['category'] as Map<String,dynamic>) : null,
      images: (map['images'] as List?)
        ?.map((imgMap) => imgMap['image'] as String?)
        .toList(),
      reviews: (map['reviews'] as List?)
        ?.map((revMap) => revMap != null ? ReviewModel.fromMap(revMap) : null)
        .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, details: $details, size: $size, colour: $colour, mainImage: $mainImage, price: $price, category: $category, images: $images, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.details == details &&
      other.size == size &&
      other.colour == colour &&
      other.mainImage == mainImage &&
      other.price == price &&
      other.category == category &&
      listEquals(other.images, images) &&
      listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      details.hashCode ^
      size.hashCode ^
      colour.hashCode ^
      mainImage.hashCode ^
      price.hashCode ^
      category.hashCode ^
      images.hashCode ^
      reviews.hashCode;
  }
}
