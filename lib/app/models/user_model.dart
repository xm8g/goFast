import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_model.dart';

class User extends BaseModel {
  String name;
  String bio;
  String photoUrl;
  String email;

  User({this.name, this.bio, this.photoUrl, this.email});

  @override
  Map toMap() {
    var map = super.toMap();
    map['name'] = name;
    map['bio'] = bio;
    map['photoUrl'] = photoUrl;
    map['email'] = email;

    return map;
  }

  @override
  User.fromMap(DocumentSnapshot documentSnapshot)
      : super.fromMap(documentSnapshot) {
    name = documentSnapshot.data()['name'];
    bio = documentSnapshot.data()['bio'];
    photoUrl = documentSnapshot.data()['photoUrl'];
    email = documentSnapshot.data()['email'];
  }
}
