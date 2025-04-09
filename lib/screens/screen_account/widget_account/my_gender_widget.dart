import 'package:flutter/material.dart';

class MyGenderWidget extends StatefulWidget {
  const MyGenderWidget({super.key});

  @override
  State<MyGenderWidget> createState() => _MyGenderWidgetState();
}

class _MyGenderWidgetState extends State<MyGenderWidget> {
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
                  "Пол",
                  style: TextStyle(
                      color: Color(0xFF667085), fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Женский',
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
