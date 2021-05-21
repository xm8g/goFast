import 'package:flutter/cupertino.dart';

import 'app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['pt', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    var localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
