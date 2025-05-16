// import 'package:flutter/material.dart';
//
// class RouteCard extends StatelessWidget {
//   final String routeName;
//   final String direction;
//   final String nextArrivalTime;
//   final Color color;
//
//   const RouteCard(
//       {super.key,
//       required this.routeName,
//       required this.direction,
//       required this.nextArrivalTime,
//       required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           height: 40,
//           width: 40,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle, color: color),
//           child: Center(
//             child: Text(
//               routeName,
//               style: TextStyle(color: Color(0xFF4F378A),fontWeight: FontWeight.w700),
//             ),
//           ),
//         ),
//         Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(direction),
//                   Text(
//                     'Ближайший автобус будет в $nextArrivalTime',
//                     style: TextStyle(color: Color(0xFF667085)),
//                   ),
//                   Divider()
//                 ],
//               ),
//             ))
//       ],
//     );
//   }
// }
