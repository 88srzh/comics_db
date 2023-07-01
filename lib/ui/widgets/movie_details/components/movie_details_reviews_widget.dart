// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/components/custom_movie_list_box_decoration_widgets.dart';

class MovieDetailsReviewsWidget extends StatelessWidget {
  const MovieDetailsReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeBloc>().isDarkTheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Stack(
            children: [
              Container(
                decoration: isDarkTheme ? customMovieListBoxDecorationForDarkTheme : customMovieListBoxDecorationForLightTheme,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: const [],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
