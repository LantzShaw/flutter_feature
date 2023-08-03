part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

final class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

final class CartItemRemoved extends CartEvent {
  CartItemRemoved(this.cartItemId);

  final int cartItemId;

  @override
  List<Object?> get props => [];
}

final class CartItemAdded extends CartEvent {
  final CartItem item;

  const CartItemAdded(this.item);

  @override
  List<Object?> get props => [item];
}

// 使用sealed关键字可以创建封闭类(sealed class)。封闭类只能在同一个库文件中被继承
// 这里,Animal是一个封闭类(sealed class)。只有在同一个文件中,Dog和Cat类才能继承它。如果我们在其他文件中尝试继承Animal,会报错:
// part of 'cart_bloc.dart';
//
// @immutable
// sealed class CartEvent extends Equatable {
// const CartEvent();
// }
//
// final class CartStarted extends CartEvent {
// @override
// List<Object> get props => [];
// }
//
// final class CartItemAdded extends CartEvent {
// const CartItemAdded(this.item);
//
// final Item item;
//
// @override
// List<Object> get props => [item];
// }
//
// final class CartItemRemoved extends CartEvent {
// const CartItemRemoved(this.item);
//
// final Item item;
//
// @override
// List<Object> get props => [item];
// }
