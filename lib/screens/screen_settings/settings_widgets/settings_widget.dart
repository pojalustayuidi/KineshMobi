import 'package:KineshmaApp/screens/screen_account/screen_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String userName;
  final Function(String, String) onNameChanged;

  const SettingsWidget(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.onNameChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScreenAccount(
                        firstName: firstName,
                        lastName: lastName,
                        userName: userName,
                      )),
            );
          },
          child: Text(
            'Мой аккаунт',
            style: TextStyle(color: Color(0xFF344E41)),
          ),
        ),
        Divider(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Все остановки',
            style: TextStyle(color: Color(0xFF344E41)),
          ),
        ),
        Divider(),
        TextButton(
            onPressed: () {},
            child: Text(
              'Язык',
              style: TextStyle(color: Color(0xFF344E41)),
            )),
        Divider(),
        TextButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset('assets/Logout.svg'),
          label: Text(
            'Выйти из аккаунта',
            style: TextStyle(color: Color(0xFF344E41)),
          ),
        )
      ],
    );
  }
}
