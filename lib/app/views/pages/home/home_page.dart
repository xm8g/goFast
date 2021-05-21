import 'package:flutter/material.dart';
import 'package:flutter_go_fast/app/controllers/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: RaisedButton(
            child: Text("Sair"), 
            onPressed: _authController.logout),
      ),
    );
  }
}
