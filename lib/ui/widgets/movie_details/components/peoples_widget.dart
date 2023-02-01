// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/components/custom_people_text_style.dart';
import 'package:comics_db_app/ui/widgets/movie_details/components/movie_people_data.dart';
import 'package:comics_db_app/ui/widgets/movie_details/movie_details_cubit.dart';

class PeoplesWidget extends StatelessWidget {
  const PeoplesWidget({Key? key}) : super(key: key);

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
    Key? key,
    required this.employes,
  }) : super(key: key);

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

  const _PeopleWidgetRowItem({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customPeopleTextStyle = CustomPeopleTextStyle();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(employee.name, style: customPeopleTextStyle.nameStyle),
            Text(employee.job, style: customPeopleTextStyle.jobStyle),
          ],
        ),
      ),
    );
  }
}
