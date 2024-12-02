// ignore_for_file: avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiService {
  static const String baseUrl = 'http://13.125.128.111:8080';
  final storage = const FlutterSecureStorage();
  late final Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (status) => true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      extra: {
        'withCredentials': true,
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (!kIsWeb) {
          final sessionCookie = await storage.read(key: 'JSESSIONID');
          if (sessionCookie != null) {
            options.headers['Cookie'] = sessionCookie;
          }
        }
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        if (!kIsWeb) {
          await _handleCookies(response);
        }
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        return handler.next(e);
      },
    ));
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(String path) async {
    final response = await _dio.get(path);
    return response;
  }

  Future<void> _handleCookies(Response response) async {
    final setCookie = response.headers['set-cookie'];
    if (setCookie != null && setCookie.isNotEmpty) {
      // 'JSESSIONID=...' 부분만 추출하여 저장
      final sessionId = setCookie.first.split(';').first;
      await storage.write(key: 'JSESSIONID', value: sessionId);

      if (sessionId.contains('remember-me=true')) {
        await storage.write(key: 'rememberMe', value: 'true');
      }
    } else {}
  }

  Future<void> clearCookies() async {
    await storage.delete(key: 'JSESSIONID');
    await storage.delete(key: 'rememberMe');
  }
}
