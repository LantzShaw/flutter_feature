import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends Listenable> extends StatefulWidget {
  final T Function() create;
  final Widget child;

  const ChangeNotifierProvider(
      {super.key, required this.child, required this.create});

  @override
  State<ChangeNotifierProvider> createState() => _MyProviderState<T>();

  static T of<T>(BuildContext context, {required bool listen}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_MyInheritedWidget<T>>()!
          .model;
    } else {
      return context
          .getInheritedWidgetOfExactType<_MyInheritedWidget<T>>()!
          .model;
    }
  }
}

class _MyProviderState<T extends Listenable>
    extends State<ChangeNotifierProvider<T>> {
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
        return _MyInheritedWidget(
          model: model,
          child: widget.child,
        );
      },
    );
  }
}

class _MyInheritedWidget<T> extends InheritedWidget {
  final T model;

  _MyInheritedWidget({super.key, required this.model, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print('updateShouldNotify!');

    return true;
  }
}

/// 这个拓展没有取名字，表示只能在这个文件中使用
// extension on BuildContext {
//   T watch<T>() => ChangeNotifierProvider.of(this)!.model;
// }

/// 这个拓展在别的地方可可以使用
extension Consumer on BuildContext {
  T watch<T>() => ChangeNotifierProvider.of(this, listen: true);
  T read<T>() => ChangeNotifierProvider.of(this, listen: false);
}
