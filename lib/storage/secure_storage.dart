import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late SecureStorage _instance;

  factory SecureStorage() =>
      _instance ??= SecureStorage._(FlutterSecureStorage());

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;

  static const _tokenKey = "TOKEN";
  static const _emailKey = "EMAIL";

  Future<void> persistEmailAndToken(String email, String token) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<bool> hasEmail() async {
    String? email = await _storage.read(key: _emailKey);
    return email != null;
  }

  Future<bool> hasToken() async {
    String? token = await _storage.read(key: _tokenKey);
    return token != null;
  }

  Future<void> deleteEmail() async {
    await _storage.delete(key: _emailKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<String?> getEmail() async {
    return _storage.read(key: _emailKey);
  }

  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
