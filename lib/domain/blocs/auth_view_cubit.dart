class AuthViewCubitState {
  final String errorMessage;
  final bool _isAuthProgress;

  AuthViewCubitState(this.errorMessage, bool isAuthProgress) : _isAuthProgress = isAuthProgress;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;
}
