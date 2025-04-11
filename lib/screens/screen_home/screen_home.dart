import 'package:KineshmaApp/screens/screen_home/widgets_home/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:firebase_core/firebase_core.dart';

class ScreenHomeContent extends StatefulWidget {
  final String userName;

  const ScreenHomeContent({super.key, required this.userName});

  @override
  State<ScreenHomeContent> createState() => _ScreenHomeContentState();
}

class _ScreenHomeContentState extends State<ScreenHomeContent> {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

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
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const IconsLogo(),
                  WelcomeText(firstName: firstName, lastName: lastName),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}