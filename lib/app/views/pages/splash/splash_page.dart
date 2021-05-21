import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../interfaces/firebase_repository_interface_base.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

/// Tela de entrada
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  UserRepository userRepository;
  String id;

  @override
  void initState() {
    userRepository = Modular.get<IFirebaseRepositoryBase>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: PageView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text("Add User"),
                    onPressed: () async {
                      var user = User(
                        name: "Alex Ronca Dutra",
                        bio: "Software Developer",
                        email: "alex.leleco@gmail.com",
                        photoUrl: "https://firebasestorage.googleapis.com/v0/b/gofast-361a9.appspot.com/o/20180202_073133.jpg?alt=media&token=2d8dde6a-5f24-4488-9e1b-26995b3856fd"
                      );
                      id = await userRepository.add(user);
                    }
                  ),
                  RaisedButton(
                    child: Text("Update User"),
                    onPressed: () async {
                      var user = await userRepository.getById(id);
                      user.name = "Alex Ronchi Dutra";
                      await userRepository.update(user);
                    }
                  ),
                  RaisedButton(
                    child: Text("Disable User"),
                    onPressed: () async {
                      var user = await userRepository.getById(id);
                      userRepository.disable(user);
                    }
                  ),
                  RaisedButton(
                    child: Text("Enable User"),
                    onPressed: () async {
                      var user = await userRepository.getById(id);
                      userRepository.enable(user);
                    }
                  ),
                  RaisedButton(
                    child: Text("Delete User"),
                    onPressed: () async {
                      await userRepository.delete(id);
                    }
                  ),
                  RaisedButton(
                    child: Text("Get Filter"),
                    onPressed: () async {
                      var listUsers = await userRepository.filter()
                      .where('name', isEqualTo: 'Alex')
                      .orderBy('name', descending: true)
                      .get()
                      .then((value) => value.docs);
                      userRepository.fromSnapshotToModelList(listUsers);
                    }
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
