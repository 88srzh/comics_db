// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/blocs/auth/auth_view_cubit_state.dart';
import 'package:comics_db_app/domain/services/auth_data_storage.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthViewCubit>();
    final authDataStorage = context.read<AuthDataStorage>();
    final canStartAuth = cubit.state is AuthViewCubitFormFillInProgressState || cubit.state is AuthViewCubitErrorState;
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
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.buttonFont,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      child: child,
    );
  }
}
