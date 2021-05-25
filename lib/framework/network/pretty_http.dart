import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:eye_video/framework/network/cookie/pretty_cookie.dart';
import 'package:eye_video/framework/network/dio_client.dart';
import 'package:eye_video/framework/network/interceptor/log_interceptor.dart';


class PrettyHttp {
  static const String GET = 'get';
  static const String POST = 'post';
  static const String DELETE = 'delete';
  static const String PUT = 'put';
  static const String HEAD = 'head';
  static const String PATCH = 'patch';

  static const String BASE_URL = "http://www.youkmi.cn:7300/";

  static Interceptor logInterceptor = PrettyLogInterceptor();

  static CookieManager cookieManager = CookieManager(CookieJarImpl());

  static Future<Map<String, dynamic>> http(String method, String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};

    try {
      BaseOptions options = DioHttpClient.createOptions(baseUrl,
          headers: headers);

      var dioClient = DioHttpClient.getInstance().getClient(baseUrl,
          newOptions: options, interceptors: []);
      Response<Map<String, dynamic>> response;

      switch (method) {
        case GET:
          response = await dioClient.get(pathUrl, queryParameters: reqParams);
          break;
        case POST:
          response = await dioClient.post(pathUrl, queryParameters: reqParams);
          break;
        case PUT:
          response = await dioClient.put(pathUrl, queryParameters: reqParams);
          break;
        case DELETE:
          response =
              await dioClient.delete(pathUrl, queryParameters: reqParams);
          break;
        case PATCH:
          response = await dioClient.patch(pathUrl, queryParameters: reqParams);
          break;
        case HEAD:
          response = await dioClient.head(pathUrl, queryParameters: reqParams);
          break;
        default:
          response = await dioClient.get(pathUrl, queryParameters: reqParams);
          break;
      }

      if (onSuccess != null) {
        onSuccess(response.data);
      }
      return Future.value(response.data);
    } catch (e) {
      if (onError != null) {
        onError(e.toString());
      }
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> get(String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};
    baseUrl = baseUrl ?? BASE_URL;
    return http(GET, pathUrl,
        baseUrl: baseUrl,
        reqParams: reqParams,
        headers: headers,
        onSuccess: onSuccess,
        onError: onError);
  }

  static Future<Map<String, dynamic>> post(String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};
    baseUrl = baseUrl ?? BASE_URL;
    return http(POST, pathUrl,
        baseUrl: baseUrl,
        reqParams: reqParams,
        headers: headers,
        onSuccess: onSuccess,
        onError: onError);
  }

  static Future<Map<String, dynamic>> put(String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};
    baseUrl = baseUrl ?? BASE_URL;
    return http(PUT, pathUrl,
        baseUrl: baseUrl,
        reqParams: reqParams,
        headers: headers,
        onSuccess: onSuccess,
        onError: onError);
  }

  static Future<Map<String, dynamic>> delete(String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};
    baseUrl = baseUrl ?? BASE_URL;
    return http(DELETE, pathUrl,
        baseUrl: baseUrl,
        reqParams: reqParams,
        headers: headers,
        onSuccess: onSuccess,
        onError: onError);
  }

  static Future<Map<String, dynamic>> patch(String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};
    baseUrl = baseUrl ?? BASE_URL;
    return http(PATCH, pathUrl,
        baseUrl: baseUrl,
        reqParams: reqParams,
        headers: headers,
        onSuccess: onSuccess,
        onError: onError);
  }

  static Future<Map<String, dynamic>> head(String pathUrl,
      {String baseUrl,
      Map<String, dynamic> reqParams,
      Map<String, dynamic> headers,
      Function(Map<String, dynamic>) onSuccess,
      Function(String) onError}) async {
    reqParams = reqParams ?? {};
    baseUrl = baseUrl ?? BASE_URL;
    return http(HEAD, pathUrl,
        baseUrl: baseUrl,
        reqParams: reqParams,
        headers: headers,
        onSuccess: onSuccess,
        onError: onError);
  }
}
