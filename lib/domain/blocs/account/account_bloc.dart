import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/account/account_container.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.dart';

part 'account_event.dart';

part 'account_bloc.freezed.dart';

class AccountDetailsBloc extends Bloc<AccountDetailsEvent, AccountDetailsState> {
  final _personalApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();
  final _authApiClient = AuthApiClient();

  AccountDetailsBloc(AccountDetailsState initialState) : super(initialState) {
    on<AccountDetailsEvent>(((event, emit) async {
      if (event is AccountDetailsEventLoadDetails) {
        await onAccountDetailsEventLoadDetails(event, emit);
      } else if (event is AccountDetailsEventLoadReset) {
        await onAccountDetailsEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onAccountDetailsEventLoadDetails(AccountDetailsEvent event, Emitter<AccountDetailsState> emit) async {
    // final sessionId = await _authApiClient.auth(username: event.login, password: event.password);
    // final sessionId = await _sessionDataProvider.getAccountId();
    // final result = await _personalApiClient.accountDetails(sessionId, Configuration.apiKey);
    // final details = List<AccountDetails>.from(state.accountDetailsContainer.accountDetails)..addAll(result.accountDetails);
    // final container = state.accountDetailsContainer.copyWith(
    //   accountDetails: details,
    // );
    // final newState = state.copyWith(accountDetailsContainer: container);
    // emit(newState);
  }

  Future<void> onAccountDetailsEventLoadReset(AccountDetailsEvent event, Emitter<AccountDetailsState> emit) async {
    emit(const AccountDetailsState.initial());
  }
}
