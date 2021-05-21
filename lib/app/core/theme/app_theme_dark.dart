import 'package:flutter/material.dart';

import '../../interfaces/theme_app_interface.dart';

class AppThemeDark implements IThemeApp {
  
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }

}