import 'package:flutter/material.dart';

class MyNickNameWidget extends StatefulWidget {
  const MyNickNameWidget({super.key});

  @override
  State<MyNickNameWidget> createState() => _MyNickNameWidgetState();
}

class _MyNickNameWidgetState extends State<MyNickNameWidget> {
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
                  "Ваше Логин",
                  style: TextStyle(
                      color: Color(0xFF667085), fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Ольга Ивановна',
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
