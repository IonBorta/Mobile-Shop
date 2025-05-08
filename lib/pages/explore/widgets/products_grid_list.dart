import 'package:flutter/material.dart';
import 'package:mobile_shop/pages/explore/widgets/best_selling_products_list.dart';
import 'package:mobile_shop/pages/explore/widgets/product_list_item.dart';

class ProductsGridList extends StatelessWidget {
  final List<Product> products;

  const ProductsGridList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true, 
          physics: NeverScrollableScrollPhysics(), 
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 164 / 316, //0.7, // Adjust to control height/width ratio
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductListItem(product: product);
          }
    );
  }
}
