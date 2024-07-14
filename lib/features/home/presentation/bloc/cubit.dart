import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/bloc/states.dart';

import '../../domain/repositories/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await productRepository.getProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}