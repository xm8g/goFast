import '../../interfaces/error_interceptor_interface.dart';

class LoginUsuarioSenhaErrorInterceptor implements IErrorInterceptor {
  @override
  String handleError(String error) {
    print('---------');
    print(error);
    print('---------');
    switch (error) {
      case 'ERROR_WEAK_PASSWORD':
        return 'Acho que essa senha está muito curta, tente uma maior';
        break;
      case 'ERROR_INVALID_EMAIL':
        return 'Ops! Esse email é inválido';
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Esse email já está cadastrado';
        break;
      default:
        return 'Não foi possível fazer o login,'
            ' tente novamente mais tarde';
    }
  }
}
