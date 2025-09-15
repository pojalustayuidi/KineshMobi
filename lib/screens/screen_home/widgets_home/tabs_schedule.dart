import 'package:flutter/material.dart';

class TabsSchedule extends StatefulWidget {
  const TabsSchedule({super.key});

  @override
  State<TabsSchedule> createState() => _TabsScheduleState();
}

class _TabsScheduleState extends State<TabsSchedule> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text('Ближайшие автобусы'),
          selected: selectedIndex == 0,
          onSelected: (val) {
            setState(() => selectedIndex = 0);
          },
          selectedColor: Color(0xFFEDF3F7),
          labelStyle: TextStyle(
              color: selectedIndex == 0 ? Color(0xFF1F59DF) : Colors.black),
        ),
        SizedBox(
          width: 12,
        ),
        ChoiceChip(
          label: Text('Полное расписание'),
          selected: selectedIndex == 1,
          onSelected: (val) {
            setState(() => selectedIndex = 1);
          },
          selectedColor: Color(0xFFEDF3F7),
          labelStyle: TextStyle(
              color: selectedIndex == 1 ? Color(0xFF1F59DF) : Colors.black),
        ),
      ],
    );
  }
}
