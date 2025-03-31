import 'package:KineshmaApp/routes/routes.dart';
import 'package:KineshmaApp/screens/screen_Home/screen_home.dart';
import 'package:KineshmaApp/screens/screen_account/screen_account.dart';
import 'package:KineshmaApp/screens/screen_map/screen_map.dart';
import 'package:KineshmaApp/screens/screen_mysavedschule/screen_mysavedschule.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: '/',
    );
  }
}


