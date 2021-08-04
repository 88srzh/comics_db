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
          children: const [
            FormWidget(),
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
    return customTextFormField(labelText: 'Почта');
  }

  TextFormField buildPasswordFormField() {
    return customTextFormField(labelText: 'Пароль');
  }

  TextFormField customTextFormField({String? labelText}) {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.black54,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          filled: true,
          labelText: labelText,
          fillColor: Colors.white),
    );
  }
}
