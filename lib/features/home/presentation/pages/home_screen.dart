import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import 'item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart action
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => getIt<ProductCubit>()..fetchProducts(),
        child: Item(),
      ),
    );
  }
}
