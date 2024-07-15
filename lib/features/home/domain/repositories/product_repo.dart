import '../../data/models/Product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
