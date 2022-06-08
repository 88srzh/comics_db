import 'dart:async';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/blocs/auth_bloc.dart';
import 'package:comics_db_app/domain/blocs/auth_view_cubit.dart';
import 'package:comics_db_app/domain/services/auth_service.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewCubit extends Cubit<AuthViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  AuthViewCubit(AuthViewCubitState initialState, this.authBloc) : super(initialState);

  bool _isValid(String login, String password) => login.isNotEmpty && password.isNotEmpty;
}

class AuthViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  // bool _isAuthProgress = false;
  //
  // bool get canStartAuth => !_isAuthProgress;
  //
  // bool get isAuthProgress => _isAuthProgress;

  bool _isValid(String login, String password) => login.isNotEmpty && password.isNotEmpty;

  Future<String?> _login(String login, String password) async {
    try {
      await _authService.login(login, password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return 'Сервер недоступен. Проверьте подключение к интернету';
        // Navigator.of(context).pushReplacementNamed(
        //     MainNavigationRouteNames.networkConnectionError);
        case ApiClientExceptionType.auth:
          return 'Неправильный логин или пароль';
        case ApiClientExceptionType.sessionExpired:
        case ApiClientExceptionType.other:
          return 'Произошла ошибка. Попробуйте еще раз';
      }
    } catch (e) {
      return 'Неизвестная ошибка, повторите попытку';
    }
    return null;
  }

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (!_isValid(login, password)) {
      _updateState('Заполните логин или пароль', false);
      return;
    }
    _updateState(null, true);

    _errorMessage = await _login(login, password);
    if (_errorMessage == null) {
      MainNavigation.resetNavigation(context);
    } else {
      _updateState(_errorMessage, false);
    }
  }

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
      return;
    }
    _errorMessage = errorMessage;
    _isAuthProgress = isAuthProgress;
    notifyListeners();
  }
}
