
import 'package:injectable/injectable.dart';

import '../../data/models/Product.dart';
import '../repositories/product_repo.dart';
@injectable
class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
