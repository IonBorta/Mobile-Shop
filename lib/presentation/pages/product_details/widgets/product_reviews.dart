import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/domain/product/entities/review.dart';

class ProductReviews extends StatelessWidget {
  final List<ReviewEntity?> reviews;
  const ProductReviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rewiews",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 26/18)),
        SizedBox(height: 16,),
        Text("Write your",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,height: 16/14,color: Color(0xff00C569))),
        _ReviewList(reviews: reviews,)
      ],
    );
  }
}
class _ReviewList extends StatelessWidget {
  final List<ReviewEntity?> reviews;
  const _ReviewList({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reviews.map((review) => _ReviewItem(review)).toList(),
    );
  }
}
class _ReviewItem extends StatelessWidget {
  final ReviewEntity? review;
  const _ReviewItem(this.review);

  @override
  Widget build(BuildContext context) {
    double imageSize = 46;
    int imageMarginRight = 32;
    int parentPadding = 32;
    return review == null ? Container() :
      Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
        children: [
          ClipOval(
            child: review!.image == null
              ? Container(
                color: Colors.grey[300],
                child: const Center(child: Text("IMAGE IS MISSING")),
              )
              :
              CachedNetworkImage(
                imageUrl: review!.image!,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) =>
                        const Center(child: Icon(Icons.broken_image)),
              ),
          ),
          SizedBox(width: 32,),
          SizedBox(
            width: MediaQuery.of(context).size.width - imageSize - parentPadding - imageMarginRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${review!.firstName} ${review!.lastName}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,height: 18/14)),
                      _buildStars(review!.rating ?? 0),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Text(review!.message ?? "",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,height: 16/14),textAlign: TextAlign.start,)
              ],
            ),
          )
        ],
            ),
      );
  }
  Widget _buildStars(int rating) {
    return Row(
      children: List.generate(
        rating.clamp(0, 5), // Ensures the rating is between 0 and 5
        (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
      ),
    );
  }
}
