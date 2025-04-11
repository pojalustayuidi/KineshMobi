import 'package:KineshmaApp/screens/screen_account/widget_account/my_gender_widget.dart';
import 'package:KineshmaApp/screens/screen_account/widget_account/my_name_widget.dart';
import 'package:KineshmaApp/screens/screen_account/widget_account/my_password_widget.dart';
import 'package:flutter/material.dart';

class ScreenAccount extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String userName;

  const ScreenAccount(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.userName});

  @override
  State<ScreenAccount> createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {
  late String _firstName;
  late String _lastName;

  @override
  void initState() {
    super.initState();
    _firstName = widget.firstName;
    _lastName = widget.lastName;
  }

  void _updateName(String newFirstName, String newLastName) {
    setState(() {
      _firstName = newFirstName;
      _lastName = newLastName;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyNameWidget(
            firstName: _firstName,
            lastName: _lastName,
            onNameChanged: _updateName,
            userName: widget.userName,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          MyGenderWidget(gender: '', userId: '',),
          SizedBox(
            height: 10,
          ),
          Divider(),
          MyPasswordWidget()
        ],
      ),
      appBar: AppBar(
        title: Text('Настройки'),
      ),
    );
  }
}
