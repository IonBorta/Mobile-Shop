part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class LoadCategories extends CategoriesEvent {}
