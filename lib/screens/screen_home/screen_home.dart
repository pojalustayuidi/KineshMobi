import 'package:KineshmaApp/screens/screen_home/widgets_home/text_home_page.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/textfield_stopinput.dart';
import '../../main_widget/iconlogo.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              IconsLogo(),
              // TextHomePage(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextfieldStopinput(
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
