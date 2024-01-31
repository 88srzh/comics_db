import 'package:comics_db_app/ui/widgets/account/guest_account/guest_account_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestAccountWidget extends StatefulWidget {
  const GuestAccountWidget({super.key});

  @override
  State<GuestAccountWidget> createState() => _GuestAccountWidgetState();
}

class _GuestAccountWidgetState extends State<GuestAccountWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<GuestAccountDetailsCubit>().loadGuestAccountDetails();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('That is work!');
  }
}
