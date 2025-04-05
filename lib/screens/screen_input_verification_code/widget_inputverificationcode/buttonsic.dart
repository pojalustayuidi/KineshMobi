import 'package:KineshmaApp/adaptive_design/adaptivedesign_widget.dart';
import 'package:flutter/material.dart';


// import 'Dialog/dialog_already_registred.dart';

class ButtonSec extends StatefulWidget {
  const ButtonSec({super.key});

  @override
  State<ButtonSec> createState() => _ButtonSecState();
}

class _ButtonSecState extends State<ButtonSec> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ScreenSize.width(context) * 0.65,
        height: ScreenSize.height(context) * 0.058,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/RegisterInfo');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF344E41),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Text(
            'Продолжить',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}