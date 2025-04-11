import 'package:flutter/material.dart';

class TextWhereYouMapWidget extends StatelessWidget {
  final String firstName;
  final String lastName;

  const TextWhereYouMapWidget(
      {super.key, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('$firstName, $lastName'  ), Text('Куда вам?')],);
  }
}
