// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_created_by_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';

// Package imports:

class TvDetailsDirectorWidget extends StatelessWidget {
  final String creator;
  const TvDetailsDirectorWidget({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TvDetailsCubit>();
    var crew = cubit.state.createdBy;
    if (crew.isEmpty) return const SizedBox.shrink();
    return Column(
      children: crew.map((chunk) => _TvPeoplesWidgetRow(employes: chunk, creator: creator)).toList(),
    );
  }
}

class _TvPeoplesWidgetRow extends StatelessWidget {
  final String creator;
  final List<TvDetailsCreatedByData> employes;

  const _TvPeoplesWidgetRow({required this.employes, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: employes.map((employee) => _TvPeoplesWidgetRowItem(employee: employee, creator: creator)).toList(),
    );
  }
}

class _TvPeoplesWidgetRowItem extends StatelessWidget {
  final String creator;
  final TvDetailsCreatedByData employee;

  const _TvPeoplesWidgetRowItem({required this.employee, required this.creator});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(employee.name, style: Theme.of(context).textTheme.labelMedium),
            Text(creator, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
