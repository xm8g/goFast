import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/app_controller.dart';
import '../../../core/consts/routers_const.dart';
import '../../../core/localization/app_localization.dart';


class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Flutter GO Fast',
        theme: Modular.get<AppController>().themeApp.getTheme(),
        themeMode: Modular.get<AppController>().themeMode,
        initialRoute: RoutersConst.intro,
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
        supportedLocales: [Locale('en', 'US'), Locale('pt', 'BR')],
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var s in supportedLocales) {
            if (s.languageCode == locale.languageCode &&
                s.countryCode == locale.countryCode) {
              return s;
            }
          }
          return supportedLocales.first;
        },
      );
    });
  }
}
