import 'dart:async';
import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/blocs/auth_bloc.dart';
import 'package:comics_db_app/domain/blocs/auth_view_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewCubit extends Cubit<AuthViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  AuthViewCubit(AuthViewCubitState initialState, this.authBloc) : super(initialState) {
    _onState(authBloc.state);
    authBlocSubscription = authBloc.stream.listen(_onState);
  }

  bool _isValid(String login, String password) => login.isNotEmpty && password.isNotEmpty;

  void auth({required String login, required String password}) {
    if (!_isValid(login, password)) {
      final state = AuthViewCubitErrorState('Fill your login and password');
      emit(state);
      return;
    }
    authBloc.add(AuthLoginEvent(login: login, password: password));
  }

  void _onState(AuthState state) {
    if (state is AuthUnauthorizedState) {
      emit(AuthViewCubitFormFillInProgressState());
    } else if (state is AuthAuthorizedState) {
      emit(AuthViewCubitSuccessAuthState());
    } else if (state is AuthFailureState) {
      final message = _mapErrorToMessage(state.error);
      emit(AuthViewCubitErrorState(message));
    } else if (state is AuthInProgressState) {
      emit(AuthViewCubitAuthProgressState());
    } else if (state is AuthCheckStatusInProgressState) {
      emit(AuthViewCubitAuthProgressState());
    }
  }

  String _mapErrorToMessage(Object error) {
    if (error is! ApiClientException) {
      return 'Unknown error, please try again later';
    }
    switch (error.type) {
      case ApiClientExceptionType.network:
        return 'Server is not available. Check your internet connection';
      // Navigator.of(context).pushReplacementNamed(
      //     MainNavigationRouteNames.networkConnectionError);
      case ApiClientExceptionType.auth:
        return 'Incorrect login or password';
      case ApiClientExceptionType.sessionExpired:
      case ApiClientExceptionType.other:
        return 'An error has occurred, try again later';
    }
  }

  @override
  Future<void> close() {
    authBlocSubscription.cancel();
    return super.close();
  }
}

// class AuthViewModel extends ChangeNotifier {
//   final _authService = AuthService();
//   final loginTextController = TextEditingController();
//   final passwordTextController = TextEditingController();
//
//   String? _errorMessage;
//
//   String? get errorMessage => _errorMessage;
//
//   // bool _isAuthProgress = false;
//   //
//   // bool get canStartAuth => !_isAuthProgress;
//   //
//   // bool get isAuthProgress => _isAuthProgress;
//
//   bool _isValid(String login, String password) => login.isNotEmpty && password.isNotEmpty;
//
//   Future<String?> _login(String login, String password) async {
//     try {
//       await _authService.login(login, password);
//     } on ApiClientException catch (e) {
//       switch (e.type) {
//         case ApiClientExceptionType.network:
//           return 'Сервер недоступен. Проверьте подключение к интернету';
//         // Navigator.of(context).pushReplacementNamed(
//         //     MainNavigationRouteNames.networkConnectionError);
//         case ApiClientExceptionType.auth:
//           return 'Неправильный логин или пароль';
//         case ApiClientExceptionType.sessionExpired:
//         case ApiClientExceptionType.other:
//           return 'Произошла ошибка. Попробуйте еще раз';
//       }
//     } catch (e) {
//       return 'Неизвестная ошибка, повторите попытку';
//     }
//     return null;
//   }
//
//   Future<void> auth(BuildContext context) async {
//     final login = loginTextController.text;
//     final password = passwordTextController.text;
//     if (!_isValid(login, password)) {
//       _updateState('Заполните логин или пароль', false);
//       return;
//     }
//     _updateState(null, true);
//
//     _errorMessage = await _login(login, password);
//     if (_errorMessage == null) {
//       MainNavigation.resetNavigation(context);
//     } else {
//       _updateState(_errorMessage, false);
//     }
//   }
//
//   void _updateState(String? errorMessage, bool isAuthProgress) {
//     if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
//       return;
//     }
//     _errorMessage = errorMessage;
//     _isAuthProgress = isAuthProgress;
//     notifyListeners();
//   }
// }
