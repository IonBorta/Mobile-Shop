import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';

class Category {
  final String icon;
  final String name;

  Category({required this.icon, required this.name});
}

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
class _CategoriesList extends StatelessWidget {
  final List<CategoryEntity> categories;
  const _CategoriesList({required this.categories});

  @override
  Widget build(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 24 / 18,
              ),
            ),
            SizedBox(height: 18),
            SizedBox(
              height: 110,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 18),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFF4F4F4),
                              blurRadius: 20,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(4),
                        child: ClipOval(
                          child: category.icon == null ? Icon(Icons.error) :
                            Image.network(
                            category.icon!,
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                            //webHtmlElementStrategy:WebHtmlElementStrategy.prefer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: 60,
                        child: Text(
                          category.name ?? "",
                          style: TextStyle(
                            fontSize: 12,
                            height: 16 / 12,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
  }
}