import 'package:comics_db_app/domain/entity/tv_details.dart';
import 'package:comics_db_app/ui/widgets/tv_details/components/tv_details_people_data.dart';
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_cubit.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

class DirectorWidget extends StatelessWidget {
  const DirectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<TvDetailsModel>(context);
    final cubit = context.watch<TvDetailsCubit>();
    var creators = cubit.state.createBy;
    if (creators.isEmpty) return const SizedBox.shrink();
    // var names = <String>[];
    // final createdBy = model.tvDetails?.createdBy;
    // if (createdBy != null && createdBy.isNotEmpty) {
    //   var createdByNames = <String>[];
    //   for (var create in createdBy) {
    //     createdByNames.add(create.name);
    //   }
    //   names.add(createdByNames.join(', '));
    // }

    return Row(
      children: creators.map((chunk) => _TvPeoplesWidgetRow(employes: chunk)).toList(),
      // const Text(
      //   'Creator: ',
      //   style: TextStyle(color: Colors.grey),
      // ),
      // Expanded(
      //   child: Text(
      //     names.join(' '),
      //     style: const TextStyle(color: Colors.black87),
      //   ),
      // ),
    );
  }
}

class _TvPeoplesWidgetRow extends StatelessWidget {
  final List<CreatedBy> employes;

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
  final CreatedBy employee;

  const _TvPeoplesWidgetRowItem({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(employee.name, style: Theme.of(context).textTheme.labelMedium),
                // Text(employee., style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          ),
        )
      ],
    );
  }
}
