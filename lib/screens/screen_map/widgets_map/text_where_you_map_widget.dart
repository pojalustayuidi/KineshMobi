import 'package:flutter/material.dart';

class TextWhereYouMapWidget extends StatelessWidget {

  const TextWhereYouMapWidget(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Доброе утро, '  ), Text('Куда вам?')],);
  }
}
