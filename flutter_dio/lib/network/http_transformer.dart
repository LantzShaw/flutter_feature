import 'package:dio/dio.dart';
import 'package:flutter_dio/network/http_response.dart';

abstract class HttpTransformer {
  HttpResponse parse(Response response);
}
