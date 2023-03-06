// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_search_input_decoration_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomSearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return TextField(
      style: TextStyle(
        color: isDarkTheme
            ? DarkThemeColors.genresText
            : DarkThemeColors.kPrimaryColor,
      ),
      onChanged: onChanged,
      decoration: isDarkTheme
          ? customSearchInputDecoration(text: 'Search')
          : customSearchInputDecorationForLightTheme(text: 'Search'),
    );
  }
}
