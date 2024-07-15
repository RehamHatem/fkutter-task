import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home/data/DI/injection.dart';
import 'features/home/presentation/bloc/cubit.dart';
import 'features/home/presentation/pages/home_screen.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => CartCubit()), // Add CartCubit
        BlocProvider(create: (_) => getIt<ProductCubit>()..fetchProducts()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),


    );
  }
}


