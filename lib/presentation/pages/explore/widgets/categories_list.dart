import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoriesError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        if(state is CategoriesLoaded){
          final categories = state.categories;
          return _CategoriesList(categories: categories);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
class _CategoriesList extends StatefulWidget {
  final List<CategoryEntity> categories;
  const _CategoriesList({required this.categories});

  @override
  State<_CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<_CategoriesList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoriesTitle(),
        SizedBox(height: 18),
        SizedBox(
          height: 110,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 18),
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              final category = widget.categories[index];
              return GestureDetector(
                onTap: () {
                  String? categoryName = category.name;
                  setState(() {
                    if(selectedIndex != index){
                      selectedIndex = index;
                      context.read<CategoriesBloc>().add(SelectCategory(category));
                    }
                    else {
                      selectedIndex = -1;
                      categoryName = null;
                      context.read<CategoriesBloc>().add(SelectCategory(CategoryEntity()));
                    }
                  });
                  context
                      .read<MoreToExploreProductsCubit>()
                      .getMoreToExploreProducts(categoryName: categoryName ?? "");
                },
                child: _CategoryItem(
                  name: category.name,
                  icon: category.icon,
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget _buildCategoriesTitle() {
  return Text(
    "Categories",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 24 / 18,
    ),
  );
}

class _CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String? name;
  final String? icon;
  const _CategoryItem({
    required this.name,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategoryImage(isSelected, icon),
        const SizedBox(height: 14),
        _buildCategoryName(name),
      ],
    );
  }
}

Widget _buildCategoryImage(bool isSelected, String? icon) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isSelected ? Colors.grey.shade400 : Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFF4F4F4),
          blurRadius: 20,
          offset: Offset(0, 6),
        ),
      ],
    ),
    padding: const EdgeInsets.all(4),
    child: ClipOval(
      child:
          icon == null
              ? Container(
                color: Colors.grey[300],
                child: const Center(child: Text("IMAGE IS MISSING")),
              )
              : CachedNetworkImage(
                imageUrl: icon,
                width: 52,
                height: 52,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) =>
                        const Center(child: Icon(Icons.broken_image)),
              ),
    ),
  );
}
Widget _buildCategoryName(String? name) {
  return SizedBox(
    width: 60,
    child: Text(
      name ?? "",
      style: TextStyle(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
