import 'package:KineshmaApp/screens/screen_Home/screen_home.dart';
import 'package:KineshmaApp/screens/screen_favourites/screen_mysavedschule.dart';
import 'package:KineshmaApp/screens/screen_map/screen_map.dart';
import 'package:KineshmaApp/screens/screen_settings/screen_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainNavigationWrapper extends StatelessWidget {
  final String userName;

  const MainNavigationWrapper({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    if (userName.isEmpty){
    }
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userName)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Пользователь не найден'));
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        String firstName = data['firstName'] ?? userName;
        String lastName = data['lastName'] ?? '';

        return MainNavigationContent(
            firstName: firstName, lastName: lastName, userName: userName);
      },
    );
  }
}

class MainNavigationContent extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String userName;

  const MainNavigationContent({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.userName,
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
      ScreenHomeContent(userName: widget.userName),
      const ScreenSavedRasp(),
      ScreenMap(userName: widget.userName,),
      ScreenSettings(
          userName: widget.userName),
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
              icon: Icon(Icons.favorite), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Карта'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Настройки'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
