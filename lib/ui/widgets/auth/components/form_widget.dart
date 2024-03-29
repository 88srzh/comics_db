// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comics_db_app/domain/services/auth_data_storage.dart';
import 'package:comics_db_app/ui/components/custom_auth_text_widget.dart';
import 'package:comics_db_app/ui/components/custom_auth_textfield_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/components/auth_button_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/components/error_message_widget.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authDataStorage = context.read<AuthDataStorage>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ErrorMessageWidget(),
        const CustomAuthTextWidget(text: 'Username'),
        const SizedBox(height: 5),
        // TODO need refactoring
        CustomAuthTextFieldWidget(
          onChanged: (text) => authDataStorage.login = text,
          obscureText: false,
        ),
        // TextField(
        //   style: const TextStyle(color: DarkThemeColors.genresText),
        //   decoration: customSearchInputDecoration(text: ''),
        //   onChanged: (text) => authDataStorage.login = text,
        // ),
        const SizedBox(height: 20),
        const CustomAuthTextWidget(text: 'Password'),
        const SizedBox(height: 5),
        CustomAuthTextFieldWidget(
          onChanged: (text) => authDataStorage.password = text,
          obscureText: true,
        ),
        // TextField(
        //   style: const TextStyle(color: DarkThemeColors.genresText),
        //   decoration: customSearchInputDecoration(text: ''),
        //   onChanged: (text) => authDataStorage.password = text,
        //   obscureText: true,
        // ),
        const SizedBox(height: 25),
        const Row(
          children: [
            SizedBox(width: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AuthButtonWidget(),
              ],
            ),
            SizedBox(width: 10.0),
          ],
        )
      ],
    );
  }
}
