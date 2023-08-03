import 'package:flutter_bloc_demo/models/cart/cart_item.dart';

/// @author think
/// @email TODO
/// @date: 2023.08.02
/// @description: TODO
/// @license: The MIT License

const _delay = Duration(microseconds: 1000);
const _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class ShoppingRepository {
  final _items = <CartItem>[];

  Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<void> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(CartItem item) => _items.add(item);

  void removeItemFromCart(CartItem item) => _items.remove(item);
}
