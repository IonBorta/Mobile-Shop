import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/category/models/category.dart';

abstract class CategoryApiDataSource {
  Future<Result<List<CategoryModel>>> getCategories();
}
class CategoryApiDataSourceImpl extends CategoryApiDataSource{
  @override
  Future<Result<List<CategoryModel>>> getCategories() async{
    try {
      final uri = Uri.parse('http://mobile-shop-api.hiring.devebs.net/categories');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        debugPrint("status code = 200");
        final List<dynamic> decoded = json.decode(response.body)['results'];
        for (var element in decoded) {
          print(element);
        }
        final categories = decoded
            .map((item) => CategoryModel.fromMap(item as Map<String, dynamic>))
            .toList();
        return Result.ok(categories);
      } else {
        return Result.error('Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.error('An error occurred: $e');
    }
  }

}