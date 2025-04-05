  import 'package:flutter/material.dart';



  class Dialogalready extends StatelessWidget {
    final String phoneNumber;
    const Dialogalready({super.key,required this.phoneNumber});

    @override
    Widget build(BuildContext context) {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Phone number already registered',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700,  fontFamily: 'TTSmalls-SemiBold'),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Continue logging in with this phone number:' '$phoneNumber',
                      style: TextStyle(fontSize: 16, fontFamily: 'TTSmalls-SemiBold',fontWeight: FontWeight.w100),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(

                              'Change',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF344054),
                                  fontFamily: 'TTSmalls-SemiBold'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text(
                              'Yes, Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'TTSmalls-SemiBold'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])));
    }
  }


