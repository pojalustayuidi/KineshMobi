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
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.selectedStop != null) {
      _controller.text = widget.selectedStop!.name;
    }
  }

  @override
  void didUpdateWidget(covariant StopAutocompleteField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedStop != oldWidget.selectedStop) {
      if (widget.selectedStop != null) {
        _controller.text = widget.selectedStop!.name;
      } else {
        _controller.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: Autocomplete<Stop>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<Stop>.empty();
          }

          final query = textEditingValue.text.toLowerCase();
          return widget.stops.where((Stop stop) {
            return stop.name.toLowerCase().contains(query);
          });
        },

        displayStringForOption: (Stop stop) => stop.name,

        onSelected: (Stop stop) {
          widget.onChanged(stop);
          FocusScope.of(context).unfocus();
        },

        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4,
              child: Container(
                width: widget.width ?? double.infinity,
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return ListTile(
                      title: Text(option.name),
                      onTap: () => onSelected(option),
                    );
                  },
                ),
              ),
            ),
          );
        },
        fieldViewBuilder: (
            BuildContext context,
            TextEditingController controller,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
            ) {

          if (_controller.text != controller.text) {
            _controller.text = controller.text;
          }

          return AppTextField(
            controller: controller,
            focusNode: focusNode,
            hint: 'Ваша остановка',
            isDropdownRequested: controller.text.isNotEmpty,
            onClear: () {
              controller.clear();
              widget.onChanged(null);
            },
            onToggleDropdown: () {
              focusNode.requestFocus();
            },
            onChanged: (value) {
              if (value.isEmpty) {
                widget.onChanged(null);
              }
            },
            onSubmitted: (_) => onFieldSubmitted(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}