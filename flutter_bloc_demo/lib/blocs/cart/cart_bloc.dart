import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demo/models/cart/cart.dart';
import 'package:flutter_bloc_demo/models/cart/cart_item.dart';
import 'package:flutter_bloc_demo/shopping_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartStarted>(_onStarted);
    on<CartItemRemoved>(_onItemRemoved);
    on<CartItemAdded>(_onItemAdded);
  }

  final shoppingRepository = ShoppingRepository();

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    final state = this.state;
  }

  Future<void> _onItemRemoved(
      CartItemRemoved event, Emitter<CartState> emit) async {
    final state = this.state;

    emit(CartLoading());

    if (state is CartLoaded) {
      try {
        // shoppingRepository.removeItemFromCart(event.cartItemId)

        emit(
          CartLoaded(
            cart: Cart(
              items: [...state.cart.items]
                  .where((item) => item.id != event.cartItemId)
                  .toList(),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  Future<void> _onItemAdded(
      CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;

    emit(CartLoading());

    if (state is CartLoaded) {
      try {
        shoppingRepository.addItemToCart(event.item);
        emit(CartLoaded(cart: Cart(items: [...state.cart.items, event.item])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  // Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
  //   emit(CartLoading());
  //   try {
  //     final items = await shoppingRepository.loadCartItems();
  //     emit(CartLoaded(cart: Cart(items: [...items])));
  //   } catch (_) {
  //     emit(CartError());
  //   }
  // }
}

// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
//     on<CartStarted>(_onStarted);
//     on<CartItemAdded>(_onItemAdded);
//     on<CartItemRemoved>(_onItemRemoved);
//   }
//
//   final ShoppingRepository shoppingRepository;
//
//   Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
//     emit(CartLoading());
//     try {
//       final items = await shoppingRepository.loadCartItems();
//       emit(CartLoaded(cart: Cart(items: [...items])));
//     } catch (_) {
//       emit(CartError());
//     }
//   }
//
//   Future<void> _onItemAdded(
//       CartItemAdded event,
//       Emitter<CartState> emit,
//       ) async {
//     final state = this.state;
//     if (state is CartLoaded) {
//       try {
//         shoppingRepository.addItemToCart(event.item);
//         emit(CartLoaded(cart: Cart(items: [...state.cart.items, event.item])));
//       } catch (_) {
//         emit(CartError());
//       }
//     }
//   }
//
//   void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
//     final state = this.state;
//     if (state is CartLoaded) {
//       try {
//         shoppingRepository.removeItemFromCart(event.item);
//         emit(
//           CartLoaded(
//             cart: Cart(
//               items: [...state.cart.items]..remove(event.item),
//             ),
//           ),
//         );
//       } catch (_) {
//         emit(CartError());
//       }
//     }
//   }
// }
