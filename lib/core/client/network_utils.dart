import 'package:boilerplate/core/constants/app_key.dart';
import 'package:boilerplate/core/database/secure_database.dart';

class NetworkUtils {
  final SecureDatabase _secureDatabase;

  NetworkUtils(this._secureDatabase);

  String _accessToken = '';
  String _refreshToken = '';

  String get accessToken => _accessToken;

  String get refreshToken => _refreshToken;

  Future<void> init() async {
    _accessToken = await _secureDatabase.getString(AppKey.token) ?? '';
    _refreshToken = await _secureDatabase.getString(AppKey.refreshToken) ?? '';
  }

  Future<void> setToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  Future<void> deleteToken() async {
    _accessToken = '';
    _refreshToken = '';
  }

  static String parseErrorMessage(dynamic value) {
    if (value is Map) {
      if (value['message'] != null) {
        return value['message'].toString();
      }
      return value.values.first.toString();
    }
    return value.toString();
  }
}
