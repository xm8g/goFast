import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_model_interface.dart';

abstract class IFirebaseRepositoryBase<Model extends IBaseModelInterface> {

  Future<String> add(Model model);

  Future<void> update(Model model);

  Future<void> disable(Model model);

  Future<void> enable(Model model);

  Future<void> delete(String documentId);

  Future<Model> getById(String documentId);

  Future<List<Model>> findAll();

  CollectionReference filter();

  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentSnapshot);

}