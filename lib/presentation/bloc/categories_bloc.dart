
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/category/entities/category.dart';
import 'package:mobile_shop/domain/category/usecases/get_categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoriesBloc({required GetCategoriesUseCase usecase}) 
    : _getCategoriesUseCase = usecase, super(CategoriesInitial()) {

    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  FutureOr<void> _onLoadCategories(LoadCategories event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());

    final result = await _getCategoriesUseCase.call();
    switch (result) {
      case Ok<List<CategoryEntity>>():
        emit(CategoriesLoaded(result.value,null));
      case Error():
        emit(CategoriesError(result.error));
    }
  }

  FutureOr<void> _onSelectCategory(SelectCategory event, Emitter<CategoriesState> emit) {
    if (state is CategoriesLoaded) {
      final currentState = state as CategoriesLoaded;
      emit(currentState.copyWith(selectedCategory: event.selectedCategory));
    }
  }
}
