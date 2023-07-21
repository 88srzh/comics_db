// Flutter imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSettingDivider extends StatelessWidget {
  const CustomSettingDivider({Key? key, required this.height}) : super(key: key);

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
