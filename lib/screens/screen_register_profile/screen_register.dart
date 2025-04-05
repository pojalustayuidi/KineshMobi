
import 'package:KineshmaApp/screens/screen_register_profile/screen_RegisterInfoWidget/emailtext.dart';
import 'package:KineshmaApp/screens/screen_register_profile/screen_RegisterInfoWidget/text_widgetl.dart';
import 'package:KineshmaApp/screens/screen_register_profile/screen_RegisterInfoWidget/textfirstnamew.dart';
import 'package:flutter/material.dart';

import 'screen_RegisterInfoWidget/emailform.dart';
import 'screen_RegisterInfoWidget/firstnameform.dart';
import 'screen_RegisterInfoWidget/genderwidget.dart';
import 'screen_RegisterInfoWidget/isreadybutton.dart';
import 'screen_RegisterInfoWidget/lastnameForm.dart';
import 'screen_RegisterInfoWidget/textlastname.dart';

class ScreenRegisterInfo extends StatefulWidget {
  const ScreenRegisterInfo({super.key});

  @override
  State<ScreenRegisterInfo> createState() => _ScreenRegisterInfoState();
}

class ScreenRegisterInfoUI extends StatelessWidget {
  const ScreenRegisterInfoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(),
        SizedBox(
          height: 48,
        ),
        FirstNameText(),
        SizedBox(
          height: 6,
        ),
        FirstNameForm(),
        SizedBox(height: 16),
        LastNameText(),
        SizedBox(
          height: 6,
        ),
        LastNameForm(),
        SizedBox(
          height: 16,
        ),
        // EmailText(),
        SizedBox(
          height: 6,
        ),
        //Gendertext(),
        SizedBox(height: 6,),
        Gender(),
        EmailText(),
        SizedBox(height: 6,),
        EmailForm(),Expanded(child: ReadyButton())
   
      ],
    );
  }
}

class _ScreenRegisterInfoState extends State<ScreenRegisterInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenRegisterInfoUI(),
      appBar: AppBar(),
    );
  }
}
