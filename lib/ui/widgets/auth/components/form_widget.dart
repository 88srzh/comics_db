import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/services/auth_data_storage.dart';
import 'package:comics_db_app/ui/components/custom_auth_text_style.dart';
import 'package:comics_db_app/ui/components/custom_search_input_decoration_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/components/auth_button_widget.dart';
import 'package:comics_db_app/ui/widgets/auth/components/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key}) : super(key: key);

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authDataStorage = context.read<AuthDataStorage>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ErrorMessageWidget(),
        Text(
          'Username',
          style: customAuthTextStyle(),
        ),
        const SizedBox(height: 5),
        // TODO need refactoring
        TextField(
          style: const TextStyle(color: AppColors.genresText),
          decoration: customSearchInputDecoration(text: ''),
          onChanged: (text) => authDataStorage.login = text,
        ),
        const SizedBox(height: 20),
        Text(
          'Password',
          style: customAuthTextStyle(),
        ),
        const SizedBox(height: 5),
        TextField(
          style: const TextStyle(color: AppColors.genresText),
          decoration: customSearchInputDecoration(text: ''),
          onChanged: (text) => authDataStorage.password = text,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(width: 5.0),
            const AuthButtonWidget(),
            const SizedBox(width: 10.0),
            TextButton(
              onPressed: () {},
              // style: AppButtonStyle.linkButton,
              child: const Text(
                'Reset password',
                style: TextStyle(color: AppColors.selectedText),
              ),
            ),
          ],
        )
      ],
    );
  }
}
