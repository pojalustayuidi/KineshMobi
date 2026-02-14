import 'package:KineshmaApp/screens/screen_home/widgets_home/stop_routes_panel_widget.dart';
import 'package:flutter/material.dart';
import '../../services/data/repositories/api_stops.dart';

class ScreenHomeContent extends StatefulWidget {
  const ScreenHomeContent({super.key});

  @override
  State<ScreenHomeContent> createState() => _ScreenHomeContentState();
}

class _ScreenHomeContentState extends State<ScreenHomeContent> {
  final apiStops = ApiStops();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFF7FBFD),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: AppBar(
          backgroundColor: Color(0xFFF7FBFD),
          elevation: 1,
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: StopRoutesPanel(
                  apiStops: apiStops,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
