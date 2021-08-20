import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/widgets/auth/auth_model.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = AuthProvider.read(context)?.model;
    final model = NotifierProvider.read<AuthModel>(context);
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
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const CircularProgressIndicator(strokeWidth: 5.0)
        : const Text(
            'Войти',
            style: TextStyle(fontSize: 24),
          );
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
          side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.kPrimaryColor)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
          ),
        ),
      ),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
