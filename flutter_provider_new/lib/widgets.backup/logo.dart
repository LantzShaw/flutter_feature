import 'package:flutter/material.dart';
import 'package:flutter_provider_new/models/logo_model.dart';
import 'package:provider/provider.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    LogoModel model = context.watch<LogoModel>();

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
