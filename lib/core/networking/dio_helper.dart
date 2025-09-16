import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_constants.dart';
import 'auth_interceptor.dart';

class ApiService {
  final Dio _dio;

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          connectTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 120),
          headers: {"Content-Type": "application/json"},
        ),
      ) {
    _dio.interceptors.addAll([
      AuthInterceptor(_dio),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    ]);
  }

  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }

  Future<Response> postRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(
        headers: headers,
        followRedirects: false,
        validateStatus: (status) => status! < 500,
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> postRequestWithFormData(
    String endpoint,
    FormData formData, {
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.post(
      endpoint,
      data: formData,
      options: Options(
        headers: {'Content-Type': 'multipart/form-data', ...?headers},
        followRedirects: false,
        validateStatus: (status) => status! < 500,
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> updateRequest(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }

  Future<Response> updateRequestWithFormData(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: Options(
        headers: {'Content-Type': 'multipart/form-data', ...?headers},
      ),
      cancelToken: cancelToken,
    );
  }

  Future<Response> deleteRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.delete(
      endpoint,
      queryParameters: queryParams,
      options: Options(headers: headers),
      cancelToken: cancelToken,
    );
  }
}
