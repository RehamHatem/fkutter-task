import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(product.thumbnail!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(product.description!),
                          Text('Price: EGP ${product.price}'),
                          Text('Rating: ${product.rating}'),
                          Text('Stock: ${product.stock}'),
                          Text('Category: ${product.category}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No products found'));
        }
      },
    );
  }
}
