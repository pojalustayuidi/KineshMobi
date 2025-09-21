import 'package:flutter/material.dart';

import '../../../theme/app_decoration.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final bool isDropdownRequested;
  final VoidCallback onClear;
  final VoidCallback onToggleDropdown;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefixIcon;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      this.hint = '',
      this.isDropdownRequested = false,
      required this.onClear,
      required this.onToggleDropdown,
      this.onChanged,
      this.onSubmitted,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final hasText = value.text.isNotEmpty;
        final suffix = hasText
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: onClear,
              )
            : IconButton(
                icon: Icon(
                  isDropdownRequested
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                ),
                onPressed: onToggleDropdown,
              );

        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(color: Color(0xFF8A9BAA), shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.black26,
            ),
          ],
          ),

          decoration: appInputDecoration(hintText: hint,suffixIcon: suffix)
              .copyWith(
                  prefixIcon: prefixIcon ?? const Icon(Icons.search),
                  filled: true,
                  hintStyle:  const TextStyle(color: Color(0xFF8A9BAA), shadows: [
                    Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 1,
                      color: Colors.black12,
                    ),
                  ],),
                  fillColor: Color(0xFFF0F6FA)),
          onChanged: onChanged,
          onFieldSubmitted: (s) => onSubmitted?.call(s),
        );
      },
    );
  }
}
