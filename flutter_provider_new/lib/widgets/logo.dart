import 'package:flutter/material.dart';
import 'package:flutter_provider_new/models/change_notifier_provider.dart';
import 'package:flutter_provider_new/models/logo_model.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    // 监听
    // final model =
    //     context.dependOnInheritedWidgetOfExactType<LogoMoelProvider>()!.model;

    // 读取
    // final model =
    //     context.getInheritedWidgetOfExactType<LogoMoelProvider>()!.model;

    // final model = MyInheritedWidget.of(context).model;
    final model = context.watch<LogoModel>();

    return Card(
      child: Transform.flip(
        flipX: model.flipX,
        flipY: model.flipY,
        child: FlutterLogo(
          size: model.size,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_provider_new/models/logo_model_provider.dart';
//
// class Logo extends StatefulWidget {
//   const Logo({super.key});
//
//   @override
//   State<Logo> createState() => _LogoState();
// }
//
// class _LogoState extends State<Logo> {
//   @override
//   Widget build(BuildContext context) {
//     // final model =
//     //     context.dependOnInheritedWidgetOfExactType<LogoMoelProvider>()!.model;
//
//     final model = MyInheritedWidget.of(context).model;
//
//     return ListenableBuilder(
//         listenable: model,
//         builder: (BuildContext context, Widget? child) {
//           return Card(
//             child: Transform.flip(
//               flipX: model.flipX,
//               flipY: model.flipY,
//               child: FlutterLogo(
//                 size: model.size,
//               ),
//             ),
//           );
//         });
//   }
// }
