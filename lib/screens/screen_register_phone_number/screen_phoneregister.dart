import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/rectangler.dart';
import 'package:KineshmaApp/screens/screen_register_profile/screen_register.dart';
import 'package:KineshmaApp/services/auth_service.dart';

import 'package:flutter/material.dart';

import 'screen_widget/textphone.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({
    super.key,
  });

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendVerificationCode() async {
    setState(() => _isLoading = true);
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
      await AuthService.register(
          _usernameController.text, _passwordController.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Регистрация прошла успешна')));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenRegisterInfo(
            username: _usernameController.text,
            userId: _usernameController.text,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ошибка $e")));
    }finally{
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            IconsLogo(),
            SizedBox(height: 16,),
            Rectangle(
              usernameController: _usernameController,
              passwordController: _passwordController,
              onSubmit: _sendVerificationCode,
              isLoading: _isLoading,
            ),
            Spacer(
              flex: 1,
            ),
            TextPhone(),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
