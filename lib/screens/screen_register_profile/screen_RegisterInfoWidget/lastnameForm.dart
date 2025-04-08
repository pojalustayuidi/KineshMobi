import 'package:flutter/material.dart';

class LastNameForm extends StatelessWidget {
  final TextEditingController controller;
  const LastNameForm({super.key, required this.controller});

  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Form(
            child: SizedBox(
              width: screenWidth * 0.96,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),hintText: 'Ивановна ',hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                ),
              ),
            ))
      ],
    );
  }
}