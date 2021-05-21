import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_go_fast/app/models/base_model.dart';

class Client extends BaseModel {
  String name;
  String cpf;
  String email;

  @override
  Client({this.name, this.cpf, this.email});

  @override
  Client.fromMap(DocumentSnapshot documentSnapshot)
      : super.fromMap(documentSnapshot) {
        var map = documentSnapshot.data();
        name = map['name'];
        cpf = map['cpf'];
        email = map['email'];
      }

  @override
  Map toMap() {
    var map = super.toMap();
    map['name'] = name;
    map['cpf'] = cpf;
    map['email'] = email;

    return map;
  }
}
