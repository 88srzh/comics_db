import 'package:comics_db_app/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeoplesWidget extends StatelessWidget {
  const PeoplesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var crew = context.select((MovieDetailsModel model) => model.data.peopleData);
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
      // TODO: show only 4 people
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

  const _PeopleWidgetRowItem({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: вынести в отдельный файл стили текста
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
    const jobStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(employee.name, style: nameStyle),
            Text(employee.job, style: jobStyle),
          ],
        ),
      ),
    );
  }
}
