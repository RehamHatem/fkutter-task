import 'dart:convert';
import 'package:flutter_task/features/home/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final http.Client client;

  ProductRepositoryImpl(this.client);

  @override
  Future<List<Product>> getProducts() async {
    final response = await client.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final List productsJson = json.decode(response.body)['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
