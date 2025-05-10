import 'package:flutter/material.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/product_list_item.dart';

class ProductsGridList extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsGridList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty ? Center(child: Text("No products"),) :
          GridView.builder(
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
