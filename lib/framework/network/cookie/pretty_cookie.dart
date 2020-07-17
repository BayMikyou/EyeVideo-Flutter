import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';

class CookieJarImpl implements CookieJar {
  static const String _COOKIE_KEY_AUTH = 'ky_auth';
  static const String _COOKIE_KEY_SDK = 'sdk';
  static const String _COOKIE_AUTH_SAVE_KEY = 'KeyAuthCookie';

  @override
  List<Cookie> loadForRequest(Uri uri) {
    List<Cookie> cookies = [];
    var cookie1 = Cookie(_COOKIE_KEY_SDK, '28')..domain = uri.host;
    cookies.add(cookie1);
    var cookie2 = Cookie(_COOKIE_KEY_AUTH, getCookieValue())..domain = uri.host;
    cookies.add(cookie2);
    return cookies;
  }

  @override
  void saveFromResponse(Uri uri, List<Cookie> cookies) {
    Cookie cookieValue =
        cookies.singleWhere((element) => element.name == _COOKIE_KEY_AUTH);
    if (cookieValue != null) {
      saveCookieValue(cookieValue.value);
    }
  }

  void saveCookieValue(String value) {
    //save cookie into sp

  }

  String getCookieValue() {
    //get cookie from sp
    return "";
  }

  @override
  bool get ignoreExpires => false;
}
