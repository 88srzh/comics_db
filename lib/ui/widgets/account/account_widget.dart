// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:comics_db_app/ui/widgets/account/account_details_cubit.dart';
import 'package:comics_db_app/ui/widgets/account/components/body_account_details_widget.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  late Future<String> lazyValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future<String> loadingDelay() {
      Duration duration = const Duration(seconds: 2);

      return Future.delayed(duration, () => 'It took ${duration.inSeconds}');
    }

    lazyValue = loadingDelay();

    final locale = Localizations.localeOf(context);
    context.read<AccountDetailsCubit>().setupAccountDetails(context, locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyPersonalWidget(),
    );
  }
}
