// Package imports:
import 'package:equatable/equatable.dart';

abstract class AuthViewCubitState extends Equatable {}

class AuthViewCubitErrorState extends AuthViewCubitState {
  final String errorMessage;

  AuthViewCubitErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AuthViewCubitAuthProgressState extends AuthViewCubitState {
  @override
  List<Object> get props => [];
}

class AuthViewCubitSuccessAuthState extends AuthViewCubitState {
  @override
  List<Object> get props => [];
}

class AuthViewCubitFormFillInProgressState extends AuthViewCubitState {
  @override
  List<Object> get props => [];
}
