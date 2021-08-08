import 'package:comics_db_app/app_colors.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'password');

  void _resetPassword() {}

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'password') {
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {}
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                buildEmailFormField(),
                const SizedBox(height: 10),
                buildPasswordFormField(),
              ],
            ),
            const SizedBox(height: 5.0),
            resetPasswordRow(),
            const SizedBox(height: 20.0),
            loginButton(),
            const SizedBox(height: 15.0),
            registerRow()
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _loginTextController,
      autofocus: true,
      decoration: formFieldInputDecoration('Почта'),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordTextController,
      obscureText: true,
      decoration: formFieldInputDecoration('Пароль'),
    );
  }

  InputDecoration formFieldInputDecoration(String labelText) {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),
        filled: true,
        labelText: labelText,
        fillColor: Colors.white);
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () => _auth(),
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

  Row resetPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => _resetPassword(),
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
