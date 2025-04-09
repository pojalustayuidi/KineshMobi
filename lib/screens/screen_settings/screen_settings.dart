import 'package:KineshmaApp/screens/screen_settings/settings_widgets/container_gradient_text.dart';
import 'package:KineshmaApp/screens/screen_settings/settings_widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String userName;

  const ScreenSettings(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.userName});

  @override
  State<ScreenSettings> createState() => _ScreenSettings();
}

class _ScreenSettings extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ContainergradientText(
              firstName: widget.firstName,
              lastName: widget.lastName,
              userName: widget.userName,
            ),
            SizedBox(
              height: 16,
            ),
            SettingsWidget()
          ],
        ),
      ),
    );
  }
}
