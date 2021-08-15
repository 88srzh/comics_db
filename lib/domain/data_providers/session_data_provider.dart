import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Keys {
  static const sessionId = 'session-id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: Keys.sessionId);
  Future<void> setSessionId(String value) =>
      _secureStorage.write(key: Keys.sessionId, value: value);
}
