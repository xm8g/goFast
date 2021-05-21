import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_localization_delegate.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  Map<String, dynamic> _localizationsStrings;

  Future<bool> load() async {
    var jsonStrings =
        await rootBundle.loadString("lang/${locale.languageCode}.json");
    Map<String, dynamic> map = json.decode(jsonStrings);

    _localizationsStrings = map.map((key, value) {
      return MapEntry(key, value);
    });

    return true;
  }

  String translate(String key,
      {Map<String, String> params, String defaultValue = ''}) {
    var value;
    if (key.contains('.')) {
      key.split('.').forEach((element) {
        if (value == null) {
          value = _localizationsStrings[element];
        } else {
          value = value[element];
        }
      });
    }

    if (value == null) {
      return throw ArgumentError(
          'key: $key not found in ${locale.languageCode}.json');
    }
    if (params != null) {
      params.forEach((key, value) {
        value = value.replaceAll('{{$key}}', value);
      });
    }
    return value ?? defaultValue;
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationsDelegate();
}
