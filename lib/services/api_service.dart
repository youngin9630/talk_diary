// lib/services/api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://13.125.128.111:8080'; // EC2 서버 주소

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  // GET 요청 예시
  Future<String> getTest() async {
    try {
      final response = await _dio.get('/api/test');
      return response.data.toString();
    } catch (e) {
      throw Exception('Failed to load test: $e');
    }
  }

  // POST 요청 예
}
