// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';

class CustomSettingDivider extends StatelessWidget {
  const CustomSettingDivider({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return Container(
      width: double.infinity,
      height: height,
      color: isDarkTheme ? Colors.black : Colors.grey,
    );
  }
}
