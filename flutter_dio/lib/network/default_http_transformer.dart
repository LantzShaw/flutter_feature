import 'package:dio/dio.dart';
import 'package:flutter_dio/network/http_transformer.dart';

import 'http_response.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    return HttpResponse.success(response);
    // if (response.data['status'] == 100) {
    //   return HttpResponse.success(response.data['data']);
    // } else if (response.data['code'] == 1 && response.data['msg'] == '成功') {
    //   return HttpResponse.success(response.data['data']);
    // } else {
    //   return HttpResponse.failure(
    //       errorMessage: response.data['message'],
    //       errorCode: response.data['code']);
    // }
  }

  /// 单例对象
  static DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造函数，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}
