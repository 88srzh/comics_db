// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GestureTapCallback onTapRu;
  final GestureTapCallback onTapEn;

  const CustomAppBar({super.key, required this.onTapRu, required this.onTapEn});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<AccountDetailsCubit>();
    // final locale = Localizations.localeOf(context);
    return AppBar(
      actions: [
        CustomAppBarLanguageContainerWidget(
          onTap: widget.onTapRu,
          text: 'RU',
        ),
        const SizedBox(width: 4.0),
        CustomAppBarLanguageContainerWidget(
          onTap: widget.onTapEn,
          text: 'EN',
        ),
        const SizedBox(width: 8.0),
      ],
      centerTitle: true,
    );
  }
}

class CustomAppBarLanguageContainerWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  const CustomAppBarLanguageContainerWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: context.read<ThemeBloc>().isDarkTheme ? Colors.white : DarkThemeColors.kPrimaryColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: context.read<ThemeBloc>().isDarkTheme ? Colors.white : DarkThemeColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
