import 'package:hive/hive.dart';
import 'package:mobile_shop/data/product/models/product_model.dart';
import 'package:mobile_shop/data/product/models/review_model.dart';
import 'package:mobile_shop/data/category/models/category_model.dart';

void registerAdapters() {
	Hive.registerAdapter(ProductModelAdapter());
	Hive.registerAdapter(ReviewModelAdapter());
	Hive.registerAdapter(CategoryModelAdapter());
}
