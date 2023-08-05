/// @author think
/// @email TODO
/// @date: 2023.08.05
/// @description: TODO
/// @license: The MIT License

import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;

    notifyListeners();
  }

  void decrement() {
    _count--;

    notifyListeners();
  }
}
