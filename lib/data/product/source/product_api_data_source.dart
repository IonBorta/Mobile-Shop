import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/product/models/product.dart';

abstract class ProductApiDataSource {
  Future<Result<List<ProductModel>>> getBestSellingProducts();
  Future<Result<List<ProductModel>>> getAllProducts();
  Future<Result<List<ProductModel>>> getProductsByCategory();
  Future<Result<ProductModel>> getProductById();
}

class ProductApiDataSourceImpl extends ProductApiDataSource{
  @override
  Future<Result<List<ProductModel>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ProductModel>>> getBestSellingProducts() async {
    try {
      final uri = Uri.parse('http://mobile-shop-api.hiring.devebs.net/products/best-sold-products');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        debugPrint("status code = 200");
        final List<dynamic> decoded = json.decode(response.body)['results'];
        for (var element in decoded) {
          print(element);
        }
        final products = decoded
            .map((item) => ProductModel.fromMap(item as Map<String, dynamic>))
            .toList();
        return Result.ok(products);
      } else {
        return Result.error('Server responded with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
      return Result.error('An error occurred: $e');
    }
  }

  @override
  Future<Result<ProductModel>> getProductById() {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ProductModel>>> getProductsByCategory() {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }
  
}