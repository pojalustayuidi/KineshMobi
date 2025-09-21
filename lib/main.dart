import 'package:KineshmaApp/routes/routes.dart';
import 'package:KineshmaApp/services/data/repositories/user_repositoriy.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final userRepository = UserRepository(prefs);
  final String uniqueUserId = await userRepository.getOrCreateUserId();

  runApp(MyApp(userId: uniqueUserId,
  userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final String userId;
  final UserRepository userRepository;
  const MyApp({super.key, required this.userId, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KineshMobi',
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: '/',
    );
  }
}


