import 'dart:async';

import 'package:comics_db_app/domain/blocs/account/account_bloc.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit_state.dart';
import 'package:comics_db_app/ui/widgets/account/components/account_details_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsCubitState> {
  final AccountDetailsBloc accountDetailsBloc;
  late final StreamSubscription<AccountDetailsState> accountDetailsSubscription;
  late DateFormat _dateFormat;
  var accountDetails = <AccountDetails>[];

  AccountDetailsCubit({required this.accountDetailsBloc})
      : super(const AccountDetailsCubitState(accountDetails: <AccountDetailsData>[], localeTag: '')) {
    Future.microtask(() {
      _onState(accountDetailsBloc.state);
      accountDetailsSubscription = accountDetailsBloc.stream.listen(_onState);
    };
    }

  void _onState(AccountDetailsState state) {
    final accountDetails = state.details.map(_makeListData).toList();
    final newState = this.state.copyWith(accountDetails: accountDetails);
    emit(newState);
  }
}


AccountDetailsData _makeListData(AccountDetails accountDetails) {
  return AccountDetailsData(
    id: accountDetails.id,
    name: accountDetails.name,
    userName: accountDetails.username,
  );
}