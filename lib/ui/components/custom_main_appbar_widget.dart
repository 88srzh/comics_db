// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';

class CustomMainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.lightbulb_outline),
        onPressed: () => context.read<ThemeBloc>().add(const ThemeEvent()),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
