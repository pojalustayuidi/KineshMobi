import 'package:KineshmaApp/screens/screen_home/widgets_home/textgoodmorning.dart';
import 'package:flutter/material.dart';

import '../screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:firebase_core/firebase_core.dart';

class ScreenHomeContent extends StatefulWidget {
  final String firstName;
  final String lastName;
  const ScreenHomeContent(
      {super.key, required this.firstName, required this.lastName,});

  @override
  State<ScreenHomeContent> createState() => _ScreenHomeContentState();
}

class _ScreenHomeContentState extends State<ScreenHomeContent> {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: (SafeArea(
          child: Column(
              children: [
            SizedBox(
              height: 16,
            ),
            IconsLogo(),
            WelcomeText(firstName:widget.firstName, lastName: widget.lastName,),
          ]),
        )),
      ),
    );
  }
}
