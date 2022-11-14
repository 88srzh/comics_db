import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 22),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      // foregroundColor: Colors.white,
      // backgroundColor: AppColors.kPrimaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
