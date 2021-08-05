import 'package:comics_db_app/constants.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

    void _resetPassword() {}

    void _auth() {
      final login = _loginTextController.text;
      final password = _passwordTextController;
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
            // const FormWidget(),
            Column(
      children: [
        buildEmailFormField(),
        const SizedBox(height: 10),
        buildPasswordFormField(),
      ],
    ),
            const SizedBox(height: 5.0),
            resetPassword(),
            const SizedBox(height: 20.0),
            loginButton(),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Нет аккаунта? '),
                Text('Зарегистрируйтесь'),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return  TextFormField(
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
          borderSide: BorderSide(color: kPrimaryColor),
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
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      side: MaterialStateProperty.all(const BorderSide(color: kPrimaryColor)),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(kPrimaryColor),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
      ),
    ),
  );
}

  Row resetPassword() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => _resetPassword(),
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [],
      ),
    );
  }
}

