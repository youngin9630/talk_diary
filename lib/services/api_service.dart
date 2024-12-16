// ignore_for_file: avoid_print
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:talk_diary/interceptors/api_interceptor.dart';
import 'package:talk_diary/managers/cookie_manager.dart';
import 'package:talk_diary/utils/dotenv.dart';

class ApiService {
  final storage = const FlutterSecureStorage();
  late final Dio _dio;

  // 싱글톤 인스턴스 생성
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  ApiService._internal();

  // 정적 생성자
  static Future<ApiService> create() async {
    await _instance._init();
    return _instance;
  }

  Future<void> _init() async {
    await Dotenv().load();
    try {
      final baseUrl = Dotenv.baseUrl;

      _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) => true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ));

      final cookieManager = CookieManager(storage);
      _dio.interceptors.add(ApiInterceptor(cookieManager));
    } catch (e) {
      throw Exception('Failed to initialize API service: $e');
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
          extra: {'withCredentials': true},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(
        path,
        options: Options(
          extra: {'withCredentials': true},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
