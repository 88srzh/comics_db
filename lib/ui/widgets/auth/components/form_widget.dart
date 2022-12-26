import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/domain/services/auth_data_storage.dart';
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
    const textStyle = TextStyle(
      fontSize: 16,
      color: AppColors.genresText,
    );
    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      fillColor: Colors.red,
      focusColor: Colors.red,
      hoverColor: Colors.red,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ErrorMessageWidget(),
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: textFieldDecorator,
          onChanged: (text) => authDataStorage.login = text,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: textFieldDecorator,
          onChanged: (text) => authDataStorage.password = text,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const AuthButtonWidget(),
            const SizedBox(width: 30),
            TextButton(
              onPressed: () {},
              // style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}