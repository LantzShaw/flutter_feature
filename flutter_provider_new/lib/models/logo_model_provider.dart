import 'package:flutter/material.dart';

class MyProvider<T extends Listenable> extends StatefulWidget {
  final T Function() create;
  final Widget child;

  const MyProvider({super.key, required this.child, required this.create});

  @override
  State<MyProvider> createState() => _MyProviderState<T>();
}

class _MyProviderState<T extends Listenable> extends State<MyProvider<T>> {
  late T model;

  @override
  void initState() {
    super.initState();

    model = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: model,
        builder: (BuildContext context, Widget? child) {
          return MyInheritedWidget(
            model: model,
            child: widget.child,
          );
        });
  }
}

class MyInheritedWidget<T> extends InheritedWidget {
  final T model;

  MyInheritedWidget({super.key, required this.model, required super.child});

  static MyInheritedWidget of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget<T>>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print('updateShouldNotify');

    return true;
  }
}
