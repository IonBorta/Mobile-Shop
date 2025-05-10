import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/presentation/cubit/favorites_cubit.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;
  const ProductListItem({super.key, required this.product});
  final String defaultImage =
      "https://img.joomcdn.net/077bbe2ce1543f1cbd0a7201dec19a54d0e58233_original.jpeg";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductDetailsCubit>().saveProductId(id: product.id,isFavorite: product.isFavorite);
        Navigator.of(context).pushNamed('/details');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 164 / 240,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: product.mainImage == null
                        ? Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Text("IMAGE IS MISSING"),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: product.mainImage!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.broken_image),
                            ),
                          ),
                  ),
                ),
                FavoriteStarIcon(product: product,),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            product.name ?? "Unknow",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            '\$${product.price}',
            style: TextStyle(
              color: Color(0xff00C569),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteStarIcon extends StatelessWidget {
  final ProductEntity product;
  const FavoriteStarIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<FavoritesCubit, bool>((cubit) {
      final state = cubit.state;
      if (state is FavoritesLoaded) {
        return state.products.any((p) => p.id == product.id);
      }
      return false;
    });
    return Positioned(
      top: 8,
      right: 0,
      child: IconButton(
            onPressed: () {
              context.read<FavoritesCubit>().addOrRemoveFavorite(product);
            },
            icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: isFavorite ? Colors.green : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                size: 16,
                color: isFavorite ? Colors.yellow : Colors.black,
              ),
            ),
      ),
    );
  }
}
