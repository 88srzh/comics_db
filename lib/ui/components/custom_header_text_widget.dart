import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderTextWidget extends StatelessWidget {
  final String text;

  const CustomHeaderTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color:AppColors.genresText,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
