import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/presentation/cubit/favorites_cubit.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/products_grid_list.dart';

class FavoriteProductsPage extends StatelessWidget {
  const FavoriteProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is FavoritesError) {
          return Center(child: Text("Error: ${state.error}"));
        }
        if(state is FavoritesLoaded){
          final products = state.products;
          debugPrint("-------------- favorites loaded");
          return SingleChildScrollView(child: ProductsGridList(products: products));
        }
        return const SizedBox.shrink();
      },
    )
    );
  }
}