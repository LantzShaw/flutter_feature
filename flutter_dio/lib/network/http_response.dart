import 'package:flutter_dio/network/http_exception.dart';

class HttpResponse {
  late bool ok;
  dynamic? data;
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
