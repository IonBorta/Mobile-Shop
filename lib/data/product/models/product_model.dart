import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobile_shop/data/category/models/category_model.dart';
import 'package:mobile_shop/data/product/models/review_model.dart';
import 'package:mobile_shop/hive_helper/hive_types.dart';
import 'package:mobile_shop/hive_helper/hive_adapters.dart';
import 'package:mobile_shop/hive_helper/fields/product_model_fields.dart';


part 'product_model.g.dart';


@HiveType(typeId: HiveTypes.productModel, adapterName: HiveAdapters.productModel)
class ProductModel extends HiveObject{
	@HiveField(ProductModelFields.id)
  final int? id;
	@HiveField(ProductModelFields.name)
  final String? name;
	@HiveField(ProductModelFields.details)
  final String? details;
	@HiveField(ProductModelFields.size)
  final String? size;
	@HiveField(ProductModelFields.colour)
  final String? colour;
	@HiveField(ProductModelFields.mainImage)
  final String? mainImage;
	@HiveField(ProductModelFields.price)
  final double? price;
	@HiveField(ProductModelFields.category)
  final CategoryModel? category;
	@HiveField(ProductModelFields.images)
  final List<String?>? images;
	@HiveField(ProductModelFields.reviews)
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
    try {
      return ProductModel(
        id: map['id'] != null ? map['id'] as int : null,
        name: map['name'] != null ? map['name'] as String : null,
        details: map['details'] != null ? map['details'] as String : null,
        size: map['size'] != null ? map['size'] as String : null,
        colour: map['colour'] != null ? map['colour'] as String : null,
        mainImage:
            map['main_image'] != null ? map['main_image'] as String : null,
        price: map['price'] != null ? map['price'] as double : null,
        category:
            map['category'] != null
                ? CategoryModel.fromMap(map['category'] as Map<String, dynamic>)
                : null,
        images:
            (map['images'] as List?)
                ?.map(
                  (imgMap) =>
                      (imgMap as Map<String, dynamic>)['image'] as String?,
                )
                .toList(),
        reviews:
            (map['reviews'] as List<dynamic>?)
                ?.map(
                  (revMap) =>
                      revMap != null
                          ? ReviewModel.fromMap(revMap as Map<String, dynamic>)
                          : null,
                )
                .toList(),
      );
    } on Exception catch (e) {
      debugPrint("############ erorr = $e ###########");
      return ProductModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, details: $details, size: $size, colour: $colour, mainImage: $mainImage, price: $price, category: $category, images: $images, reviews: $reviews)';
  }
}