import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/cart.dart';
import '../../data/DI/injection.dart';
import '../bloc/cubit.dart';
import 'item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text('Route',style: TextStyle(
          color: Color(0xff072e81),fontSize: 30
        ),),
        backgroundColor: Colors.white,

      ),
      body: BlocProvider(
        create: (_) => getIt<ProductCubit>()..fetchProducts(),
        child: Padding(
          padding: const EdgeInsets.only(top:8 ,left:10 ,right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What do you search for?',
                          prefixIcon: Icon(Icons.search,color: Color(0xff072e81),size: 25,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,

                          ),
                          focusedBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(25),borderSide: BorderSide(color: Color(0xff072e81)) ) ,

                          enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(25),borderSide: BorderSide(color: Color(0xff072e81)) ),
                          fillColor: Colors.grey[200],
                        ),

                      ),
                    ),
                    Expanded(
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart_outlined,size: 30,color: Color(0xff072e81),),
                      onPressed: () {
                        // Handle cart action
                      },
                    ),
                                            ),
                  ],
                ),
              ),
              Expanded(
                child: Item(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
