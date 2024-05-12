import 'package:flutter/material.dart';
import 'package:flutter_provider_new/models/change_notifier_provider.dart';
import 'package:flutter_provider_new/models/logo_model.dart';
import 'package:flutter_provider_new/widgets/control_panel.dart';
import 'package:flutter_provider_new/widgets/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: () => LogoModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo(),
                ControlPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
