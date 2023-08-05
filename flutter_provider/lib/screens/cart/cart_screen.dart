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
    void _increaseHandler() {
      context.read<CartProvider>().increment();
    }

    void _decreaseHandler() {
      context.read<CartProvider>().decrement();
    }

    void _onBottomNavigationBarTap(int index) {
      print('$index');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Flutter Provider',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text('${context.watch<CartProvider>().count}'),
          ),
          ElevatedButton(
            onPressed: _increaseHandler,
            child: Text('increase'),
          ),
          ElevatedButton(
            onPressed: _decreaseHandler,
            child: Text('decrease'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        onTap: _onBottomNavigationBarTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Home',
          )
        ],
      ),
    );
  }
}
