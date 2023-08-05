/// @author think
/// @email TODO
/// @date: 2023.08.05
/// @description: TODO
/// @license: The MIT License

import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('${context.watch<CartProvider>().count}'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CartProvider>().increment();
            },
            child: Text('increase'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CartProvider>().decrement();
            },
            child: Text('decrease'),
          ),
        ],
      ),
    );
  }
}
