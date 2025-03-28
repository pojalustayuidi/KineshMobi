import 'package:KineshmaApp/screens/screen_Home/Widgets/textgoodmorning.dart';
import 'package:flutter/material.dart';

import '../navigation_menu_bnb.dart';

class ScreenMap extends StatefulWidget {
  const ScreenMap({super.key});

  @override
  State<ScreenMap> createState() =>
      _ScreenMap();
}

class _ScreenMap extends State<ScreenMap> {
  int selectedIndex = 2;
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
        children: [WelcomeText(),Container(color: Colors.yellow, height: 300,width: 300,)],
      ),
      bottomNavigationBar: MyBottomNavigationBar(selectedIndex: selectedIndex, onItemTapped: _onItemTapped),);
  }}
