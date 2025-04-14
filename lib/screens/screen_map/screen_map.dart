import 'package:KineshmaApp/screens/screen_map/widgets_map/text_where_you_map_widget.dart';
import 'package:flutter/material.dart';

class ScreenMap extends StatefulWidget {

  const ScreenMap({super.key, });

  @override
  State<ScreenMap> createState() => _ScreenMap();
}

class _ScreenMap extends State<ScreenMap> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    height: 300,
                    width: 300,
                  ),
                  TextWhereYouMapWidget(),
                ],
              ),
            ),
          ),
        );
  }
}