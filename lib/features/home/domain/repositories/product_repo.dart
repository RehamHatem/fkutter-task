import '../../data/models/Products.dart';

abstract class ProductRepository {
  Future<List<Products>> getProducts();
}
