import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTvDetailsIconWidget extends StatelessWidget {
  final IconData icon;

  const CustomTvDetailsIconWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: AppColors.ratingThumb,
      size: 14,
    );
  }
}
