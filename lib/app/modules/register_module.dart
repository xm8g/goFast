import 'package:flutter_go_fast/app/controllers/login/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../views/pages/login/register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
    $RegisterController
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/register", child: (_, args) => RegisterPage())
  ];

}