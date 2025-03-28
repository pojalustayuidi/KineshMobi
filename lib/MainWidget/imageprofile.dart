import 'package:flutter/material.dart';
class ImageSettings extends StatelessWidget {
  const ImageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(child: Column(children: [Image.asset('assets/Rectangle.png',scale: 0.8,)],)));
  }
}