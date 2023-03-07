// Flutter imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSettingDivider extends StatelessWidget {
  const CustomSettingDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return Container(
      width: double.infinity,
      height: 0.5,
      color: isDarkTheme ? Colors.grey : Colors.grey,
    );
  }
}
