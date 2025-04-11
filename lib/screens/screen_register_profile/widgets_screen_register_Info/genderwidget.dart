import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final String? initialGender;
  final ValueChanged<String?> onGenderChanged;

  const Gender({super.key, this.initialGender, required this.onGenderChanged});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? _selectedGender;
@override
  void initState(){
super.initState();
_selectedGender = widget.initialGender;
}
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
                    widget.onGenderChanged(value);
                  });
                }),
            const Text("Мужской"),
            Radio<String>(
                value: "female",
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                    widget.onGenderChanged(value);
                  });
                }),
            const Text('Женский')
          ],
        ),
      ],
    );
  }
}
