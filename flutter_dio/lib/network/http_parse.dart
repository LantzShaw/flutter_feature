import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dio/network/default_http_transformer.dart';
import 'package:flutter_dio/network/http_exception.dart';
import 'package:flutter_dio/network/http_response.dart';
import 'package:flutter_dio/network/http_transformer.dart';

HttpResponse responseHandler(Response? response,
    {HttpTransformer? httpTransformer}) {
  httpTransformer ??= DefaultHttpTransformer.getInstance();

  // 返回值异常
  if (response == null) {
    return HttpResponse.failureFromError();
  }

  // token失效
  if (_isTokenTimeout(response.statusCode)) {
    return HttpResponse.failureFromError(
        UnauthorisedException(message: '没有权限', code: response.statusCode));
  }

  if (_isRequestSuccess(response.statusCode)) {
    // 接口调用成功
    return httpTransformer.parse(response);
  } else {
    // 接口调用失败
    return HttpResponse.failure(
        errorMessage: response.statusMessage, errorCode: response.statusCode);
  }
}

/// 鉴权失败
bool _isTokenTimeout(int? code) {
  return code == 401;
}

/// 请求成功
bool _isRequestSuccess(int? statusCode) {
  return (statusCode != null && statusCode >= 200 && statusCode < 300);
}

HttpResponse exceptionHandler(exception) {
  var parserException = _parseException(exception);

  return HttpResponse.failureFromError(parserException);
}

HttpException _parseException(Exception error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkException(message: error.message);
      case DioExceptionType.cancel:
        return CancelException(error.message);
      case DioExceptionType.badResponse:
        try {
          int? errorCode = error.response?.statusCode;
          switch (errorCode) {
            case 400:
              return BadRequestException('请求', errorCode);
            case 401:
              return UnauthorisedException(message: '请求', code: errorCode);
            case 403:
              return BadRequestException('服务器拒绝执行', errorCode);
            case 404:
              return BadRequestException('无法连接服务器', errorCode);
            case 405:
              return BadRequestException('请求方法禁止', errorCode);
            case 500:
              return BadServiceException('服务器内部错误', errorCode);
            case 502:
              return BadServiceException('无效请求', errorCode);
            case 503:
              return BadServiceException('服务器挂了', errorCode);
            case 505:
              return UnauthorisedException(
                  message: '不支持http协议', code: errorCode);
            default:
              return UnknownException(error.message);
          }
        } on Exception catch (_) {
          return UnknownException(error.message);
        }
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return NetworkException(message: error.message);
        } else {
          return UnknownException(error.message);
        }
      case DioExceptionType.badCertificate:
        return NetworkException(message: error.message);
      case DioExceptionType.connectionError:
        return NetworkException(message: error.message);
    }
  } else {
    return UnknownException((error.toString()));
  }
}

// HttpResponse handleResponse(Response? response,
//     {HttpTransformer? httpTransformer}) {
//   httpTransformer ??= DefaultHttpTransformer.getInstance();
//
//   // 返回值异常
//   if (response == null) {
//     return HttpResponse.failureFromError();
//   }
//
//   // token失效
//   if (_isTokenTimeout(response.statusCode)) {
//     return HttpResponse.failureFromError(
//         UnauthorisedException(message: "没有权限", code: response.statusCode));
//   }
//   // 接口调用成功
//   if (_isRequestSuccess(response.statusCode)) {
//     return httpTransformer.parse(response);
//   } else {
//     // 接口调用失败
//     return HttpResponse.failure(
//         errorMsg: response.statusMessage, errorCode: response.statusCode);
//   }
// }
//
// HttpResponse handleException(Exception exception) {
//   var parseException = _parseException(exception);
//   return HttpResponse.failureFromError(parseException);
// }
//
// /// 鉴权失败
// bool _isTokenTimeout(int? code) {
//   return code == 401;
// }
//
// /// 请求成功
// bool _isRequestSuccess(int? statusCode) {
//   return (statusCode != null && statusCode >= 200 && statusCode < 300);
// }
//
// HttpException _parseException(Exception error) {
//   if (error is DioError) {
//     switch (error.type) {
//       case DioErrorType.connectTimeout:
//       case DioErrorType.receiveTimeout:
//       case DioErrorType.sendTimeout:
//         return NetworkException(message: error.message);
//       case DioErrorType.cancel:
//         return CancelException(error.message);
//       case DioErrorType.response:
//         try {
//           int? errCode = error.response?.statusCode;
//           switch (errCode) {
//             case 400:
//               return BadRequestException(message: "请求语法错误", code: errCode);
//             case 401:
//               return UnauthorisedException(message: "没有权限", code: errCode);
//             case 403:
//               return BadRequestException(message: "服务器拒绝执行", code: errCode);
//             case 404:
//               return BadRequestException(message: "无法连接服务器", code: errCode);
//             case 405:
//               return BadRequestException(message: "请求方法被禁止", code: errCode);
//             case 500:
//               return BadServiceException(message: "服务器内部错误", code: errCode);
//             case 502:
//               return BadServiceException(message: "无效的请求", code: errCode);
//             case 503:
//               return BadServiceException(message: "服务器挂了", code: errCode);
//             case 505:
//               return UnauthorisedException(
//                   message: "不支持HTTP协议请求", code: errCode);
//             default:
//               return UnknownException(error.message);
//           }
//         } on Exception catch (_) {
//           return UnknownException(error.message);
//         }
//
//       case DioErrorType.other:
//         if (error.error is SocketException) {
//           return NetworkException(message: error.message);
//         } else {
//           return UnknownException(error.message);
//         }
//       default:
//         return UnknownException(error.message);
//     }
//   } else {
//     return UnknownException(error.toString());
//   }
// }
