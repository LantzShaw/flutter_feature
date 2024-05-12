import 'package:flutter/material.dart';
import 'package:flutter_provider_new/models/logo_model.dart';

class MyProvider extends StatefulWidget {
  final Widget child;
  final LogoModel Function() create;

  const MyProvider({super.key, required this.child, required this.create});

  @override
  State<MyProvider> createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  late LogoModel model;

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
      },
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final LogoModel model;

  MyInheritedWidget({super.key, required this.model, required super.child});

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print('updateShouldNotify!');

    return true;
  }
}
