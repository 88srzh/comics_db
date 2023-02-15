// Flutter imports:
import 'package:comics_db_app/ui/widgets/settings/model_theme.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/ui/components/custom_search_input_decoration_widget.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomSearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO check may be delete consumer, because it's only change text color
    return Consumer<ModelTheme>(
      builder: (context, ModelTheme notifierTheme, child) {
        return TextField(
          style: TextStyle(
            color: notifierTheme.isDark ? AppColors.genresText : Colors.white,
          ),
          onChanged: onChanged,
          decoration: customSearchInputDecoration(text: 'Search'),
        );
      },
    );
  }
}
