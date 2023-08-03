/// @author think
/// @email TODO
/// @date: 2023.08.01
/// @description: TODO
/// @license: The MIT License

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/models/cart/cart_item.dart';

class Cart extends Equatable {
  // const Cart({this.items = const <CartItem>[]});
  const Cart({required this.items});

  final List<CartItem> items;

  @override
  List<Object?> get props => [items];
}
