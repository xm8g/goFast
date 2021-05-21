import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/app_controller.dart';
import '../core/consts/routers_const.dart';
import '../interfaces/auth_repository_interface.dart';
import '../interfaces/firebase_repository_interface_base.dart';
import '../interfaces/shared_repository_interface.dart';
import '../repositories/auth_repository.dart';
import '../repositories/shared_repository.dart';
import '../repositories/user_repository.dart';
import '../views/pages/main/app_widget.dart';
import '../views/pages/splash/splash_page.dart';
import 'home_module.dart';
import 'intro_module.dart';
import 'login_module.dart';
import 'register_module.dart';

class AppModule extends MainModule {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
    Bind<ISharedRepository>((i) => SharedRepository()),
    Bind<IAuthRepository>((i) => AuthRepository(firebaseAuth)),
    Bind<IFirebaseRepositoryBase>((i) => UserRepository()),
    Bind((i) => AppController())
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(RoutersConst.splash,
            child: (context, args) => SplashPage(),
            transition: TransitionType.noTransition),
    ModularRouter(RoutersConst.home, module: HomeModule()),
    ModularRouter(RoutersConst.intro, module: IntroModule()),
    ModularRouter(RoutersConst.login, module: LoginModule()),
    ModularRouter(RoutersConst.register, module: RegisterModule())
      ];

  @override
  Widget get bootstrap => AppWidget();
}
