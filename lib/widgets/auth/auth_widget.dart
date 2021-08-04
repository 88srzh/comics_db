import 'package:comics_db_app/constants.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
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
            const FormWidget(),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Забыли пароль?',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Войти', style: TextStyle(fontSize: 24)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(kPrimaryColor),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
                ),
                // TODO: add border to button
              ),
            ),
          ],
        ),
      ),
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

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildEmailFormField(),
        const SizedBox(height: 10),
        buildPasswordFormField(),
      ],
    );
  }

  TextFormField buildEmailFormField() {
    return customTextFormField('Почта', false, true);
  }

  TextFormField buildPasswordFormField() {
    return customTextFormField('Пароль', true, false);
  }

  TextFormField customTextFormField(
      String labelText, bool obskureText, bool autofocus) {
    return TextFormField(
      autofocus: autofocus,
      obscureText: obskureText,
      decoration: InputDecoration(
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
          fillColor: Colors.white),
    );
  }
}
