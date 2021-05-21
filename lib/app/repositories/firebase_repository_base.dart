import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../interfaces/firebase_repository_interface_base.dart';
import '../models/base_model.dart';

class FirebaseRepositoryBase<Model extends BaseModel>
    implements IFirebaseRepositoryBase<Model> {

  String collection;

  CollectionReference collectionReference;

  final Model Function(DocumentSnapshot documentSnapshot) fromMap;

  FirebaseRepositoryBase({this.fromMap, this.collection}) {
    collectionReference = FirebaseFirestore.instance.collection(collection);
    collection ?? '${Model.toString().toLowerCase()}s';
  }

  
  @override
  Future<String> add(Model model) async {
    model.setCreateTime();
    model.setUpdateTime();
    var collection = collectionReference;
    var document = await collection.add(model.toMap());
    return document.id;
  }

  @override
  Future<void> delete(String documentId) async {
    var collection = collectionReference;
    await collection.doc(documentId).delete();
  }

  @override
  Future<void> disable(Model model) async {
    model.disableDocument();
    update(model);
  }

  @override
  Future<void> enable(Model model) async {
    model.enableDocument();
    update(model);
  }

  @override
  CollectionReference filter() {
    return collectionReference;
  }

  @override
  Future<List<Model>> findAll() async {
    var collection = collectionReference;
    var list = <Model>[];
    var querySnapshot = await collection.get();
    await querySnapshot.docs.forEach((element) {
      list.add(fromMap(element));
    });
    return await list;
  }

  @override
  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentSnapshot) {
    var list = <Model>[];
    documentSnapshot.forEach((element) {
      list.add(fromMap(element));
    });
    return list;
  }

  @override
  Future<Model> getById(String documentId) async {
    var collection = collectionReference;
    var snapshot = await collection.doc(documentId).get();
    return fromMap(snapshot);
  }

  @override
  Future<void> update(Model model) async {
    model.setUpdateTime();
    var collection = collectionReference;
    await collection.doc(model.documentId()).update(model.toMap());
  }

  Future<StreamSubscription<QuerySnapshot>> listen(
    void Function(QuerySnapshot) onData) async {
    return collectionReference.snapshots().listen(onData);
  }
}
