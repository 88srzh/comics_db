// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/core/app_colors.dart';
import 'package:comics_db_app/domain/blocs/auth/auth_view_cubit_state.dart';
import 'package:comics_db_app/ui/navigation/main_navigation.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_view_cubit.dart';

class GuestAuthButtonWidget extends StatelessWidget {
  const GuestAuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO add guest session
    final cubit = context.watch<AuthViewCubit>();
    // final canStart = cubit.state is AuthGuestProgressState;
    onPressed() {
      cubit.guestAuth();
      Navigator.of(context).popAndPushNamed(MainNavigationRouteNames.mainScreen);
    }
    // onPressed() => Navigator.of(context).popAndPushNamed(MainNavigationRouteNames.mainScreen);
    // final child = cubit.state is AuthViewCubitAuthProgressState
    final child = cubit.state is AuthGuestProgressState
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Text('Guest login');
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
