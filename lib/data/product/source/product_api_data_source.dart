import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_shop/core/result.dart';
import 'package:mobile_shop/data/product/models/product.dart';

abstract class ProductApiDataSource {
  Future<Result<List<ProductModel>>> getBestSellingProducts();
  Future<Result<List<ProductModel>>> getAllProducts(int page,int size);
  Future<Result<List<ProductModel>>> getProductsByCategory(int page,int size,String categoryName);
  Future<Result<ProductModel>> getProductById(int id);
}

class ProductApiDataSourceImpl extends ProductApiDataSource{
  Future<Result<List<ProductModel>>> _getProducts(String endpoint) async {
    try {
      final uri = Uri.parse(endpoint);
      final response = await http.get(uri);

      if(response.statusCode == 404){
        return Result.ok([]);
      }

      if (response.statusCode == 200) {
        final List<dynamic> decoded = json.decode(response.body)['results'];
        // debugPrint("Length = ${decoded.length}");
        // for (var element in decoded) {
        //   debugPrint(element.toString());
        // }
        final products = decoded
            .map((item) => ProductModel.fromMap(item as Map<String, dynamic>))
            .toList();
        return Result.ok(products);
      } else {
        return Result.error('Server responded with status code: ${response.statusCode}');
      }
    } on SocketException {
      debugPrint('No internet connection.');
      return Result.error('No internet connection.');
    } on TimeoutException {
      debugPrint('Request timed out.');
      return Result.error('Request timed out.');
    } catch (e) {
      debugPrint('Error: $e');
      return Result.error('An error occurred: $e');
    }
  }

  @override
  Future<Result<List<ProductModel>>> getAllProducts(int page, int size) {
    return _getProducts("http://mobile-shop-api.hiring.devebs.net/products?page=$page&page_size=$size");
  }

  @override
  Future<Result<List<ProductModel>>> getBestSellingProducts() {
    return _getProducts("http://mobile-shop-api.hiring.devebs.net/products/best-sold-products");
  }

  @override
  Future<Result<ProductModel>> getProductById(int id) async {
    try {
      debugPrint("############ id = $id ###########");
      final String endpoint = "http://mobile-shop-api.hiring.devebs.net/products/$id";
      final uri = Uri.parse(endpoint);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decoded = json.decode(response.body) as Map<String, dynamic>;
        debugPrint("############ decoded = $decoded ###########");
        final product = ProductModel.fromMap(decoded);
        debugPrint("############ producs = ${product.toString()} ###########");
        return Result.ok(product);
      } else {
        return Result.error('Server responded with status code: ${response.statusCode}');
      }
    } on SocketException {
      debugPrint('No internet connection.');
      return Result.error('No internet connection.');
    } on TimeoutException {
      debugPrint('Request timed out.');
      return Result.error('Request timed out.');
    } catch (e) {
      debugPrint('Error: $e');
      return Result.error('An error occurred: $e');
    }
  }

  @override
  Future<Result<List<ProductModel>>> getProductsByCategory(int page,int size, String categoryName) async {
    try {
      final encodedCategory = Uri.encodeQueryComponent(categoryName);
      final String endpoint = "http://mobile-shop-api.hiring.devebs.net/products?search=$encodedCategory&page=$page&page_size=$size";
      return await _getProducts(endpoint);
    } on SocketException {
      debugPrint('No internet connection.');
      return Result.error('No internet connection.');
    } on TimeoutException {
      debugPrint('Request timed out.');
      return Result.error('Request timed out.');
    } catch (e) {
      debugPrint('Error: $e');
      return Result.error('An error occurred: $e');
    }
  }
  
}