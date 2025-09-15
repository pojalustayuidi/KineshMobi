import 'package:KineshmaApp/screens/screen_Home/screen_home.dart';
import 'package:KineshmaApp/screens/screen_favourites/screen_mysavedschule.dart';
import 'package:KineshmaApp/screens/screen_map/screen_map.dart';
import 'package:KineshmaApp/screens/screen_settings/screen_settings.dart';
import 'package:KineshmaApp/screens/screen_stops/screen_stops.dart';
import 'package:flutter/material.dart';

class MainNavigationWrapper extends StatelessWidget {
  final String userName;

  const MainNavigationWrapper({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return MainNavigationContent();
  }
}

class MainNavigationContent extends StatefulWidget {
  const MainNavigationContent({
    super.key,
  });

  @override
  State<MainNavigationContent> createState() => _MainNavigationContentState();
}

class _MainNavigationContentState extends State<MainNavigationContent> {
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      ScreenHomeContent(),
      const ScreenSavedRasp(),
      ScreenMap(),
      ScreenSettings(),
      ScreenStops(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus), label: 'Маршруты'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.map_sharp), label: 'Карта'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Настройки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Остановки ')
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
