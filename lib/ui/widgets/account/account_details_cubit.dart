import 'dart:async';

import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/account/account_bloc.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit_state.dart';
import 'package:comics_db_app/ui/widgets/account/components/account_details_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsCubitState> {
  final accountDetailsData = AccountDetailsData();
  final movieAndTvApiClient = MovieAndTvApiClient();
  final String sessionId;
  final AccountDetailsBloc accountBloc;
  // late final StreamSubscription<AccountDetailsState> accountDetailsBlocSubscription;

  AccountDetailsCubit({required this.accountBloc, required this.sessionId})
      : super(const AccountDetailsCubitState(id: 0, name: '', username: '')) {
    emit(AccountDetailsCubitState(id: state.id, name: state.name, username: state.username));
  }

  Future<void> loadAccountDetails(BuildContext context) async {
    final details = await movieAndTvApiClient.accountDetails(sessionId);
    updateData(details);
  }

  Future<void> setupAccountDetails(BuildContext context) async {
    updateData(null);
    await loadAccountDetails(context);
  }

  void updateData(AccountDetails? details) {
    accountDetailsData.id = details?.id ?? 0;
    accountDetailsData.name = details?.name ?? '';
    accountDetailsData.userName = details?.username ?? '';

    var id = accountDetailsData.id;
    var name = accountDetailsData.name;
    var username = accountDetailsData.userName;

    final newState = state.copyWith(id: id, name: name, username: username);
    emit(newState);
  }

  void logout() {
    accountBloc.add(AccountLogoutEvent());
  }

  // @override
  // Future<void> close() {
  //   accountDetailsBlocSubscription.cancel();
  //   return super.close();
  // }
}
