import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talk_diary/managers/cookie_manager.dart';

class ApiInterceptor extends Interceptor {
  final CookieManager cookieManager;

  ApiInterceptor(this.cookieManager);

  // 요청 인터셉터
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!kIsWeb) {
      final sessionCookie = await cookieManager.getSessionCookie();

      if (sessionCookie != null) {
        options.headers['Cookie'] = sessionCookie;
      }
    }

    return handler.next(options); // 다음 인터셉터로 전달
  }

  // 응답 인터셉터
  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (!kIsWeb) {
      await cookieManager.handleCookies(response.headers.map);
    }

    return handler.next(response); // 다음 인터셉터로 전달
  }

  // 오류 인터셉터
  @override
  Future<void> onError(DioException e, ErrorInterceptorHandler handler) async {
    print("Dio Error: ${e.message}");
    return handler.next(e); // 오류 전달
  }
}
