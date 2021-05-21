import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/auth/auth_controller.dart';
import '../controllers/login/login_controller.dart';
import '../views/pages/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [$LoginController, $AuthController];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter("/login", child: (context, args) => LoginPage())];

  static Inject get to => Inject<LoginModule>.of();
}
