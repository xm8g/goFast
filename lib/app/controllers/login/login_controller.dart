import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_go_fast/app/core/consts/routers_const.dart';
import 'package:flutter_go_fast/app/interfaces/auth_repository_interface.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }

}
