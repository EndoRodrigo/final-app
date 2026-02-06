import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/item_model.dart';

class ItemService {
  final _db = FirebaseFirestore.instance.collection('items');

  Stream<QuerySnapshot> getItems() {
    return _db.snapshots();
  }

  Future<void> createItem(ItemModel item) async {
    await _db.add(item.toMap());
  }

  Future<void> updateItem(ItemModel item) async {
    await _db.doc(item.id).update(item.toMap());
  }

  Future<void> deleteItem(String id) async {
    await _db.doc(id).delete();
  }

}