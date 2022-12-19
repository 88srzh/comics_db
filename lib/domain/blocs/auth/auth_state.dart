part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthAuthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthUnauthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailureState extends AuthState {
  @override
  List<Object> get props => [error];

  // TODO: input error
  final Object error;

  AuthFailureState(this.error);
}

class AuthInProgressState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthCheckStatusInProgressState extends AuthState {
  @override
  List<Object> get props => [];
}
