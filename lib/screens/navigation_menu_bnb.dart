// screen_home.dart
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: selectedIndex,
      onTap: (index)
    {
      onItemTapped(index);
      switch (index) {
    case 0:
    Navigator.pushReplacementNamed(context, '/home');
    break;
    case 1:
      Navigator.pushReplacementNamed(context, '/saved');
    break;
    case 2:
      Navigator.pushReplacementNamed(context, '/map'
    );
        case 3:
          Navigator.pushReplacementNamed(context, '/profile'
          );
    break;
    default:
    break;
  }
      },
      items: const [BottomNavigationBarItem(icon: Icon(Icons.event_note_sharp),label: 'Маршруты'),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: 'Избранное  '),
        BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Карта'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Настройки'),

  ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
