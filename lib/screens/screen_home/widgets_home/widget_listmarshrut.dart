import 'package:flutter/material.dart';

class ListMarhrut extends StatelessWidget {
  const ListMarhrut({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 15,itemBuilder: (context, i) =>
        ListTile(title: Text("Маршурт 1",style: TextStyle(color: Colors.red),),));
  }
}
