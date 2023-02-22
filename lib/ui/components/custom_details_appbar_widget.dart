// Flutter imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  const CustomDetailsAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return AppBar(
          title: Text(
            title!,
            style: TextStyle(
              color: notifierTheme.isDark ? Colors.white : AppColors.kPrimaryColor,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            // color: Theme.of(context).colorScheme.onBackground,
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.kPrimaryColor,
            ),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
