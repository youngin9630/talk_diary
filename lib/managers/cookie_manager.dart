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
        await storage.write(key: entry.key, value: entry.value);
      }
    }
  }

  Future<void> clearCookies() async {
    await storage.delete(key: 'JSESSIONID');
    await storage.delete(key: 'remember-me');
  }

  Future<void> handleCookies(Map<String, List<String>> headers) async {
    // print("headers: $headers");
    final cookies = headers['Set-Cookie'];
    print("cookies: $cookies");
    if (cookies != null && cookies.isNotEmpty) {
      final sessionCookie = cookies.firstWhere(
        (cookie) => cookie.startsWith('JSESSIONID='),
        orElse: () => '',
      );

      if (sessionCookie.isNotEmpty) {
        await saveSessionCookie(sessionCookie);
      }
    }
    final jsessionid = await storage.read(key: "JSESSIONID");
    print("read JSESSIONID: $jsessionid");
    final rememberMe = await storage.read(key: "remember-me");
    print("read rememberMe: $rememberMe");
  }
}
