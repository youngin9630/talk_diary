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
    final sessionValue = cookie.split(';').firstWhere(
          (element) => element.startsWith('JSESSIONID='),
          orElse: () => '',
        );
    print("sessionValue: $sessionValue");
    if (sessionValue.isNotEmpty) {
      await storage.write(key: 'JSESSIONID', value: sessionValue);
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
