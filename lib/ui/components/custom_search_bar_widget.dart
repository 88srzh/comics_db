// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_search_input_decoration_widget.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return TextField(
      style: TextStyle(color: isDarkTheme ? DarkThemeColors.genresText : DarkThemeColors.kPrimaryColor),
      onChanged: onChanged,
      decoration: isDarkTheme ? customSearchInputDecoration(text: 'Search') : customSearchInputDecorationForLightTheme(text: 'Search'),
    );
  }
}
