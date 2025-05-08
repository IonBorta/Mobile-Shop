import 'package:flutter/material.dart';
import 'package:mobile_shop/pages/explore/widgets/categories_list.dart';
import 'package:mobile_shop/pages/explore/widgets/best_selling_products_list.dart';
import 'package:mobile_shop/pages/explore/widgets/explore_products_list.dart';
import 'package:mobile_shop/pages/explore/widgets/searchbar_and_cameraicon.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchBarAndCameraIcon(),
            const SizedBox(height: 28,),
            CategoriesList(),
            const SizedBox(height: 43,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BestSellingProductsList(),
                    const SizedBox(height: 44,),
                    MoreToExploreProductsList()
                  ],
                )
              )
            ),
          ]
        ),
      )
    );
  }
}
