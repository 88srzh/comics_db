abstract class AuthViewCubitState {}

class AuthViewCubitErrorState extends AuthViewCubitState {
  final String errorMessage;

  AuthViewCubitErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitErrorState && runtimeType == other.runtimeType && errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}

class AuthViewCubitAuthProgressState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthViewCubitAuthProgressState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitSuccessAuthState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthViewCubitSuccessAuthState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitFormFillInProgressState extends AuthViewCubitState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthViewCubitFormFillInProgressState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
