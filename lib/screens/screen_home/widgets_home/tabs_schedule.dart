import 'package:KineshmaApp/screens/screen_home/widgets_home/textfield_stopinput.dart';
import 'package:flutter/material.dart';

import '../../../services/data/repositories/api_stops.dart';

class TabsSchedule extends StatefulWidget {
  final ApiStops apiStops;

  const TabsSchedule({
    super.key,
    required this.apiStops,
  });

  @override
  State<TabsSchedule> createState() => _TabsScheduleState();
}

class _TabsScheduleState extends State<TabsSchedule> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFEDF3F7),
                borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const TabBar(
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                labelColor: Color(0xFF1F59DF),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Ближайший автобус',
                  ),
                  Tab(
                    text: 'Полное расписание',
                  )
                ]),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(children: [
              TextfieldStopinput(apiStops: widget.apiStops, mode: "nearest"),
              TextfieldStopinput(mode: "full", apiStops: widget.apiStops)
            ]),
          )
        ]));
  }
}
