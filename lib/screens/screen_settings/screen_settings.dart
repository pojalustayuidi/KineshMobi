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
  late String _firstName;
  late String _userName;
  late String _lastName;
  @override
  void initState(){
    super.initState();
    _firstName = widget.firstName;
    _lastName = widget.lastName;
    _userName = widget.userName;
  }
  void _updateName(String newFirstName, String newLastName){
    setState(() {
      _firstName = newFirstName;
      _lastName = newLastName;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ContainergradientText(
              firstName: _firstName,
              lastName: _lastName,
              userName: _userName,
            ),
            SizedBox(
              height: 16,
            ),
            SettingsWidget(firstName: _firstName, lastName: _lastName, userName: _userName, onNameChanged: _updateName,)
          ],
        ),
      ),
    );
  }
}
