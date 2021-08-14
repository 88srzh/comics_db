import 'package:comics_db_app/domain/api_client/api_client.dart';
import 'package:flutter/cupertino.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин или пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    final sessionId =
        await _apiClient.auth(username: login, password: password);
    _isAuthProgress = false;
    notifyListeners();
    // Navigator.of(context).popUntil((route) => false);
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthProvider({Key? key, required this.model, required Widget child})
      : super(key: key, notifier: model, child: child);

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
