import 'package:KineshmaApp/screens/screen_account/screen_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenAccount()),
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
            onPressed: () {
              Navigator.of(context).pushNamed('/language');
            },
            child: Text(
              'Язык',
              style: TextStyle(color: Color(0xFF344E41)),
            )),
        Divider(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Уведомления',
            style: TextStyle(
              color: Color(0xFF344E41),
            ),
          ),
        ),
        Divider(),
        TextButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset('assets/Logout.svg'),
          label: Text(
            'Выйти из аккаунта',
            style: TextStyle(color: Color(0xFF344E41)),
          ),
        ),
      ],
    );
  }
}
