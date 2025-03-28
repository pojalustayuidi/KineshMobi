import 'package:flutter/material.dart';

class LastNameForm extends StatefulWidget {
  const LastNameForm({super.key});

  @override
  State<LastNameForm> createState() => _LastNameFormState();
}

class _LastNameFormState extends State<LastNameForm> {

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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),hintText: 'Ивановна ',hintStyle: TextStyle(
                    color: Color(0xFF101828),
                    fontFamily: 'Poppins-Regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                ),
              ),
            ))
      ],
    );
  }
}