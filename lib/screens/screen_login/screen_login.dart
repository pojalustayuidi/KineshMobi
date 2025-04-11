import 'package:KineshmaApp/screens/navigation_menu_bnb.dart';
import 'package:KineshmaApp/screens/screen_login/widgets_login/rectangler.dart';
import 'package:KineshmaApp/screens/screen_login/widgets_login/text_login_widget.dart';
import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:KineshmaApp/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({
    super.key,
  });

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendVerificationCode() async {
    setState(() => _isLoading = true);
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    if (_usernameController.text.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Введите Логин и пароль"),
        ),
      );
      setState(() => _isLoading = false);
      return;
    }
    try {
      bool loginSuccess = await AuthService.login(
          _usernameController.text, _passwordController.text);
      if (loginSuccess) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(_usernameController.text)
            .get();

        if (userDoc.exists) {
          final data = userDoc.data() as Map<String, dynamic>;
          String firstName = data['firstName'] ?? _usernameController.text;
          String lastName = data['lastName'] ?? '';

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Вход прошел успешно')));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MainNavigationWrapper(userName: _usernameController.text),
            ),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Вход совершен успешно')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Неверный логин или пароль')));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ошибка $e")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              IconsLogo(),
              RectangleLogin(
                usernameController: _usernameController,
                passwordController: _passwordController,
                onSubmit: _sendVerificationCode,
                isLoading: _isLoading,
              ),
              Spacer(
                flex: 1,
              ),
              TextDontHaveAccount(),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
