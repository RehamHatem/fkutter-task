import '../../data/models/Products.dart';

abstract class ProductState  {
  ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Products> products;

  ProductSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);

  @override
  List<Object> get props => [message];
}