import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository authRepository;

  _AuthControllerBase(this.authRepository);

  @observable
  String email = '';

  @observable
  String password = '';

  @computed
  bool get enableButton => email.isNotEmpty && password.isNotEmpty;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  Future<void> doLoginGoolgle() async {
    await authRepository.doLoginGoogle().then((value) {
      if (value.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        print(value.message);
      }
    });
  }

  Future<void> doLoginEmailPassword() async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), passoword: password.trim())
        .then((response) {
      if (response.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        throw response;
      }
    });
  }

  Future<void> logout() async {
    var response = await authRepository.logout();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    }
  }
}
