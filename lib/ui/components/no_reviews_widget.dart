import 'package:comics_db_app/core/dark_theme_colors.dart';
import 'package:comics_db_app/domain/blocs/theme/theme_bloc.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoReviewsWidget extends StatelessWidget {
  const NoReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = context.read<MovieDetailsCubit>().state.title;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Reviews', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          NowReviewsTextWidget(title: title),
        ],
      ),
    );
  }
}

class NowReviewsTextWidget extends StatelessWidget {
  const NowReviewsTextWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.read<ThemeBloc>().isDarkTheme ? DarkThemeColors.kPrimaryColor : Colors.white,
        border: Border.all(color: context.read<ThemeBloc>().isDarkTheme ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('We do not have any reviews for $title. Would you like to write one?', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
