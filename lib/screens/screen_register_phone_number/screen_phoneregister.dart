import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/rectangler.dart';
import 'package:flutter/material.dart';

import 'screen_widget/textphone.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({
    super.key,
  });

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenRegisterUI(
        controller: phoneController,
      ),
    );
  }
}

class ScreenRegisterUI extends StatelessWidget {
  final TextEditingController controller;

  const ScreenRegisterUI({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          IconsLogo(),
          Rectangle(
            controller: controller,
          ),
          Spacer(
            flex: 1,
          ),
          TextPhone(),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
