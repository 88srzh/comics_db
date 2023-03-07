import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTvDetailsIconWidget extends StatelessWidget {
  final IconData icon;

  const CustomTvDetailsIconWidget({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: context.read<ThemeBloc>().isDarkTheme
          ? DarkThemeColors.ratingThumb
          : DarkThemeColors.kPrimaryColor,
      size: 14,
    );
  }
}
