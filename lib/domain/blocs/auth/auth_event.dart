part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logout() = AuthLogOutEvent;
  const factory AuthEvent.checkStatus() = AuthCheckStatusEvent;
  const factory AuthEvent.login({required String login, required String password}) = AuthLoginEvent;
}

// abstract class AuthEvent {}

// class AuthLogOutEvent extends AuthEvent {}
//
// class AuthCheckStatusEvent extends AuthEvent {}
//
// class AuthLoginEvent extends AuthEvent {
//   final String login;
//   final String password;
//
//   AuthLoginEvent({
//     required this.login,
//     required this.password,
//   });
// }