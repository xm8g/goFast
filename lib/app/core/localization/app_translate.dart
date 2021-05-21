import 'package:flutter/cupertino.dart';

import 'app_localization.dart';

class AppTranslate {

  final BuildContext context;

  AppTranslate(this.context);

  String text(String key) {
    return AppLocalization.of(context).translate(key);
  }

}