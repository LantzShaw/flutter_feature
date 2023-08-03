import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/cart/cart_bloc.dart';
import 'package:flutter_bloc_demo/screens/cart/cart_screen.dart';
import 'package:flutter_bloc_demo/shopping_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final shoppingRepository = ShoppingRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartBloc(shoppingRepository: shoppingRepository)
            ..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CartScreen(),
      ),
    );
  }
}
