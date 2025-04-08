import 'package:flutter/material.dart';

class CodeForm extends StatelessWidget {
  final TextEditingController controller;
  const CodeForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Form(
          child: SizedBox(
            width: screenWidth * 0.85,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Введите код',
                prefixIcon: const Icon(Icons.lock),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
          ),
        ),
      ],
    );
  }
}