import 'package:dio/dio.dart';

/// dio 配置项
class HttpConfig {
  final String? baseUrl;
  final String? proxy;
  final String? cookiesPath;
  final List<Interceptor>? interceptors;
  final Duration connectTimeout;
  final Duration sendTimeout;
  final Duration receiveTimeout;
  final Map<String, dynamic>? headers;

  HttpConfig({
    this.baseUrl,
    this.headers,
    this.proxy,
    this.cookiesPath,
    this.interceptors,
    this.connectTimeout = const Duration(seconds: 9),
    this.sendTimeout = const Duration(seconds: 9),
    this.receiveTimeout = const Duration(seconds: 9),
  });

// static DioConfig of() => Get.find<DioConfig>();
}
