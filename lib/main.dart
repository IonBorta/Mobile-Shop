import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_shop/connectivity_wrapper.dart';
import 'package:mobile_shop/data/category/models/category_model.dart';
import 'package:mobile_shop/data/product/models/product_model.dart';
import 'package:mobile_shop/data/product/models/review_model.dart';
import 'package:mobile_shop/di/dependency_injection.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';
import 'package:mobile_shop/presentation/cubit/favorites_cubit.dart';
import 'package:mobile_shop/presentation/cubit/product_cubit.dart';
import 'package:mobile_shop/presentation/pages/favorite/favorite_page.dart';
import 'package:mobile_shop/presentation/pages/main/main_page.dart';
import 'package:mobile_shop/presentation/pages/product_details/product_details_page.dart';
import 'package:mobile_shop/presentation/pages/profile/profile_page.dart';
import 'package:mobile_shop/route_tracking_observer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ReviewModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  await setupDi();
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesBloc>.value(
          value: getIt.get<CategoriesBloc>(),
        ),
        BlocProvider<BestSellingProductsCubit>.value(
          value: getIt.get<BestSellingProductsCubit>(),
        ),
        BlocProvider<MoreToExploreProductsCubit>.value(
          value: getIt.get<MoreToExploreProductsCubit>(),
        ),
        BlocProvider<ProductDetailsCubit>.value(
          value: getIt<ProductDetailsCubit>(),
        ),
        BlocProvider<FavoritesCubit>.value(
          value: getIt.get<FavoritesCubit>(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
        initialRoute: '/',
        routes: {
          '/': (context) => ConnectivityWrapper(child: MainPage()),
          '/details': (context) => const ProductDetailsPage(),
          '/favorites': (context) => const FavoriteProductsPage(),
          '/profile': (context) => const ProfilePage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(),
        ),
      ),
    );
  }
}
