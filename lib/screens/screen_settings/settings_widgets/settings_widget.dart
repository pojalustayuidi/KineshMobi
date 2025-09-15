import 'package:KineshmaApp/screens/screen_account/screen_account.dart';
import 'package:KineshmaApp/screens/screen_settings/settings_widgets/forward_button_widget.dart';
import 'package:KineshmaApp/screens/screen_settings/settings_widgets/settings_item_widget.dart';
import 'package:KineshmaApp/screens/screen_settings/settings_widgets/settings_swtich_widget.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({
    super.key,
  });

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Image.asset("assets/avatar.png", width: 60, height: 60),
              const SizedBox(
                width: 10,
              ),
              const Column(
                children: [
                  Text(
                    'Аккаунт',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'ID: 1212424',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ), Spacer(),
              ForwardButton(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenAccount(),
                  ),
                );
              })
            ],
          ),
        ),

        // Column(
        //   children: [
        //     Divider(),
        //     TextButton(
        //       onPressed: () {},
        //       child: Text(
        //         'Все остановки',
        //         style: TextStyle(color: Color(0xFF344E41)),
        //       ),
        //     ),
        //     Divider(),
        //     TextButton(
        //         onPressed: () {
        //           Navigator.of(context).pushNamed('/language');
        //         },
        //         child: Text(
        //           'Язык',
        //           style: TextStyle(color: Color(0xFF344E41)),
        //         )),
        //     Divider(),
        //     TextButton(
        //       onPressed: () {},
        //       child: Text(
        //         'Уведомления',
        //         style: TextStyle(
        //           color: Color(0xFF344E41),
        //         ),
        //       ),
        //     ),
        //     Divider(),
        //     TextButton.icon(
        //       onPressed: () {},
        //       icon: SvgPicture.asset('assets/Logout.svg'),
        //       label: Text(
        //         'Выйти из аккаунта',
        //         style: TextStyle(color: Color(0xFF344E41)),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 30,),
        SettingItem(
          title: "Язык",
          bgColor: Colors.white,
          iconColor: Colors.grey,
          value: "Русский",
          onTap: () {},

        ),const SizedBox(height: 30,), SettingItem(
          title: "Уведомления",
          bgColor: Colors.white,
          iconColor: Colors.grey,
          onTap: () {},
        ),const SizedBox(height: 30,),SettingSwitch(
          title: "Dark Mode",
          icon: Icons.offline_bolt,
          bgColor: Colors.purple.shade100,
          iconColor: Colors.purple,
          value: isDarkMode,
          onTap: (value) {
            setState(() {
              isDarkMode = value;
            });
          },
        ), ],
    );
  }
}
