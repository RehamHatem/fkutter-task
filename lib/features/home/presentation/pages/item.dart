import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/cart.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';

class Item extends StatefulWidget {
   Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Map<int, bool> itemc = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductSuccess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              final originalPrice =
                  product.price / (1 - product.discountPercentage / 100);
              if (!itemc.containsKey(product.id)) {
                itemc[product.id] = false;
              }
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xff072e81), width: .5),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10.0)),
                          child: Image.network(
                            product.thumbnail,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff072e81),
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xff072e81),
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Text(
                                    'EGP ${product.price}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff072e81),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${originalPrice.toStringAsFixed(2)} EGP",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.blueAccent,
                                        decorationThickness: 2,

                                        color: Colors.blueAccent,
                                        fontSize: 11),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Review (${product.rating})',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xff072e81),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Colors.amber,
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    child: FloatingActionButton(
                                        onPressed: () {

                                        },
                                        backgroundColor: Color(0xff072e81),
                                        mini: true,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,

                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {

                            setState(() {
                              itemc[product.id] = !itemc[product.id]!;
                            });

                          },
                          icon: Icon(
                            itemc[product.id]!
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: itemc[product.id]!
                                ? Colors.red
                                : Color(0xff072e81),
                          )),
                    ),
                  ),
                ],
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
