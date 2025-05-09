import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/presentation/bloc/products_bloc.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/products_grid_list.dart';

class MoreToExploreProductsList extends StatelessWidget {
  MoreToExploreProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreToExploreProductsCubit, MoreToExploreProductsState>(
      builder: (context, state) {
        if (state is MoreToExploreProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MoreToExploreProductsError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        if(state is MoreToExploreProductsLoaded){
          final products = state.products;
          return _MoreToExploreProductsList(products: products);
        }
        return const SizedBox.shrink();
      },
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text("More to explore",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 24/18),),
    //     const SizedBox(height: 28,),
    //     ProductsGridList(products: products)
    //   ],
    // );
  }
}

class _MoreToExploreProductsList extends StatelessWidget {
  final List<ProductEntity> products;
  const _MoreToExploreProductsList({ required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("More to explore",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 24/18),),
        const SizedBox(height: 28,),
        ProductsGridList(products: products)
      ],
    );
  }
}