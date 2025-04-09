import 'package:flutter/material.dart';

class ContainergradientText extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String userName;

  const ContainergradientText(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/Rectangle15.png',
            scale: 0.8,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 33, left: 21),
                child: Text(
                  '$lastName $firstName',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Text(
                '$userName',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }
}
