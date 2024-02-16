import 'package:boilerplate/core/constants/app_key.dart';
import 'package:boilerplate/services/di.dart';

import '../../services/secure_storage.dart';

class NetworkUtils {
  String _accessToken = '';
  String _refreshToken = '';

  String get accessToken => _accessToken;

  String get refreshToken => _refreshToken;

  Future<void> init() async {
    _accessToken = await di<SecureStorage>().read(AppKey.token) ?? '';
    _refreshToken = await di<SecureStorage>().read(AppKey.refreshToken) ?? '';
  }

  Future<void> setToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await di<SecureStorage>().write(key: AppKey.token, value: accessToken);
    await di<SecureStorage>()
        .write(key: AppKey.refreshToken, value: refreshToken);
  }

  Future<void> deleteToken() async {
    _accessToken = '';
    _refreshToken = '';
    await di<SecureStorage>().delete(AppKey.token);
    await di<SecureStorage>().delete(AppKey.refreshToken);
  }

  static String parseErrorMessage(dynamic value) {
    if (value is Map) {
      if(value['message'] != null) {
        return value['message'].toString();
      }
      return value.values.first.toString();
    }
    return value.toString();
  }
}
