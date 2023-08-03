import 'package:equatable/equatable.dart';

/// @author think
/// @email TODO
/// @date: 2023.08.01
/// @description: TODO
/// @license: The MIT License

class CartItem extends Equatable {
  CartItem(this.id, this.name, this.price);

  final int id;
  final String name;
  final double price;

  @override
  List<Object> get props => [id, name, price];
}
