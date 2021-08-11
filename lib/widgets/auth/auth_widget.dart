import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/widgets/auth/auth_model.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Войти',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const ErrorMessageWidget(),
                // buildEmailFormField(),
                TextFormField(
                  controller: model?.loginTextController,
                  autofocus: true,
                  decoration: formFieldInputDecoration('Почта'),
                ),
                const SizedBox(height: 10),
                // buildPasswordFormField(),
                TextFormField(
                  controller: model?.passwordTextController,
                  obscureText: true,
                  decoration: formFieldInputDecoration('Пароль'),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            resetPasswordRow(),
            const SizedBox(height: 20.0),
            // loginButton(),
            const AuthButtonWidget(),
            const SizedBox(height: 15.0),
            registerRow()
          ],
        ),
      ),
    );
  }

  InputDecoration formFieldInputDecoration(String labelText) {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelStyle: const TextStyle(
          color: AppColors.kPrimaryColor,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),
        filled: true,
        labelText: labelText,
        fillColor: Colors.white);
  }

  Row resetPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          child: const Text(
            'Забыли пароль?',
            style: TextStyle(color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }

  Row registerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Нет аккаунта? '),
        InkWell(
          onTap: () {},
          child: const Text(
            'Зарегистрируйтесь',
            style: TextStyle(color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    final onPressed = model?.canStartAuth ==true ? () => model?.auth(context) : null;
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Войти', style: TextStyle(fontSize: 24)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        side: MaterialStateProperty.all(
    const BorderSide(color: AppColors.kPrimaryColor)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
        ),
      ),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorText = 'Неверный логин или пароль';
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorText, style: const TextStyle(
          fontSize: 17, color: Colors.red,
        ),
      ),
    );
  }
}
