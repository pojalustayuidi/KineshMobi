import 'package:KineshmaApp/screens/screen_language/widgets_language/change_language_widget.dart';
import 'package:flutter/material.dart';

class ScreenLanguage extends StatelessWidget {
  const ScreenLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Настройки',style: TextStyle(color: Color(0xFF344E41)),),),
        body: Column(
          children: [SizedBox(height: 50,),
            ChangeLanguageWidget(text: 'Русский (Russian)',), Divider(), ],
        ),
      ),
    );
  }
}
