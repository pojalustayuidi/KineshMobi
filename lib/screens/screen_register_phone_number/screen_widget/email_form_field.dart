import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const EmailForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  bool isPasswordHidden = true;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Логин",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Form(
          child: SizedBox(
            width: screenWidth * 0.85,
            child: TextFormField(
              controller: widget.usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'логин',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Пароль",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Form(
          child: SizedBox(
            width: screenWidth * 0.85,
            child: TextFormField(
              controller: widget.passwordController,
              obscureText: isPasswordHidden,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Введите пароль',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                }
            ),
          ),
        ),

      ],
    );
  }
}