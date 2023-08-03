/// @author think
/// @email TODO
/// @date: 2023.07.31
/// @description: TODO
/// @license: The MIT License

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/cart/cart_bloc.dart';
import 'package:flutter_bloc_demo/models/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final item = state.cart.items[0];
        }

        return Scaffold(
          body: Center(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    context.read<CartBloc>().add(CartItemRemoved(12));
                  },
                  child: const Text(
                    '删除',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                          CartItemAdded(
                            CartItem(1, 'Fancy', 20.0),
                          ),
                        );
                  },
                  child: const Text('加入购物车'),
                ),
                ElevatedButton(
                  onPressed: () => null,
                  child: Text('Button 2'),
                ),
                const Card(
                  color: Colors.red,
                  child: Text('Cart'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
