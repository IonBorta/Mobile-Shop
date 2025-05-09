import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';
import 'package:mobile_shop/presentation/pages/product_details/widgets/product_description.dart';
import 'package:mobile_shop/presentation/pages/product_details/widgets/product_images_galery.dart';
import 'package:mobile_shop/presentation/pages/product_details/widgets/product_options.dart';
import 'package:mobile_shop/presentation/pages/product_details/widgets/product_price_and_button.dart';
import 'package:mobile_shop/presentation/pages/product_details/widgets/product_title.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductDetailsError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          if (state is ProductDetailsLoaded) {
            final product = state.product;
            return _ProductDetailsPage(product: product);
          }
          return Placeholder();
        },
      ),
    );
  }
}

class _ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  const _ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 84,
          ), // height of the bottom bar
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImagesGalery(imageUrls: product.images?.whereType<String>().toList() ?? [],),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      ProductTitle(title: product.name ?? "Unknown"),
                      const SizedBox(height: 28),
                      ProductOptionsRow(size: product.size ?? "Unknown",color: product.colour ?? "Unknown",),
                      const SizedBox(height: 36),
                      ProductDescription(details: product.details ?? "Unknown",),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ProductPriceAndButton(price: product.price ?? 0,), // fixed bottom bar
        ),
      ],
    );
  }
}
