import 'dart:math';
import 'package:KineshmaApp/screens/screen_login/widgets_login/text_login_widget.dart';
import 'package:flutter/material.dart';
import '../../screen_register_phone_number/screen_widget/continuebutton.dart';
import '../../screen_register_phone_number/screen_widget/email_form_field.dart';

class RectangleLogin extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final bool isLoading;

  const RectangleLogin({
    super.key,
    required this.usernameController,
    required this.onSubmit,
    required this.isLoading,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = max(16.0, screenSize.width * 0.07);
    final bottomPadding = max(16.0, screenSize.height * 0.010);
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        color: Color(0xFFDADADA),
        width: screenWidth * 0.90,
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextLogin(),
            SizedBox(height: 8),
            Text(
              "Введите ваш логин и пароль, если вы уже регистрировались",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            EmailForm(
              usernameController: usernameController,
              passwordController: passwordController,
            ),
            SizedBox(height: 16),
            ContinueButton(
              text: 'Войти',
              onPressed: onSubmit,
              isLoading: isLoading,
            ),
            SizedBox(height: bottomPadding),
          ],
        ),
      ),
    );
  }
}
