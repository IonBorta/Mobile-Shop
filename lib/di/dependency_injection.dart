import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobile_shop/data/category/repository/category_impl.dart';
import 'package:mobile_shop/data/category/source/category_api_data_source.dart';
import 'package:mobile_shop/data/product/models/product_model.dart';
import 'package:mobile_shop/data/product/repository/favorites_products_repository_impl.dart';
import 'package:mobile_shop/data/product/repository/product_repository_impl.dart';
import 'package:mobile_shop/data/product/source/favorites_products_local_data_source.dart';
import 'package:mobile_shop/data/product/source/product_api_data_source.dart';
import 'package:mobile_shop/domain/category/repository/category.dart';
import 'package:mobile_shop/domain/category/usecases/get_categories.dart';
import 'package:mobile_shop/domain/product/repository/favorites_products_repository.dart';
import 'package:mobile_shop/domain/product/repository/product_repository.dart';
import 'package:mobile_shop/domain/product/usecases/local/add_to_favorite.dart';
import 'package:mobile_shop/domain/product/usecases/local/get_all_favorites.dart';
import 'package:mobile_shop/domain/product/usecases/local/get_by_id_from_favorite.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_all_products.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_best_selling_products.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_product_by_id.dart';
import 'package:mobile_shop/domain/product/usecases/remote/get_products_by_category.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';
import 'package:mobile_shop/presentation/cubit/favorites_cubit.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDi() async {
  // Hive
  final box = await Hive.openBox<ProductModel>('favorites');

  // Data Source
  getIt.registerLazySingleton<CategoryApiDataSource>(() => CategoryApiDataSourceImpl());
  getIt.registerLazySingleton<ProductApiDataSource>(() => ProductApiDataSourceImpl());
  getIt.registerLazySingleton<FavoritesProductsLocalDataSource>(() => FavoritesProductsLocalDataSourceImpl(box));

  // Repository
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
    categoryApiDataSource: getIt.get<CategoryApiDataSource>())
  );
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    productApiDataSource: getIt.get<ProductApiDataSource>())
  );
  getIt.registerLazySingleton<FavoritesProductsRepository>(
    () => FavoritesProductsRepositoryImpl(favDataSource: getIt.get<FavoritesProductsLocalDataSource>())
  );

  // Remote API Use cases GetCategoriesUseCase
  getIt.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(
    categoryRepository: getIt.get<CategoryRepository>())
  );
  getIt.registerLazySingleton<GetAllProductsUseCase>(() => GetAllProductsUseCase(
    productRepository: getIt.get<ProductRepository>())
  );
  getIt.registerLazySingleton<GetBestSellingProductsUseCase>(() => GetBestSellingProductsUseCase(
    productRepository: getIt.get<ProductRepository>())
  );
  getIt.registerLazySingleton<GetProductByIdUseCase>(() => GetProductByIdUseCase(
    getIt.get<ProductRepository>())
  );
  getIt.registerLazySingleton<GetProductsByCategoryUseCase>(() => GetProductsByCategoryUseCase(
    productRepository: getIt.get<ProductRepository>())
  );

  // Local Hive Use cases
  getIt.registerLazySingleton<AddOrRemoveFavoriteUseCase>(() => AddOrRemoveFavoriteUseCase(
    getIt.get<FavoritesProductsRepository>())
  );
  getIt.registerLazySingleton<GetFavoritesUseCase>(() => GetFavoritesUseCase(
    getIt.get<FavoritesProductsRepository>())
  );
  getIt.registerLazySingleton<GetByIdFromFavoritesUseCase>(() => GetByIdFromFavoritesUseCase(
    getIt.get<FavoritesProductsRepository>())
  );
  
  // ProductDetailsCubit
  getIt.registerLazySingleton<ProductDetailsCubit>(
    () => ProductDetailsCubit(
      getIt.get<GetProductByIdUseCase>(),
      getIt.get<GetByIdFromFavoritesUseCase>()
    ),
  );
  // BestSellingProductsCubit
  getIt.registerLazySingleton<BestSellingProductsCubit>(
    () => BestSellingProductsCubit(
      getIt.get<GetBestSellingProductsUseCase>()
    ),
  );
  // MoreToExploreProductsCubit
  getIt.registerLazySingleton<MoreToExploreProductsCubit>(
    () => MoreToExploreProductsCubit(
      getIt.get<GetAllProductsUseCase>(),
      getIt.get<GetProductsByCategoryUseCase>(),
      getIt.get<GetFavoritesUseCase>()
    ),
  );

  // FavoritesCubit
    getIt.registerLazySingleton<FavoritesCubit>(
    () => FavoritesCubit(
      getIt.get<AddOrRemoveFavoriteUseCase>(),
      getIt.get<GetFavoritesUseCase>()
    ),
  );

  // Category BLoC
  getIt.registerLazySingleton<CategoriesBloc>(
    () => CategoriesBloc(
      usecase: getIt<GetCategoriesUseCase>()),
  );
}