import 'package:KineshmaApp/screens/navigation_menu_bnb.dart';
import 'package:KineshmaApp/screens/screen_Home/Widgets/textgoodmorning.dart';
import 'package:flutter/material.dart';

class ScreenHomeUI extends StatefulWidget {
  const ScreenHomeUI({super.key});

  @override
  State<ScreenHomeUI> createState() =>
      _ScreenHomeUI();
}

class _ScreenHomeUI extends State<ScreenHomeUI> {
  int selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [WelcomeText()],
      ),
      bottomNavigationBar: MyBottomNavigationBar(selectedIndex: selectedIndex, onItemTapped: _onItemTapped,),
    );
  }
}
