import '../enums/response_status.dart';

class DefaultResponse<T> {

  final T object;
  final String message;
  final ResponseStatus status;
  
  bool get success => status == ResponseStatus.SUCCESS;
  bool get failed => status == ResponseStatus.FAILED;
  
  DefaultResponse({
    this.object,
    this.message,
    this.status,
  });

  
}
