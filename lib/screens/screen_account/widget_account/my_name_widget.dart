import 'package:flutter/material.dart';

class MyNameWidget extends StatefulWidget {

  const MyNameWidget({
    super.key,
  });

  @override
  State<MyNameWidget> createState() => _MyNameWidgetState();
}

class _MyNameWidgetState extends State<MyNameWidget> {
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
                "Ваше имя",
                style: TextStyle(
                  color: const Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          TextButton(
            onPressed: () {
            },
            child: const Text(
              'Изменить',
              style: TextStyle(color: Color(0xFF344E41)),
            ),
          ),
        ],
      ),
    );
  }
}
