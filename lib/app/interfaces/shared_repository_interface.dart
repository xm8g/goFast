import 'package:flutter/material.dart';

abstract class ISharedRepository {
  
  String getUserInfo();
  void saveUserInfo(String userInfo);

  Future<ThemeMode> readThemeMode();
  Future<bool> saveThemeMode(ThemeMode themeMode);

}