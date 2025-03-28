import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {

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
                ),
                hintText: 'olga@gmail.com',hintStyle: TextStyle(
                  color: Color(0xFF101828),
                  fontFamily: 'Poppins-Regular',
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
