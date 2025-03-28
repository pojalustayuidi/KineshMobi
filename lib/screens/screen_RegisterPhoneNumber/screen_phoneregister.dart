
import 'package:KineshmaApp/screens/screen_RegisterPhoneNumber/screen_widget/iconlogo.dart';
import 'package:KineshmaApp/screens/screen_RegisterPhoneNumber/screen_widget/phonenumberform.dart';
import 'package:KineshmaApp/screens/screen_RegisterPhoneNumber/screen_widget/rectangler.dart';
import 'package:flutter/material.dart';

import 'screen_widget/textphone.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class ScreenRegisterUI extends StatelessWidget {
  const ScreenRegisterUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [SizedBox(height: 40,),IconsLogo(),
            Rectangle(), Spacer(flex: 1,),TextPhone(), SizedBox(height: 40,)
          ],
      ),
    );
  }
}




class _ScreenRegisterState extends State<ScreenRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenRegisterUI(),
    );
  }
}

