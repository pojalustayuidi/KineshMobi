import 'package:flutter/material.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';

class StopDropdown extends StatefulWidget {
  final List<Stop> stops;
  final Stop? selectedStop;
  final ValueChanged<Stop?> onChanged;
  final double width;

  const StopDropdown({
    super.key,
    required this.stops,
    required this.selectedStop,
    required this.onChanged,
    required this.width,
  });

  @override
  State<StopDropdown> createState() => _StopDropdownState();
}

class _StopDropdownState extends State<StopDropdown> {
  bool _isDropdownRequested = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Autocomplete<Stop>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty && !_isDropdownRequested) {
            return const Iterable<Stop>.empty();
          }
          return widget.stops.where((Stop stop) {
            return textEditingValue.text.isEmpty ||
                stop.name
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
          });
        },
        displayStringForOption: (Stop stop) => stop.name,
        onSelected: (Stop stop) {
          FocusScope.of(context).unfocus();
          widget.onChanged(stop);
          setState(() {
            _isDropdownRequested = false;
          });
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController controller,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          if (widget.selectedStop != null && controller.text.isEmpty) {
            controller.text = widget.selectedStop!.name;
          }
          return TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEDF3F7),//0xFFEFF6FB //0xFFF2F6F9 //0xFFEDF3F7
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              labelStyle: TextStyle(
                fontFamily: 'Franklin_Gothic_Medium',
                fontSize: 16,
              ),
              hintText: 'Ваша остановка',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  ),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                        widget.onChanged(null);
                        setState(() {
                          _isDropdownRequested = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        _isDropdownRequested
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                      onPressed: () {
                        setState(() {
                          _isDropdownRequested = !_isDropdownRequested;
                        });
                        if (_isDropdownRequested) {
                          focusNode.requestFocus();
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
            ),
            onFieldSubmitted: (_) => onFieldSubmitted(),
            onChanged: (value) {
              if (value.isEmpty) {
                widget.onChanged(null);
                setState(() {
                  _isDropdownRequested = false;
                });
              } else {
                final matchingStop = widget.stops.firstWhere(
                  (stop) => stop.name.toLowerCase() == value.toLowerCase(),
                  orElse: () => Stop(name: value, id: -1),
                );
                widget.onChanged(matchingStop);
              }
            },
          );
        },
      ),
    );
  }
}
