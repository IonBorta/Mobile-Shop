import 'package:mobile_shop/domain/category/entities/category.dart';
import 'package:mobile_shop/domain/product/entities/review.dart';

class ProductEntity {
  final int? id;
  final String? name;
  final String? details;
  final String? size;
  final String? colour;
  final String? mainImage;
  final double? price;
  final CategoryEntity? category;
  final List<String?>? images;
  final List<ReviewEntity?>? reviews;
  final bool isFavorite;

  ProductEntity({
    required this.id, 
    required this.name, 
    required this.details, 
    required this.size, 
    required this.colour, 
    required this.mainImage, 
    required this.price, 
    required this.category, 
    required this.images, 
    required this.reviews,
    this.isFavorite = false
  });

  ProductEntity copyWith({bool? isFavorite}) {
    return ProductEntity(
      id: id,
      name: name,
      details: details,
      size: size,
      colour: colour,
      mainImage: mainImage,
      price: price,
      category: category,
      images: images,
      reviews: reviews,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, details: $details, size: $size, colour: $colour, mainImage: $mainImage, price: $price, category: $category, images: $images, reviews: $reviews, isFavorite: $isFavorite)';
  }
}