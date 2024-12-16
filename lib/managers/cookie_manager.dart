import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CookieManager {
  final FlutterSecureStorage storage;

  CookieManager(this.storage);

  Future<void> init() async {
    await clearCookies();
  }

  Future<String?> getSessionCookie() async {
    final cookie = await storage.read(key: 'JSESSIONID');
    return cookie?.isNotEmpty == true ? cookie : null;
  }

  Future<void> saveSessionCookie(String cookie) async {
    // 쿠키 리스트 분리
    final cookies = cookie.split(';');

    // 쿠키 값 추출
    final Map<String, String> cookieMap = {
      'JSESSIONID': cookies.firstWhere(
        (element) => element.startsWith('JSESSIONID='),
        orElse: () => '',
      ),
      'remember-me': cookies.firstWhere(
        (element) => element.startsWith('remember-me='),
        orElse: () => '',
      ),
    };

    // 유효한 쿠키만 저장
    for (final entry in cookieMap.entries) {
      if (entry.value.isNotEmpty) {
        debugPrint("save cookie: ${entry.key}=${entry.value}");
        await storage.write(key: entry.key, value: entry.value);
      }
    }
  }

  Future<void> clearCookies() async {
    await storage.delete(key: 'JSESSIONID');
    await storage.delete(key: 'remember-me');
  }

  Future<void> handleCookies(Map<String, List<String>> headers) async {
    debugPrint("headers: $headers");

    final cookies = headers['set-cookie'];
    debugPrint("cookies: $cookies");

    if (cookies != null && cookies.isNotEmpty) {
      // clearCookies();
      await saveSessionCookie(cookies.join(';'));
    }

    // 저장된 쿠키 확인 로그
    final jsessionid = await storage.read(key: "JSESSIONID");
    debugPrint("read JSESSIONID: $jsessionid");

    final rememberMe = await storage.read(key: "remember-me");
    debugPrint("read rememberMe: $rememberMe");
  }
}
