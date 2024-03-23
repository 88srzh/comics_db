// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieDetailsOtherInformationWidget extends StatelessWidget {
  final String statusText;
  const MovieDetailsOtherInformationWidget({super.key, required this.statusText});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    final String originalLanguage = cubit.state.originalLanguage;
    final int budget = cubit.state.budget;
    final String status = cubit.state.status;
    final int revenue = cubit.state.revenue;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(statusText, style: Theme.of(context).textTheme.labelMedium),
              Text(status, style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 10.0),
              Text(S.of(context).revenue, style: Theme.of(context).textTheme.labelMedium),
              Text(S.of(context).totalAmount(revenue.toDouble()), style: Theme.of(context).textTheme.labelSmall),
              // Text(),
            ],
          ),
          const SizedBox(width: 50.0),
          Column(
            children: [
              Text(S.of(context).originalLanguage, style: Theme.of(context).textTheme.labelMedium),
              Text(originalLanguage, style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 10.0),
              Text(S.of(context).budget, style: Theme.of(context).textTheme.labelMedium),
              Text(S.of(context).totalAmount(budget.toDouble()), style: Theme.of(context).textTheme.labelSmall),
            ],
          )
        ],
      ),
    );
  }
}
