import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../fitrix_app.dart';
import '../../generated/l10n.dart';
import '../helpers/app_prefs.dart';
import '../helpers/constants.dart';
import '../routing/routes.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);
  static bool _isLoggingOut = false;
  String _getCurrentLanguage() {
    return Prefs.getData(key: 'language') ?? 'en';
  }

  String? _getToken() {
    return Prefs.getData(key: Constants.userToken);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _getToken();
    final language = _getCurrentLanguage();

    options.headers.addAll({
      "Authorization": "Bearer $token",
      "Accept": "application/json",
      "locale": language,
    });

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      _logoutAndRedirect();
      return;
    }

    return super.onError(err, handler);
  }

  void _logoutAndRedirect() {
    if (_isLoggingOut) return;
    _isLoggingOut = true;
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(S.of(navigatorKey.currentContext!).session_expired),
        backgroundColor: Colors.red,
      ),
    );

    Prefs.removeData(key: Constants.userToken);
    Prefs.setData(key: Constants.isAlreadyLogin, value: false);

    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false)
        .then((_) {
          _isLoggingOut = false;
        });
  }
}
