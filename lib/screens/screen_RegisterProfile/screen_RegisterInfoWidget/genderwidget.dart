import 'package:flutter/material.dart';

class gender extends StatefulWidget {
  const gender({super.key});

  @override
  State<gender> createState() => _genderState();
}

class _genderState extends State<gender> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(value: "male",
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value;
              });
            }),const Text("Мужской"),
        Radio<String>(value: "female",
            groupValue: _selectedGender,
            onChanged: (String? value){
          setState(() {
            _selectedGender = value;
          });

            }),const Text('Женский')
      ],
    );
  }
}
