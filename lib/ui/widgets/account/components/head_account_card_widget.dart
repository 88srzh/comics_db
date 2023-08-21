// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';

class HeadAccountCardWidget extends StatelessWidget {
  const HeadAccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<AccountDetailsCubit>();
    final String username = cubit.state.username;
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ListTile(
              leading: const SizedBox(
                height: 100.0,
                width: 50.0,
                child: CircleAvatar(
                  // backgroundImage: AssetImage(AppImages.noImageAvailable),
                  backgroundColor: Colors.white,
                ),
              ),
              title: Text(
                username,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: const Text(
                'Member since 2021',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
