import 'package:comics_db_app/domain/blocs/auth/auth_view_cubit_state.dart';
import 'package:comics_db_app/domain/services/auth_data_storage.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthViewCubit>();
    final authDataStorage = context.read<AuthDataStorage>();
    final canStartAuth = cubit.state is AuthViewCubitFormFillInProgressState || cubit.state is AuthViewCubitErrorState;
    const color = Color(0xFF01B4E4);
    final onPressed =
    canStartAuth ? () => cubit.auth(login: authDataStorage.login, password: authDataStorage.password) : null;
    final child = cubit.state is AuthViewCubitAuthProgressState
        ? const SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(strokeWidth: 2),
    )
        : const Text('Login');
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
        ),
      ),
      child: child,
    );
  }
}