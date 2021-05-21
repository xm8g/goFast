import '../core/responses/default_response.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> doLoginGoogle();
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String passoword});
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  Future<DefaultResponse> getUser();
  Future<DefaultResponse> logout();
}
