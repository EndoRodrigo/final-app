import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/data/model/customer_model.dart';

import '../../../data/services/customer_service.dart';


class CustomerController extends GetxController{
  final identification = ''.obs;
  final dv= ''.obs;
  final company= ''.obs;
  final tradeName= ''.obs;
  final names= ''.obs;
  final address= ''.obs;
  final email= ''.obs;
  final phone= ''.obs;
  final legalOrganizationId= ''.obs;
  final tributeId= ''.obs;
  final identificationDocumentId= ''.obs;
  final municipalityId= ''.obs;

  final CustomerService _service = CustomerService();

  Stream<QuerySnapshot> get customers => _service.getCustomers();

  Future<void> addCustomer() async {
    await _service.createCustomer(buildCustomer());
  }

  Future<void> editCustomer(CustomerModel customer) async {
    await _service.updateCustomer(customer);
  }

  Future<void> removeCustomer(String id) async {
    await _service.deleteCustomer(id);
  }

  CustomerModel buildCustomer() {
    return CustomerModel(
      identification: identification.value,
      dv: dv.value,
      company: company.value,
      tradeName: tradeName.value,
      names: names.value,
      address: address.value,
      email: email.value,
      phone: phone.value,
      legalOrganizationId: legalOrganizationId.value,
      tributeId: tributeId.value,
      identificationDocumentId: int.parse(identificationDocumentId.value),
      municipalityId: municipalityId.value,
    );
  }
}