// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:comics_db_app/domain/blocs/account/account_bloc.dart';
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:comics_db_app/ui/widgets/account/account_details_cubit_state.dart';
import 'package:comics_db_app/ui/widgets/account/components/account_details_data.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsCubitState> {
  final AccountBloc accountBloc;
  final accountDetailsData = AccountDetailsData();
  final movieAndTvApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  AccountDetailsCubit({required this.accountBloc})
      : super(const AccountDetailsCubitState(id: 0, name: '', username: '', includeAdult: true, avatarPath: '', localeTag: '')) {
    emit(AccountDetailsCubitState(
      id: state.id,
      name: state.name,
      username: state.username,
      includeAdult: state.includeAdult,
      avatarPath: state.avatarPath,
      localeTag: state.localeTag,
    ));
  }

  Future<void> loadAccountDetails(BuildContext context) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final details = await movieAndTvApiClient.accountDetails(sessionId ?? 'Guest session');
    updateData(details);
  }

  Future<void> setupAccountDetails(BuildContext context, String localeTag) async {
    if (state.localeTag == localeTag) return;
    final newState = state.copyWith(localeTag: localeTag);
    emit(newState);
    updateData(null);
    await loadAccountDetails(context);
  }

  void updateData(AccountDetails? details) {
    accountDetailsData.id = details?.id ?? 0;
    accountDetailsData.name = details?.name ?? '';
    accountDetailsData.userName = details?.username ?? 'Guest';
    accountDetailsData.includeAdult = details?.includeAdult ?? true;
    accountDetailsData.avatarPath = details?.avatar.tmdb.avatarPath ?? '';

    var id = accountDetailsData.id;
    var name = accountDetailsData.name;
    var username = accountDetailsData.userName;
    var includeAdult = accountDetailsData.includeAdult;
    var avatarPath = accountDetailsData.avatarPath;

    final newState = state.copyWith(id: id, name: name, username: username, includeAdult: includeAdult, avatarPath: avatarPath);
    emit(newState);
  }

  // TODO must delete because it's copy from authBloc
  Future<void> logout() async {
    await _sessionDataProvider.deleteSessionId();
    await _sessionDataProvider.deleteAccountId();
  }

  void updateAccountWidget(String localeTag) {
    accountBloc.add(AccountDetailsEventLoadReset());
    accountBloc.add(AccountDetailsEventLoadDetails(locale: localeTag));
  }
}
