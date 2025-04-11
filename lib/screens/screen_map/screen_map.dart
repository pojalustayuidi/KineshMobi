import 'package:KineshmaApp/screens/screen_map/widgets_map/text_where_you_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScreenMap extends StatefulWidget {
  final String userName;

  const ScreenMap({super.key, required this.userName});

  @override
  State<ScreenMap> createState() => _ScreenMap();
}

class _ScreenMap extends State<ScreenMap> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(widget.userName).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Пользователь не найден'));
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        String firstName = data['firstName'] ?? widget.userName;
        String lastName = data['lastName'] ?? '';

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    height: 300,
                    width: 300,
                  ),
                  TextWhereYouMapWidget(firstName: firstName, lastName: lastName),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}