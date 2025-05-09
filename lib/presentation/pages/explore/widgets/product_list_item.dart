import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/data/product/repository/product_repository_impl.dart';
import 'package:mobile_shop/data/product/source/product_api_data_source.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/usecases/get_product_by_id.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';
import 'package:mobile_shop/presentation/pages/product_details/product_details_page.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;
  const ProductListItem({super.key, required this.product});
  final String defaultImage =
      "https://img.joomcdn.net/077bbe2ce1543f1cbd0a7201dec19a54d0e58233_original.jpeg";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //context.read<ProductDetailsCubit>().getProductById(product.id ?? -1);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create:
                      (context) => ProductDetailsCubit(
                        GetProductByIdUseCase(
                          productRepository: ProductRepositoryImpl(
                            productApiDataSource: ProductApiDataSourceImpl(),
                          ),
                        ),
                      )..getProductById(product.id ?? -1),
                  child: const ProductDetailsPage(),
                ),
          ),
        );
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
                FavoriteStarIcon(),
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
  const FavoriteStarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 0,
      child: IconButton(
        onPressed: () {},
        icon: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.star_border, size: 16, color: Colors.black),
        ),
      ),
    );
  }
}