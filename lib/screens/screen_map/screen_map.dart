import 'package:KineshmaApp/main_widget/temporary_widget.dart';
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               TemporaryWidget()
              ],
            ),
          ),
        );
  }
}