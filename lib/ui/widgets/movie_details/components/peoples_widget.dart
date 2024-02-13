// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class PeoplesWidget extends StatelessWidget {
  const PeoplesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<MovieDetailsCubit>();
    var crew = cubit.state.peopleData;
    if (crew.isEmpty) return const SizedBox.shrink();
    return Column(
      children: crew
          .map(
            (chunk) => _PeoplesWidgetRow(employes: chunk),
          )
          .toList(),
    );
  }
}

class _PeoplesWidgetRow extends StatelessWidget {
  final List<MovieDetailsMoviePeopleData> employes;

  const _PeoplesWidgetRow({
    required this.employes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: employes
          .map(
            (employee) => _PeopleWidgetRowItem(
              employee: employee,
            ),
          )
          .toList(),
    );
  }
}

class _PeopleWidgetRowItem extends StatelessWidget {
  final MovieDetailsMoviePeopleData employee;

  const _PeopleWidgetRowItem({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TODO may be change customPeople style, because have extra code
            Text(employee.name, style: Theme.of(context).textTheme.labelMedium),
            Text(employee.job, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
