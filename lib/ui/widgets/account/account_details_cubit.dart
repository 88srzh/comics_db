// Dart imports:
import 'dart:async';

// Flutter imports:
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
  final accountDetailsData = AccountDetailsData();
  final movieAndTvApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  AccountDetailsCubit() : super(const AccountDetailsCubitState(id: 0, name: '', username: '', includeAdult: true, avatarPath: '')) {
    emit(AccountDetailsCubitState(
      id: state.id,
      name: state.name,
      username: state.username,
      includeAdult: state.includeAdult,
      avatarPath: state.avatarPath,
    ));
  }

  Future<void> loadAccountDetails(BuildContext context) async {
    final sessionId = await _sessionDataProvider.getSessionId();
    final details = await movieAndTvApiClient.accountDetails(sessionId ?? 'Гостевая сессия');
    updateData(details);
  }

  Future<void> setupAccountDetails(BuildContext context) async {
    updateData(null);
    await loadAccountDetails(context);
  }

  void updateData(AccountDetails? details) {
    accountDetailsData.id = details?.id ?? 0;
    accountDetailsData.name = details?.name ?? '';
    accountDetailsData.userName = details?.username ?? 'Гость';
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
}
