import 'package:KineshmaApp/MainWidget/imageprofile.dart';
import 'package:KineshmaApp/MainWidget/text.dart';
import 'package:KineshmaApp/screens/screen_Home/Widgets/textgoodmorning.dart';
import 'package:flutter/material.dart';

import '../navigation_menu_bnb.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() =>
      _ScreenSettings();
}

class _ScreenSettings extends State<ScreenSettings> {
  int selectedIndex = 3;
  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(

    ),


      body: Stack(
        children: [ImageSettings(),TextEmail(),],
      ),
      bottomNavigationBar: MyBottomNavigationBar(selectedIndex: selectedIndex, onItemTapped: _onItemTapped),);
  }}
