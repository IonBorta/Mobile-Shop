part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;
  final CategoryEntity? selectedCategory;

  CategoriesLoaded(this.categories, this.selectedCategory);

  CategoriesLoaded copyWith({
    List<CategoryEntity>? categories,
    CategoryEntity? selectedCategory,
  }) {
    return CategoriesLoaded(
      categories ?? this.categories,
      selectedCategory ?? this.selectedCategory,
    );
  }
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
