// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/blocs/auth/auth_bloc.dart';

enum LoaderViewCubitState { unknown, authorized, notAuthorized }

class LoaderViewCubit extends Cubit<LoaderViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  LoaderViewCubit(super.initialState, this.authBloc) {
    Future.microtask(
      () {
        _onState(authBloc.state);
        authBlocSubscription = authBloc.stream.listen(_onState);
        authBloc.add(const AuthCheckStatusEvent());
      },
    );
  }

  // }

  void _onState(AuthState state) {
    if (state is AuthAuthorizedState) {
      emit(LoaderViewCubitState.authorized);
    } else if (state is AuthUnauthorizedState) {
      emit(LoaderViewCubitState.notAuthorized);
    }
  }

  @override
  Future<void> close() {
    authBlocSubscription.cancel();
    return super.close();
  }
}
