import 'package:flutter/material.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/presentation/pages/product_details/product_details_page.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;
  const ProductListItem({super.key, required this.product});
  final String defaultImage = "https://img.joomcdn.net/077bbe2ce1543f1cbd0a7201dec19a54d0e58233_original.jpeg";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage()
                  )
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
                            child: product.mainImage == null ? Placeholder(child: Center(child: Text("IMAGE IS MISSING"),),) : 
                              Image.network(
                              product.mainImage!,
                              fit: BoxFit.cover,
                              //webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
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
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,height: 24/16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                  ),
                  Text('\$${product.price}',
                    style: TextStyle(
                      color: Color(0xff00C569),
                      fontSize: 16,fontWeight: FontWeight.w400,height: 24/16
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