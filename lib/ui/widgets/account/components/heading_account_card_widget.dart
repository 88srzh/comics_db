// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';

class HeadingAccountCardWidget extends StatelessWidget {
  const HeadingAccountCardWidget({super.key, required this.headingText});
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  headingText,
                  // style: Theme.of(context).textTheme.displaySmall,
                  style: TextStyle(
                    color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.titleColor : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
