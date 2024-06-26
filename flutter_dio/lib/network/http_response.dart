import 'package:flutter_dio/network/http_exception.dart';

class HttpResponse<T> {
  bool ok = false;
  T? data;
  HttpException? error;

  HttpResponse._internal({this.ok = false});

  HttpResponse.success(this.data) {
    ok = true;
  }

  HttpResponse.failure({String? errorMessage, int? errorCode}) {
    error = BadRequestException(errorMessage, errorCode);
  }

  HttpResponse.failureFromResponse({dynamic? data}) {
    error = BadResponseException(data);
    ok = false;
  }

  HttpResponse.failureFromError([HttpException? err]) {
    error = err ?? UnknownException();
    ok = false;
  }
}
