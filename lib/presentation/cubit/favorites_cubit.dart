import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/domain/product/entities/product.dart';
import 'package:mobile_shop/domain/product/usecases/local/add_to_favorite.dart';
import 'package:mobile_shop/domain/product/usecases/local/get_all_favorites.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._addOrRemoveFavorite, this._getFavorites) : super(FavoritesInitial());

  final AddOrRemoveFavoriteUseCase _addOrRemoveFavorite;
  final GetFavoritesUseCase _getFavorites;

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    final result = await _getFavorites();
    switch (result) {
      case Ok<List<ProductEntity>>():
        emit(FavoritesLoaded(result.value));
      case Error():
        emit(FavoritesError(result.error));
    }
  }

  Future<void> addOrRemoveFavorite(ProductEntity product) async {
    final result = await _addOrRemoveFavorite.call(product);
    if(result is Error){
      emit(FavoritesError(result.error));
    }
    await loadFavorites();
  }
}
