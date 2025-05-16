import 'package:KineshmaApp/screens/screen_account/widget_account/my_name_widget.dart';
import 'package:KineshmaApp/screens/screen_account/widget_account/my_password_widget.dart';
import 'package:flutter/material.dart';

class ScreenAccount extends StatefulWidget {

  const ScreenAccount(
      {super.key,
      });

  @override
  State<ScreenAccount> createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyNameWidget(
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          // MyGenderWidget(gender: '', userId: '',),
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
