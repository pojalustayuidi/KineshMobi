// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../../models/stop.dart';
//
// class StopDropdown extends StatefulWidget {
//   final List<Stop> stops;
//   final Function(Stop?) onStopSelected;
//
//   const StopDropdown({
//     super.key,
//     required this.stops,
//     required this.onStopSelected,
//   });
//
//   @override
//   State<StopDropdown> createState() => _StopDropdownState();
// }
//
// class _StopDropdownState extends State<StopDropdown> {
//   String _searchQuery = '';
//   final TextEditingController _textController = TextEditingController();
//   OverlayEntry? _overlayEntry;
//   final LayerLink _layerLink = LayerLink();
//   final FocusNode _focusNode = FocusNode();
//   Stop? _selectedStop;
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     _focusNode.dispose();
//     _overlayEntry?.remove();
//     super.dispose();
//   }
//
//   void _onSearchChanged(String query) {
//     setState(() {
//       _searchQuery = query;
//     });
//     if (query.isNotEmpty) {
//       final matchingStop = widget.stops.firstWhere(
//             (stop) => stop.name.toLowerCase().startsWith(query.toLowerCase()),
//         orElse: () => Stop(id: -1, name: "Не найдено"),
//       );
//       if (matchingStop.id != -1) {
//         _selectedStop = matchingStop;
//         widget.onStopSelected(matchingStop);
//       } else {
//         _selectedStop = null;
//         widget.onStopSelected(null);
//       }
//     } else {
//       _selectedStop = null;
//       widget.onStopSelected(null);
//     }
//   }
//
//   void _showDropdown(BuildContext context) {
//     _overlayEntry?.remove();
//     _overlayEntry = _createOverlayEntry();
//     Overlay.of(context).insert(_overlayEntry!);
//     _focusNode.requestFocus();
//   }
//
//   OverlayEntry _createOverlayEntry() {
//     final filteredStops = _searchQuery.isEmpty
//         ? widget.stops
//         : widget.stops
//         .where((stop) =>
//         stop.name.toLowerCase().startsWith(_searchQuery.toLowerCase()))
//         .toList();
//
//     return OverlayEntry(
//       builder: (context) => Positioned(
//         width: MediaQuery.of(context).size.width - 32, // Ширина TextField
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           offset: const Offset(0, 56), // Смещение вниз от TextField
//           child: Material(
//             elevation: 4.0,
//             borderRadius: BorderRadius.circular(4.0),
//             child: Container(
//               constraints: const BoxConstraints(maxHeight: 200),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey, width: 1.0),
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: filteredStops.isEmpty
//                   ? const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Нет подходящих остановок'),
//               )
//                   : ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: filteredStops.length,
//                 itemBuilder: (context, index) {
//                   final stop = filteredStops[index];
//                   return ListTile(
//                     title: Text(stop.name),
//                     onTap: () {
//                       setState(() {
//                         _searchQuery = stop.name;
//                         _textController.text = stop.name;
//                         _selectedStop = stop;
//                       });
//                       widget.onStopSelected(stop);
//                       _overlayEntry?.remove();
//                       _overlayEntry = null;
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: TextField(
//         controller: _textController,
//         focusNode: _focusNode,
//         onChanged: _onSearchChanged,
//         decoration: InputDecoration(
//           labelText: 'Введите остановку или выберите',
//           labelStyle: const TextStyle(color: Colors.grey),
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey, width: 1),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey, width: 1),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue, width: 1),
//           ),
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.arrow_downward, color: Colors.black),
//             onPressed: () => _showDropdown(context),
//           ),
//         ),
//       ),
//     );
//   }
// }