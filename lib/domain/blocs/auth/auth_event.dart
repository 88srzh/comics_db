part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logout() = AuthLogOutEvent;
  const factory AuthEvent.checkStatus() = AuthCheckStatusEvent;
  const factory AuthEvent.login(
      {required String login, required String password}) = AuthLoginEvent;
}
