
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/services.dart';

import 'continuebutton.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  String phonenumber = '';
  bool isCodeSent = false;

  @override
   Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
     final TextEditingController phoneController = TextEditingController();
    return Center(
      child: SizedBox(
        width: screenWidth * 0.85,
        child: Center(
          child: Stack(
            children: [
              Form(
                child: IntlPhoneField(
                  flagsButtonPadding: EdgeInsets.only(left: 8, right: 8),
                  controller: phoneController,
                  initialCountryCode: 'RU',
                  showDropdownIcon: false,
                  onChanged: (phone) {},
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: '9158907172',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                      ),),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
