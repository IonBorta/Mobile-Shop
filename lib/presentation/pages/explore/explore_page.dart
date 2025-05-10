import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';
import 'package:mobile_shop/presentation/cubit/favorites_cubit.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/categories_list.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/best_selling_products_list.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/explore_products_list.dart';
import 'package:mobile_shop/presentation/pages/explore/widgets/searchbar_and_cameraicon.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with AutomaticKeepAliveClientMixin{
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _currentPage = 1;
  int maxPages = 3;
  final int _limit = 10;

  @override
  void initState() {
    super.initState();
    context.read<CategoriesBloc>().add(LoadCategories());
    // context.read<ProductsBloc>().add(LoadProducts());
    // context.read<ProductsBloc>().add(LoadAllProducts());
    context.read<BestSellingProductsCubit>().getBestSellingProducts();
    context.read<MoreToExploreProductsCubit>().getMoreToExploreProducts();
    context.read<FavoritesCubit>().loadFavorites();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          !_isLoading) {
            _fetchMoreProducts();
          }
    });
  }
  void _fetchMoreProducts() async {
    _isLoading = true;
    final state = context.read<CategoriesBloc>().state;
    String? selectedCategoryName;

    if (state is CategoriesLoaded && state.selectedCategory != null) {
      selectedCategoryName = state.selectedCategory!.name;
      if (maxPages < _currentPage) _currentPage = 1;
    }
    
    if (_currentPage <= maxPages) {
      _currentPage++;
      context.read<MoreToExploreProductsCubit>()
          .getMoreToExploreProducts(page: _currentPage, size: _limit, categoryName: selectedCategoryName ?? "");
    }
    _isLoading = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                controller: _scrollController,
                child: Column(
                  children: [
                    BestSellingProductsList(),
                    const SizedBox(height: 20,),
                    MoreToExploreProductsList(),
                    if (_isLoading)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              )
            ),
          ]
        ),
      )
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}