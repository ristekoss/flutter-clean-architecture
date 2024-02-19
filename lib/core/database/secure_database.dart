import 'package:boilerplate/services/secure_storage.dart';

abstract class SecureDatabase {
  Future<void> write({
    required String key,
    required String value,
  });

  Future<void> delete(String key);

  Future<String?> getString(String key);
}

class SecureDatabaseImpl implements SecureDatabase {
  final SecureStorage _storage;

  const SecureDatabaseImpl(this._storage);

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key);
  }

  @override
  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getString(String key) async {
    return await _storage.read(key);
  }
}
