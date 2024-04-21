/// 参考文章:
/// https://juejin.cn/post/7212597327579332668
/// https://juejin.cn/post/6844904190838325262#heading-22
/// https://juejin.cn/post/6962739332922736676

import 'package:dio/dio.dart';
import 'package:flutter_dio/network/http_transformer.dart';

import 'app_dio.dart';
import 'http_config.dart';
import 'http_parse.dart';
import 'http_response.dart';

class HttpClient {
  late final AppDio _dio;

  /// 这里冒号的作用：
  /// flutter构造函数后的冒号的作用是初始化，注意以下几点：
  // 1）不同于构造函数内部，这里不能使用this；
  // 2）这里的初始化可以是多个语句，多个语句之间使用逗号,分隔；
  // 3）这里可以调用父类构造函数,super();
  // 4）这里是为final字段赋值;
  // 5）可以使用assert检查参数
  // HttpClient({BaseOptions? options, HttpConfig? dioConfig})
  //     : _dio = AppDio(options: options, dioConfig: dioConfig);

  HttpClient._internal() {
    HttpConfig dioConfig = HttpConfig(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      // proxy: '',
      // interceptors: [NetCacheInterceptor()],
    );

    _dio = AppDio(dioConfig: dioConfig);
  }

  factory HttpClient() => _instance;

  static late final HttpClient _instance = HttpClient._internal();

  Future<HttpResponse> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return responseHandler(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return exceptionHandler(e);
    }
  }

  Future<HttpResponse> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return responseHandler(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return exceptionHandler(e);
    }
  }

  Future<HttpResponse> patch(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return responseHandler(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return exceptionHandler(e);
    }
  }

  Future<HttpResponse> delete(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return responseHandler(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return exceptionHandler(e);
    }
  }

  Future<HttpResponse> put(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return responseHandler(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return exceptionHandler(e);
    }
  }

  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      data,
      Options? options,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: data,
      );

      return response;
    } catch (e) {
      throw e;
    }
  }
}
