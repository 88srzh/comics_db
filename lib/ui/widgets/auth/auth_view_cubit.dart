import 'dart:async';

import 'package:comics_db_app/domain/api_client/api_client_exception.dart';
import 'package:comics_db_app/domain/blocs/auth/auth_bloc.dart';
import 'package:comics_db_app/domain/blocs/auth/auth_view_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewCubit extends Cubit<AuthViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  AuthViewCubit(AuthViewCubitState initialState, {required this.authBloc}) : super(initialState) {
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

  void logout() {
    authBloc.add(const AuthLogOutEvent());
  }

  void _onState(AuthState state) {
    if (state is AuthUnauthorizedState) {
      emit(AuthViewCubitFormFillInProgressState());
    } else if (state is AuthAuthorizedState) {
      authBlocSubscription.cancel();
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
