import 'package:flutter/material.dart';

class MyPasswordWidget extends StatefulWidget {
  const MyPasswordWidget({super.key});

  @override
  State<MyPasswordWidget> createState() => _MyPasswordWidgetState();
}

class _MyPasswordWidgetState extends State<MyPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Пароль",
                  style: TextStyle(
                      color: Color(0xFF667085), fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Скрыт',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Изменить',
                  style: TextStyle(color: Color(0xFF344E41)),
                ))
          ],
        ));
  }
}
