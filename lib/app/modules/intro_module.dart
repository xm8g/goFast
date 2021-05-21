import 'package:flutter_go_fast/app/controllers/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/intro/intro_controller.dart';
import '../views/pages/intro/intro_page.dart';



class IntroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $IntroController, $AuthController
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter("/login", child: (context, args) => IntroPage())];
  
  static Inject get to => Inject<IntroModule>.of();
}
