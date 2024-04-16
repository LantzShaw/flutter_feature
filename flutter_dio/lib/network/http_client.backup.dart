// /// 参考文章:
// /// https://juejin.cn/post/7212597327579332668
// /// https://juejin.cn/post/6844904190838325262#heading-22
// /// https://juejin.cn/post/6962739332922736676
//
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// const BASE_URL = 'https://jsonplaceholder.typicode.com';
//
// class HttpClient {
//   static BaseOptions _options = BaseOptions(
//     baseUrl: BASE_URL,
//     connectTimeout: const Duration(seconds: 5),
//     receiveTimeout: const Duration(seconds: 3),
//   );
//
//   static Dio _dio = Dio(_options);
//
//   void _configureDio() {
//     _addInterceptors();
//   }
//
//   void _addInterceptors() {
//     // _dio.interceptors.add(RequestInterceptors());
//     // _dio.interceptors.add(ResponseInterceptors());
//     // _dio.interceptors.add(ErrorInterceptors());
//     // _dio.interceptors.add(LogInterceptor());
//   }
//
//   static Future<HttpResponse> get(
//     String uri, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     // HttpTransfomer? httpTransfomer
//   }) async {
//     try {
//       var response = _dio.get(
//         uri,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//
//       // return response;
//
//       // return responseHandler;
//     } on Exception catch (e) {
//       print(e);
//       // return exceptionHandler(e)
//     }
//   }
//
//   static Future<HttpResponse> post(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     // HttpTransformer? httpTransformer,
//   }) {
//     try {
//       var response = _dio.post(uri,
//           data: data,
//           queryParameters: queryParameters,
//           options: options,
//           cancelToken: cancelToken,
//           onReceiveProgress: onReceiveProgress);
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
//
//   Future<HttpResponse> patch(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//     // HttpTransformer? httpTransformer,
//   }) async {
//     try {
//       var response = await _dio.patch(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       // return handleResponse(response, httpTransformer: httpTransformer);
//     } on Exception catch (e) {
//       // return handleException(e);
//     }
//   }
//
//   Future<HttpResponse> delete(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     // HttpTransformer? httpTransformer,
//   }) async {
//     try {
//       var response = await _dio.delete(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       // return handleResponse(response, httpTransformer: httpTransformer);
//     } on Exception catch (e) {
//       // return handleException(e);
//     }
//   }
//
//   Future<HttpResponse> put(
//     String uri, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     // HttpTransformer? httpTransformer,
//   }) async {
//     try {
//       var response = await _dio.put(
//         uri,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       // return handleResponse(response, httpTransformer: httpTransformer);
//     } on Exception catch (e) {
//       // return handleException(e);
//     }
//   }
//
//   Future<Response> download(
//     String urlPath,
//     savePath, {
//     ProgressCallback? onReceiveProgress,
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//     bool deleteOnError = true,
//     String lengthHeader = Headers.contentLengthHeader,
//     data,
//     Options? options,
//     // HttpTransformer? httpTransformer,
//   }) async {
//     try {
//       var response = await _dio.download(
//         urlPath,
//         savePath,
//         onReceiveProgress: onReceiveProgress,
//         queryParameters: queryParameters,
//         cancelToken: cancelToken,
//         deleteOnError: deleteOnError,
//         lengthHeader: lengthHeader,
//         data: data,
//         options: data,
//       );
//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }
// }
