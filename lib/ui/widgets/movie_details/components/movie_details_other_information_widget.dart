// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/generated/l10n.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class MovieDetailsOtherInformationWidget extends StatelessWidget {
  const MovieDetailsOtherInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MovieDetailsCubit>();
    final String originalLanguage = cubit.state.originalLanguage;
    final int budget = cubit.state.budget;
    final String status = cubit.state.status;
    final int revenue = cubit.state.revenue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Column(
              children: [
                Text('Status', style: Theme.of(context).textTheme.labelMedium),
                Text(status, style: Theme.of(context).textTheme.labelSmall),
                const SizedBox(height: 10.0),
                Text('Revenue', style: Theme.of(context).textTheme.labelMedium),
                Text(S.of(context).totalAmount(revenue.toDouble()), style: Theme.of(context).textTheme.labelSmall),
                // Text(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80.0),
            child: Column(
              children: [
                Text('Original Language', style: Theme.of(context).textTheme.labelMedium),
                Text(originalLanguage, style: Theme.of(context).textTheme.labelSmall),
                const SizedBox(height: 10.0),
                Text('Budget', style: Theme.of(context).textTheme.labelMedium),
                Text(S.of(context).totalAmount(budget.toDouble()), style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}
