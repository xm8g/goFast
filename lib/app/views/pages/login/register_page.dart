import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/login/register_controller.dart';
import '../../widgets/scroll_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Registrar-se")),
      body: ScrollWidget(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "Seu e-mail"),
            onChanged: controller.setEmail,
          ),
          SizedBox(height: _height * 0.06),
          TextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(hintText: "Sua senha"),
            onChanged: controller.setPassword,
          ),
          SizedBox(height: _height * 0.06),
          Observer(
            builder: (context) {
              return RaisedButton(
                child: Text("REGISTRAR-SE",
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed: controller.enableButton
                  ? () async {
                    await controller.doRegister()
                      .catchError((error){
                        var snackbar = SnackBar(content: Text(error.message));
                        Scaffold.of(context).showSnackBar(snackbar);
                      });
                  }
                  : null
              );
            },
          ),
          SizedBox(height: _height * 0.06),
        ],
      ),
    );
  }
}
