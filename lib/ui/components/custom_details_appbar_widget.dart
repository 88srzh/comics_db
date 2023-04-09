// Flutter imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final int movieId;

  const CustomDetailsAppBar({Key? key, required this.title, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title!,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.read<ThemeBloc>().isDarkTheme ? Colors.white : DarkThemeColors.kPrimaryColor,
        ),
        onPressed: () {
          Navigator.of(context).maybePop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
