import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Keys {
  static const sessionId = 'session-id';
  static const accountId = 'account_id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: Keys.sessionId);

  Future<void> setSessionId(String value) {
    return _secureStorage.write(key: Keys.sessionId, value: value);
  }

  Future<void> deleteSessionId() {
    return _secureStorage.delete(key: Keys.sessionId);
  }

  Future<int?> getAccountId() async {
    final id = await _secureStorage.read(key: Keys.accountId);
    return id != null ? int.tryParse(id) : null;
  }

  Future<void> setAccountId(int value) {
    return _secureStorage.write(key: Keys.accountId, value: value.toString());
  }

  Future<void> deleteAccountId() {
    return _secureStorage.delete(key: Keys.accountId);
  }
}
