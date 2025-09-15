import 'package:KineshmaApp/screens/screen_settings/settings_widgets/container_gradient_text.dart';
import 'package:KineshmaApp/screens/screen_settings/settings_widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {

  const ScreenSettings({super.key, });

  @override
  Widget build(BuildContext context) {

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 40),
                ContainergradientText(),
                const SizedBox(height: 40),
                SettingsWidget(
                ),
              ],
            ),
          ),
    );
  }
}
