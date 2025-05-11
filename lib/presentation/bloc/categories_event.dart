part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class LoadCategories extends CategoriesEvent {}

class SelectCategory extends CategoriesEvent {
  final CategoryEntity? selectedCategory;

  SelectCategory(this.selectedCategory);
}
