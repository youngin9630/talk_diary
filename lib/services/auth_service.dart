import 'dart:convert';
import 'package:talk_diary/managers/storage_manager.dart';
import 'package:talk_diary/services/api_service.dart';
import 'package:talk_diary/models/login_dto.dart';
import 'package:talk_diary/store/auth_store.dart';

class AuthService {
  final storage = StorageManager().storage;
  late final ApiService _apiService;

  AuthService._();

  static Future<AuthService> create() async {
    final authService = AuthService._();
    authService._apiService = await ApiService.create(); // 비동기 초기화
    return authService;
  }

  Future<bool> login(String email, String password, bool rememberMe) async {
    try {
      final loginDTO = LoginDTO(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );

      final response = await _apiService.post(
        '/api/users/login',
        jsonEncode(loginDTO.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkLoginStatus() async {
    try {
      final response = await _apiService.get('/api/users/me');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _apiService.post('/api/users/logout', '');
    } finally {
      // 저장된 세션 ID와 remember-me 토큰 삭제
      await storage.delete(key: 'JSESSIONID');
      await storage.delete(key: 'rememberMe');
    }
  }

  Future<bool> isLoggedIn() async {
    final sessionId = await storage.read(key: 'JSESSIONID');
    final rememberMe = await storage.read(key: 'rememberMe');

    return sessionId != null || rememberMe != null;
  }

  // ApiService.dart 수정
}
