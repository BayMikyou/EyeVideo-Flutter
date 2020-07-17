import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("#LogInterceptor#, request baseUrl: ${options.baseUrl}");
    print("#LogInterceptor#, request pathUrl: ${options.path}");
    print("#LogInterceptor#, request headers: ${options.headers.toString()}");
    print("#LogInterceptor#, request params: ${options.data?.toString() ?? ''}");
    return Future.value(options);
  }

  @override
  Future onResponse(Response response) {
    if (response != null) {
      print("#LogInterceptor#, response: ${response.toString()}");
    }
    return Future.value(response);
  }

  @override
  Future onError(DioError err) {
    print("#LogInterceptor#, request error: ${err.toString()}, detail: ${err.response?.toString() ?? ''}");
    return Future.error(err);
  }
}
