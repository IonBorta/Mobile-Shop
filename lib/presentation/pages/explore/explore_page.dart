import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';
import 'package:mobile_shop/presentation/bloc/products_bloc.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/categories_list.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/best_selling_products_list.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/explore_products_list.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/searchbar_and_cameraicon.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  @override
  void initState() {
    super.initState();
    context.read<CategoriesBloc>().add(LoadCategories());
    // context.read<ProductsBloc>().add(LoadProducts());
    // context.read<ProductsBloc>().add(LoadAllProducts());
    context.read<BestSellingProductsCubit>().getBestSellingProducts();
    context.read<MoreToExploreProductsCubit>().getMoreToExploreProducts();
  }

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
