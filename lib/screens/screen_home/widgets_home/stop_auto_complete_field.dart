import 'package:flutter/material.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';

import 'app_text_field_widget.dart';

class StopAutocompleteField extends StatefulWidget {
  final List<Stop> stops;
  final Stop? selectedStop;
  final ValueChanged<Stop?> onChanged;
  final double? width;

  const StopAutocompleteField({
    super.key,
    required this.stops,
    required this.selectedStop,
    required this.onChanged,
    this.width,
  });

  @override
  State<StopAutocompleteField> createState() => _StopAutocompleteFieldState();
}

class _StopAutocompleteFieldState extends State<StopAutocompleteField> {
  bool _isDropdownRequested = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Autocomplete<Stop>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty && !_isDropdownRequested) {
            return const Iterable<Stop>.empty();
          }
          return widget.stops.where((Stop stop) {
            return textEditingValue.text.isEmpty ||
                stop.name.toLowerCase().contains(textEditingValue.text.toLowerCase());
          });
        },
        displayStringForOption: (Stop stop) => stop.name,
        onSelected: (Stop stop) {
          FocusScope.of(context).unfocus();
          widget.onChanged(stop);
          setState(() => _isDropdownRequested = false);
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController controller,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          if (widget.selectedStop != null && controller.text.isEmpty) {
            controller.text = widget.selectedStop!.name;
          }

          return AppTextField(
            controller: controller,
            focusNode: focusNode,
            hint: 'Ваша остановка',
            isDropdownRequested: _isDropdownRequested,
            onClear: () {
              controller.clear();
              widget.onChanged(null);
              setState(() => _isDropdownRequested = false);
            },
            onToggleDropdown: () {
              setState(() => _isDropdownRequested = !_isDropdownRequested);
              if (_isDropdownRequested) {
                focusNode.requestFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            },
            onChanged: (value) {
              if (value.isEmpty) {
                widget.onChanged(null);
                setState(() => _isDropdownRequested = false);
              } else {
                final matchingStop = widget.stops.firstWhere(
                      (stop) => stop.name.toLowerCase() == value.toLowerCase(),
                  orElse: () => Stop(name: value, id: -1),
                );
                widget.onChanged(matchingStop);
              }
            },
            onSubmitted: (_) => onFieldSubmitted(),
          );
        },
      ),
    );
  }
}
