import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/api_client/account_api_client.dart';
import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';

abstract class AuthEvent {}

class AuthLogOutEvent extends AuthEvent {}

class AuthCheckStatusEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String login;
  final String password;

  AuthLoginEvent({
    required this.login,
    required this.password,
  });
}

enum AuthStateStatus {
  authorized,
  notAuthorized,
  inProgress,
}

abstract class AuthState {}

class AuthAuthorizedState extends AuthState {}

class AuthUnauthorizedState extends AuthState {}

class AuthFailureState extends AuthState {
  // TODO: input error
  final Object error;

  AuthFailureState(this.error);
}

class AuthInProgressState extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _sessionDataProvider = SessionDataProvider();
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();

  AuthBloc(AuthState initialState) : super(initialState) {
    on<AuthCheckStatusEvent>(((event, emit) async {
      final sessionId = await _sessionDataProvider.getSessionId();
      final newState = sessionId != null ? AuthAuthorizedState() : AuthUnauthorizedState();
      emit(newState);
    }));
    on<AuthLoginEvent>(((event, emit) async {
      try {
        final sessionId = await _authApiClient.auth(username: event.login, password: event.password);
        final accountId = await _accountApiClient.getAccountInfo(sessionId);
        await _sessionDataProvider.setSessionId(sessionId);
        await _sessionDataProvider.setAccountId(accountId);
        emit(AuthAuthorizedState());
      } catch (e) {
        emit(AuthFailureState(e));
      }
    }));
    on<AuthLogOutEvent>(((event, emit) async {
      try {
        await _sessionDataProvider.deleteSessionId();
        await _sessionDataProvider.deleteAccountId();
      } catch (e) {
        emit(AuthFailureState(e));
      }
    }));
    add(AuthCheckStatusEvent());
  }
}
