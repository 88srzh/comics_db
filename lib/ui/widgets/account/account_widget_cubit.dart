import 'dart:async';

import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/auth/auth_bloc.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit_state.dart';
import 'package:comics_db_app/ui/widgets/account/components/account_details_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsCubitState> {
  late DateFormat _dateFormat;

  final accountDetailsData = AccountDetailsData();
  final movieAndTvApiClient = MovieAndTvApiClient();
  final _accountApiClient = AccountApiClient();
  final _authApiClient = AuthApiClient();

  AccountDetailsCubit()
      : super(const AccountDetailsCubitState(
          id: 0,
          name: '',
          username: '',
        )) {
    emit(AccountDetailsCubitState(
      id: state.id,
      name: state.name,
      username: state.username,
    ));
  }

  Future<void> loadAccountDetails(BuildContext context, AuthLoginEvent event, Emitter<AuthState> emit) async {
    final sessionId = await _authApiClient.auth(username: event.login, password: event.password);
    final accountId = await _accountApiClient.getAccountInfo(sessionId, Configuration.apiKey);
    final details = await movieAndTvApiClient.accountDetails(sessionId, Configuration.apiKey);
    updateData(details);
  }

  void updateData(AccountDetails details) {
    accountDetailsData.id = details.id;
    accountDetailsData.name = details.name;
    accountDetailsData.userName = details.username;

    var id = accountDetailsData.id;
    var name = accountDetailsData.name;
    var username = accountDetailsData.userName;

    final newState = state.copyWith(id);
  }

// AccountDetailsCubit({required this.accountDetailsBloc}) : super(const AccountDetailsCubitState(accountDetails: <AccountDetailsData>[], localeTag: '')) {
//   Future.microtask(
//     () {
//       _onState(accountDetailsBloc.state);
//       accountDetailsSubscription = accountDetailsBloc.stream.listen(_onState);
//     },
//   );
}

// void _onState(AccountDetailsState state) {
//   final accountDetails = state.details.map(_makeListData).toList();
//   final newState = this.state.copyWith(accountDetails: accountDetails);
//   emit(newState);
// }
// }
//
// AccountDetailsData _makeListData(AccountDetails accountDetails) {
//   return AccountDetailsData(
//     id: accountDetails.id,
//     name: accountDetails.name,
//     userName: accountDetails.username,
//   );
// }
