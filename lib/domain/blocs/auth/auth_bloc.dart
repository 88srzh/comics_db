// Package imports:
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';

part 'auth_bloc.freezed.dart';
part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();

  AuthBloc(AuthState initialState) : super(initialState) {
    on<AuthEvent>(((event, emit) async {
      if (event is AuthCheckStatusEvent) {
        await onAuthCheckStatusEvent(event, emit);
      } else if (event is AuthLoginEvent) {
        await onAuthLoginEvent(event, emit);
      } else if (event is AuthLogOutEvent) {
        await onAuthLogoutEvent(event, emit);
      }
    }), transformer: sequential());
    add(const AuthCheckStatusEvent());
  }

  Future<void> onAuthCheckStatusEvent(
      AuthCheckStatusEvent event, Emitter<AuthState> emit) async {
    emit(AuthInProgressState());
    final sessionId = await _sessionDataProvider.getSessionId();
    final newState =
        sessionId != null ? AuthAuthorizedState() : AuthUnauthorizedState();
    emit(newState);
  }

  Future<void> onAuthLoginEvent(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthInProgressState());
      final sessionId = await _authApiClient.auth(
          username: event.login, password: event.password);
      final accountId = await _accountApiClient.getAccountInfo(sessionId);
      await _sessionDataProvider.setSessionId(sessionId);
      await _sessionDataProvider.setAccountId(accountId);
      emit(AuthAuthorizedState());
    } catch (e) {
      emit(AuthFailureState(e));
    }
  }

  Future<void> onAuthLogoutEvent(
      AuthLogOutEvent event, Emitter<AuthState> emit) async {
    try {
      await _sessionDataProvider.deleteSessionId();
      await _sessionDataProvider.deleteAccountId();
    } catch (e) {
      emit(AuthFailureState(e));
    }
  }
}
