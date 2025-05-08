import 'package:flutter/material.dart';
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
      body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 84), // height of the bottom bar
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImagesGalery(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ProductTitle(title: "Mobile"),
                      const SizedBox(height: 28),
                      ProductOptionsRow(),
                      const SizedBox(height: 36),
                      ProductDescription(),
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
          child: ProductPriceAndButton(), // fixed bottom bar
        ),
      ],
    ),
    );
  }
}
