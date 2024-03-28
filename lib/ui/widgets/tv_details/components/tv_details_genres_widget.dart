// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    final genres = cubit.state.genres;
    final rating = cubit.state.rating;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        rating != null ?
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              rating,
              style: TextStyle(
                fontSize: 13,
                color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.ratingThumb : DarkThemeColors.kPrimaryColor,
              ),
            ),
          ),
        ) : const SizedBox.shrink(),
        const SizedBox(width: 5.0),
        Text(
          genres,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
