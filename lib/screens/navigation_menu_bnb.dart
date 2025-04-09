  import 'package:KineshmaApp/screens/screen_Home/screen_home.dart';
  import 'package:KineshmaApp/screens/screen_favourites/screen_mysavedschule.dart';
  import 'package:KineshmaApp/screens/screen_settings/screen_account.dart';
  import 'package:flutter/material.dart';
  import 'package:KineshmaApp/screens/screen_map/screen_map.dart';

  class MainNavigationWrapper extends StatefulWidget {
    final String firstName;
    final String lastName;

    const MainNavigationWrapper(
        {super.key, required this.firstName, required this.lastName});

    @override
    State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
  }

  class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
    int _currentIndex = 0;
    late final List<Widget> _screens;

    @override
    void initState() {
      super.initState();
      _screens = [
        ScreenHomeContent(firstName: widget.firstName, lastName: widget.lastName),
        const ScreenSavedRasp(),
        const ScreenMap(),
        const ScreenSettings()
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
              icon: Icon(Icons.directions_bus),
              label: 'Маршруты',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Карта',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Настройки',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      );
    }
  }
