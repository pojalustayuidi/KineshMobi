import 'package:flutter/material.dart';

class FirstNameForm extends StatefulWidget {
  const FirstNameForm({super.key});

  @override
  State<FirstNameForm> createState() => _FirstNameFormState();
}

class _FirstNameFormState extends State<FirstNameForm> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Form(
          child: SizedBox(
            width: screenWidth * 0.96,
            child: TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Ольга',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        )
      ],
    );
  }
}
