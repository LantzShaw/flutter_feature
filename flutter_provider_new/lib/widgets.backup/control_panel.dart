import 'package:flutter/material.dart';
import 'package:flutter_provider_new/models/logo_model.dart';
import 'package:provider/provider.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    final LogoModel model = context.watch<LogoModel>();

    return Card(
      margin: EdgeInsets.only(top: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Flip X：'),
                Switch(
                  value: model.flipX,
                  onChanged: (value) => model.flipX = value,
                ),
                Text('Flip Y: '),
                Switch(
                  value: model.flipY,
                  onChanged: (value) => model.flipY = value,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Size: of'),
                Slider(
                  min: 58,
                  max: 300,
                  value: model.size,
                  onChanged: (value) => model.size = value,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
