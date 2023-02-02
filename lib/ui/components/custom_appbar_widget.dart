// Flutter imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return AppBar(
          title: Text(
            title,
            style: GoogleFonts.signikaNegative(color: notifierTheme.isDark ? Colors.white : AppColors.headerText),
          ),
          centerTitle: true,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
