// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class CurrentTimeWidget extends StatefulWidget {
//   const CurrentTimeWidget({super.key});
//
//   @override
//   State<CurrentTimeWidget> createState() => _CurrentTimeWidgetState();
// }
//
// class _CurrentTimeWidgetState extends State<CurrentTimeWidget> {
//   late TimeOfDay currentTime;
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//     currentTime = TimeOfDay.now();
//     timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       setState(() {
//         currentTime = TimeOfDay.now();
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final hour = currentTime.hour.toString().padLeft(2, '0');
//     final minute = currentTime.minute.toString().padLeft(2, '0');
//     final second = DateTime.now().second.toString().padLeft(2, '0');
//
//     return Text(
//       '$hour:$minute:$second',
//       style: const TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
