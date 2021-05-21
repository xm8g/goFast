import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../core/theme/app_theme_factory.dart';
import '../interfaces/shared_repository_interface.dart';
import '../interfaces/theme_app_interface.dart';
import '../repositories/shared_repository.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  SharedRepository sharedRepository = Modular.get<ISharedRepository>();

  _AppControllerBase() {
    loadThemeData();
  }

  @observable
  IThemeApp themeApp = AppThemeFactory.getTheme(ThemeMode.light);

  ThemeMode themeMode = ThemeMode.light;

  @action
  Future<void> loadThemeData() async {
    await sharedRepository.readThemeMode().then((tMode) {
      themeMode = tMode;
      themeApp = AppThemeFactory.getTheme(tMode);
      setThemeData(tMode, saveShared: false);
    });
  }

  @action
  Future<void> setThemeData(ThemeMode themeMode,
      {bool saveShared = true}) async {
    themeApp = AppThemeFactory.getTheme(themeMode);
    if (saveShared) {
      await sharedRepository.saveThemeMode(themeMode);
    }
  }
}
