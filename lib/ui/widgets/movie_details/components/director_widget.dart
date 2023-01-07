// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/tv_details/tv_details_model.dart';

class DirectorWidget extends StatelessWidget {
  const DirectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TvDetailsModel>(context);
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
