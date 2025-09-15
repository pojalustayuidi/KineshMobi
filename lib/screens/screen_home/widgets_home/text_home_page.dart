import 'package:flutter/material.dart';

class TextHomePage extends StatefulWidget {
  const TextHomePage({
    super.key,
  });

  @override
  State<TextHomePage> createState() => _TextHomePageState();
}

class _TextHomePageState extends State<TextHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Введите или выберите из предложенного списка свою остановку',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFF667085),
                fontFamily: 'Franklin_Gothic_Medium',
                fontSize: 16,
              ),
            )
          ]),
    );
  }
}
