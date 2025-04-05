import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Пол',
            style: TextStyle(
                color: Color(0xFF344054),
                fontFamily: 'Poppins-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            Radio<String>(
                value: "male",
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                }),
            const Text("Мужской"),
            Radio<String>(
                value: "female",
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                }),
            const Text('Женский')
          ],
        ),
      ],
    );
  }
}
