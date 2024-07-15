import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/bloc/states.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_products.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;

  ProductCubit(this.getProducts) : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await getProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}