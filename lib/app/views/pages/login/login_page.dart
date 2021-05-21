import 'package:flutter/material.dart';
import 'package:flutter_go_fast/app/views/widgets/scroll_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../core/localization/app_translate.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {

  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: ScrollWidget(
        children: [
          TextField(
            onChanged: _authController.setEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "Seu e-mail"),
          ),
          SizedBox(height: _height * 0.06),
          TextField(
            onChanged: _authController.setPassword,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(hintText: "Sua senha"),
          ),
          SizedBox(height: _height * 0.06),
          Observer(builder: (context) {
            return RaisedButton(
              child: Text(AppTranslate(context).text('intro.login_now'),
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: _authController.enableButton
                  ? () async {
                    await _authController.doLoginEmailPassword()
                      .catchError((error){
                        var snackbar = SnackBar(content: Text(error.message));
                        Scaffold.of(context).showSnackBar(snackbar);
                      });
                  }
                  : null);
          }),
          SizedBox(height: _height * 0.06),
          RaisedButton(
              color: Colors.red,
              child: Text(AppTranslate(context).text('intro.login_google'),
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: _authController.doLoginGoolgle
          ),
          SizedBox(height: _height * 0.06),
          RaisedButton(
              color: Colors.grey,
              child: Text("REGISTRAR-SE",
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: controller.doRegister
          )
        ]),
    );
  }
}
