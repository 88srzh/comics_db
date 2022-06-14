import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/auth_bloc.dart';

enum LoaderViewCubitState { unknown, authorized, notAuthorized }

class LoaderViewCubit extends Cubit<LoaderViewCubitState> {
  final AuthBloc authBloc;
  late final StreamSubscription<AuthState> authBlocSubscription;

  LoaderViewCubit(LoaderViewCubitState initialState, this.authBloc) : super(initialState) {
    // if (authBloc.state is AuthAuthorizedState) {
    //   emit(LoaderViewCubitState.authorized);
    // } else {
    _onState(authBloc.state);
    authBlocSubscription = authBloc.stream.listen(_onState);
    authBloc.add(AuthCheckStatusEvent());
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