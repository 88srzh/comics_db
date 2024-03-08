// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/ui/components/custom_search_input_decoration_widget.dart';

class CustomAuthTextFieldWidget extends StatefulWidget {
  final Function(String)? onChanged;
  final bool obscureText;

  const CustomAuthTextFieldWidget({super.key, required this.onChanged, required this.obscureText});

  @override
  State<CustomAuthTextFieldWidget> createState() => _CustomAuthTextFieldWidgetState();
}

class _CustomAuthTextFieldWidgetState extends State<CustomAuthTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: DarkThemeColors.kPrimaryColor),
      decoration: customSearchInputDecorationForLightTheme(text: ''),
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
    );
  }
}
