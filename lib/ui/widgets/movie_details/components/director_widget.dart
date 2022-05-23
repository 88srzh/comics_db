import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DirectorWidget extends StatelessWidget {
  const DirectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TvDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var names = <String>[];
    final createdBy = model.tvDetails?.createdBy;
    if (createdBy != null && createdBy.isNotEmpty) {
      var createdByNames = <String>[];
      for (var create in createdBy) {
        createdByNames.add(create.name);
      }
      names.add(createdByNames.join(', '));
    }

    return Row(
      children: [
        const Text(
          'Director: ',
          style: TextStyle(color: Colors.grey),
        ),
        Expanded(
          child: Text(
            names.join(' '),
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
