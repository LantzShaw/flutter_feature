part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  const CartLoaded({
    this.cart = const Cart(items: <CartItem>[]),
  });

  final Cart cart;

  @override
  List<Object> get props => [cart];
}

final class CartError extends CartState {
  @override
  List<Object> get props => [];
}
