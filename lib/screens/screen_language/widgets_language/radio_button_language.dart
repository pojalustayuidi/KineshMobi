import 'package:flutter/material.dart';
class RadioButtonLanguage extends StatefulWidget {
  const RadioButtonLanguage({super.key});

  @override
  State<RadioButtonLanguage> createState() => _RadioButtonLanguageState();
}

class _RadioButtonLanguageState extends State<RadioButtonLanguage> {
  String? _selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Column(children: [Radio<String>(groupValue: _selectedLanguage, value: 'Русский', onChanged: (String? value){
      setState(() {
        _selectedLanguage;
      });
    },), Radio<String>(groupValue: _selectedLanguage, value: 'Английский', onChanged: (String? value){
      setState(() {
        _selectedLanguage;
      });
    },)],);
  }
}
