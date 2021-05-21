import 'package:flutter_go_fast/app/interfaces/error_interceptor_interface.dart';

import '../enums/response_status.dart';

import 'default_response.dart';

class ResponseBuilder {
  static DefaultResponse failed<T>(
      {T object, String message, IErrorInterceptor errorInterceptor}) {
    if (errorInterceptor != null) {
      message = errorInterceptor.handleError(message);
    }
    return DefaultResponse<T>(
        object: object, message: message, status: ResponseStatus.FAILED);
  }

  static DefaultResponse success<T>(
      {T object, String message, IErrorInterceptor errorInterceptor}) {
    if (errorInterceptor != null) {
      message = errorInterceptor.handleError(message);
    }
    return DefaultResponse<T>(
        object: object, message: message, status: ResponseStatus.SUCCESS);
  }
}
