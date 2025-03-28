import 'package:KineshmaApp/screens/screen_Home/Widgets/textgoodmorning.dart';
import 'package:flutter/material.dart';

import '../navigation_menu_bnb.dart';

class ScreenSavedRasp extends StatefulWidget {
  const ScreenSavedRasp({super.key});

  @override
  State<ScreenSavedRasp> createState() =>
      _ScreenSavedRasp();
}

class _ScreenSavedRasp extends State<ScreenSavedRasp> {
  int selectedIndex = 1;
  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(

    ),
      body: Column(
        children: [WelcomeText()],
      ),
      bottomNavigationBar: MyBottomNavigationBar(selectedIndex: selectedIndex, onItemTapped: _onItemTapped),);
  }}
