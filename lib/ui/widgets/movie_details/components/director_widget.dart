import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_people_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

class DirectorWidget extends StatelessWidget {
  const DirectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    var crew = cubit.state.peopleData;
    if (crew.isEmpty) return const SizedBox.shrink();
    return Column(
      children: crew.map((chunk) => _TvPeoplesWidgetRow(employes: chunk)).toList(),
    );
  }
}

class _TvPeoplesWidgetRow extends StatelessWidget {
  final List<TvDetailsPeopleData> employes;

  const _TvPeoplesWidgetRow({required this.employes});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: employes.map((employee) => _TvPeoplesWidgetRowItem(employee: employee)).toList(),
    );
  }
}

class _TvPeoplesWidgetRowItem extends StatelessWidget {
  final TvDetailsPeopleData employee;

  const _TvPeoplesWidgetRowItem({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(employee.name, style: Theme.of(context).textTheme.labelMedium),
            Text('Creator', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
