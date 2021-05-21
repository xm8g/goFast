import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';

part 'intro_controller.g.dart';

@Injectable()
class IntroController = _IntroControllerBase with _$IntroController;

abstract class _IntroControllerBase with Store {

  void doEnter() {
    Modular.to.pushReplacementNamed(RoutersConst.login);
  }
  
}