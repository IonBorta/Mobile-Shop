import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_shop/data/category/repository/category_impl.dart';
import 'package:mobile_shop/data/category/source/category_api_data_source.dart';
import 'package:mobile_shop/domain/category/usecases/get_categories.dart';
import 'package:mobile_shop/presentation/bloc/categories_bloc.dart';
import 'package:mobile_shop/presentation/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: //MainPage()
      MultiBlocProvider(
        providers:[
          BlocProvider<CategoriesBloc>(
            create: (context) => CategoriesBloc(
              usecase: GetCategoriesUseCase(categoryRepository: CategoryRepositoryImpl(categoryApiDataSource: CategoryApiDataSourceImpl()))
            ), // Incarca categoriile imediat
          )
        ], 
        child: MainPage(),
      )
    );
  }
}
