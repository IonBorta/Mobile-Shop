import 'package:flutter/material.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/products_grid_list.dart';

class Product {
  final String imageUrl;
  final String name;
  final double price;

  Product({required this.imageUrl, required this.name, required this.price});

}
class BestSellingProductsList extends StatelessWidget {
  BestSellingProductsList({super.key});

  final List<Product> products = [
    Product(
      imageUrl: "https://img.joomcdn.net/077bbe2ce1543f1cbd0a7201dec19a54d0e58233_original.jpeg", 
      name: "KingKong mini", 
      price: 100
    ),
        Product(
      imageUrl: "https://img.joomcdn.net/077bbe2ce1543f1cbd0a7201dec19a54d0e58233_original.jpeg", 
      name: "KingKong mini", 
      price: 100
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Best Selling",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 24/18),),
            Text("See all",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,height: 24/16),),
          ],
        ),
        const SizedBox(height: 29,),
        ProductsGridList(products: products)
      ],
    );
  }
}