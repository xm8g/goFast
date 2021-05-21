import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;


abstract class _RegisterControllerBase with Store {

  final IAuthRepository authRepository;
  
  _RegisterControllerBase(this.authRepository);

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

  Future<void> doRegister() async {
    var response = await authRepository.registerEmailPassword(
      email: email,
      password: password
    );
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    } else {
      throw response;
    }
  }



  

  
}
