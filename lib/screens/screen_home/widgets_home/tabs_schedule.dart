import 'package:flutter/material.dart';

class TabsSchedules extends StatefulWidget {
  final Widget nearestWidget;
  final Widget fullScheduleWidget;

  const TabsSchedules({
    super.key,
    required this.nearestWidget,
    required this.fullScheduleWidget,
  });

  @override
  State<TabsSchedules> createState() => _TabsSchedulesState();
}

class _TabsSchedulesState extends State<TabsSchedules> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Color(0xFF333333),
          indicatorColor: Color(0xFF66B58B),
          unselectedLabelColor: Color(0xFF7A8C99),
          tabs: const [
            Tab(text: 'Ближайшие автобусы'),
            Tab(text: 'Полное расписание'),
          ],
        ),
        SizedBox(
          height: 800,
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 32),
                children: [widget.nearestWidget],
              ),
              ListView(
                padding: const EdgeInsets.all(8),
                children: [widget.fullScheduleWidget],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
