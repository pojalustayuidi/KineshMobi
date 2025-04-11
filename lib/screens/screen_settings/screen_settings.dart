import 'package:KineshmaApp/screens/screen_settings/settings_widgets/container_gradient_text.dart';
import 'package:KineshmaApp/screens/screen_settings/settings_widgets/settings_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {
  final String userName;

  const ScreenSettings({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userName)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Пользователь не найден'));
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        String firstName = data['firstName'] ?? userName;
        String lastName = data['lastName'] ?? '';

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 40),
                ContainergradientText(
                    firstName: firstName,
                    lastName: lastName,
                    userName: userName),
                const SizedBox(height: 32),
                SettingsWidget(
                  firstName: firstName,
                  lastName: lastName,
                  userName: userName,
                  onNameChanged: (newFirstName, newLastName) {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
