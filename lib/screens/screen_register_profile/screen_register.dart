import 'package:KineshmaApp/screens/navigation_menu_bnb.dart';
import 'package:KineshmaApp/screens/screen_register_profile/screen_RegisterInfoWidget/text_widgetl.dart';
import 'package:KineshmaApp/screens/screen_register_profile/screen_RegisterInfoWidget/textfirstnamew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'screen_RegisterInfoWidget/firstnameform.dart';
import 'screen_RegisterInfoWidget/genderwidget.dart';
import 'screen_RegisterInfoWidget/isreadybutton.dart';
import 'screen_RegisterInfoWidget/lastnameForm.dart';
import 'screen_RegisterInfoWidget/textlastname.dart';

class ScreenRegisterInfo extends StatefulWidget {
  final String username;
  final String userId;

  const ScreenRegisterInfo(
      {super.key, required this.username, required this.userId});

  @override
  State<ScreenRegisterInfo> createState() => _ScreenRegisterInfoState();
}

class ScreenRegisterInfoUI extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController userNameController;
  final String gender;
  final VoidCallback onSave;

  const ScreenRegisterInfoUI(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.gender,
      required this.onSave,
      required this.userNameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(),
        SizedBox(
          height: 48,
        ),
        FirstNameText(),
        SizedBox(
          height: 6,
        ),
        FirstNameForm(
          controller: firstNameController,
        ),
        SizedBox(height: 16),
        LastNameText(),
        SizedBox(
          height: 6,
        ),
        LastNameForm(
          controller: lastNameController,
        ),
        SizedBox(
          height: 16,
        ),
        // EmailText(),
        SizedBox(
          height: 6,
        ),
        //Gendertext(),
        SizedBox(
          height: 6,
        ),
        Gender(),
        SizedBox(
          height: 32,
        ),
        ReadyButton(
          onPressed: onSave,
        )
      ],
    );
  }
}

class _ScreenRegisterInfoState extends State<ScreenRegisterInfo> {
  final TextEditingController _firtstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final String _selectedGender = 'Не указан';

  Future<void> _savetoFirebase() async {
    if (_firtstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Введите Имя и Фамилию')));
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.userId)
          .update({
        'firstName': _firtstNameController.text,
        'lastName': _lastNameController.text,
        'gender': _selectedGender,
        'updateAt': DateTime.now().toIso8601String()
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainNavigationWrapper(
              userName: widget.username,

            ),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Данные успешно сохраненны")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ошибка при сохранение $e")));
    }
  }

  @override
  void dispose() {
    _firtstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenRegisterInfoUI(
        firstNameController: _firtstNameController,
        lastNameController: _lastNameController,
        gender: _selectedGender,
        onSave: _savetoFirebase, userNameController: _userNameController,
      ),
      appBar: AppBar(),
    );
  }
}
