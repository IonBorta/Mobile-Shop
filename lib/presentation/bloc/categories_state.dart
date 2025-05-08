part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
