import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tirando_factos/data/model/customer_model.dart';

import '../../domain/models/customer.dart';

class CustomerService {
  final _db = FirebaseFirestore.instance.collection('customers');

  Stream<QuerySnapshot> getCustomers() {
    return _db.snapshots();
  }

  Future<void> createCustomer(CustomerModel customer) async {
    await _db.add(customer.toMap());
  }

  Future<void> updateCustomer(CustomerModel customer) async {
    await _db.doc(customer.id).update(customer.toMap());
  }

  Future<void> deleteCustomer(String id) async {
    await _db.doc(id).delete();
  }
}
