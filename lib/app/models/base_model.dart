import 'package:cloud_firestore/cloud_firestore.dart';
import '../interfaces/base_model_interface.dart';

class BaseModel implements IBaseModelInterface {
  
  BaseModel();
    
  String id;
  bool isActive = true;
  Timestamp createAt;
  Timestamp updateAt;

  @override
  void disableDocument() => isActive = false;

  @override
  String documentId() => id;

  @override
  void enableDocument() => isActive = true;

  @override
  void setCreateTime() => createAt = Timestamp.now();

  @override
  void setUpdateTime() => updateAt = Timestamp.now();

  @override
  Map toMap() {
    var map = <String, dynamic>{};
    map['isActive'] = isActive;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;

    return map;
  }

  @override
  BaseModel.fromMap(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    isActive = documentSnapshot.data()['isActive'];
    createAt = documentSnapshot.data()['createAt'];
    updateAt = documentSnapshot.data()['updateAt'];
  } 
}