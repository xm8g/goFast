import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IBaseModelInterface {

  String documentId();

  IBaseModelInterface();

  IBaseModelInterface.fromMap(DocumentSnapshot document);

  Map toMap();

  void disableDocument();

  void enableDocument();

  void setCreateTime();

  void setUpdateTime();
}