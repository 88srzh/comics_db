import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomSearchBar({Key? key,required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: AppColors.genresText,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Search',
        labelStyle: const TextStyle(
          color: AppColors.genresText,
        ),
        filled: true,
        fillColor: AppColors.kPrimaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
      ),
    );
  }
}
