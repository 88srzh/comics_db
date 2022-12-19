part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState.initial();
}

class AuthAuthorizedState extends AuthState {
  const AuthAuthorizedState.initial() : super.initial();

  @override
  List<Object> get props => [];
}

class AuthUnauthorizedState extends AuthState {
  const AuthUnauthorizedState.initial() : super.initial();

  @override
  List<Object> get props => [];
}

class AuthFailureState extends AuthState {
  @override
  List<Object> get props => [error];

  // TODO: input error
  final Object error;

  const AuthFailureState(this.error) : super.initial();
}

class AuthInProgressState extends AuthState {
  const AuthInProgressState.initial() : super.initial();

  @override
  List<Object> get props => [];
}

class AuthCheckStatusInProgressState extends AuthState {
  const AuthCheckStatusInProgressState.initial() : super.initial();

  @override
  List<Object> get props => [];
}
