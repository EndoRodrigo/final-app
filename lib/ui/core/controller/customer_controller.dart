import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/data/model/customer_model.dart';

import '../../../data/services/customer_service.dart';


class CustomerController extends GetxController{

  final formKey = GlobalKey<FormState>();
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
  final isLoading = false.obs;

  final CustomerService _service = CustomerService();

  Stream<QuerySnapshot> get customers => _service.getCustomers();

  Future<void> addCustomer() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      await _service.createCustomer(buildCustomer());
      Get.snackbar('Éxito', 'Cliente creado correctamente', snackPosition: SnackPosition.BOTTOM,);

      //formKey.currentState?.reset();

    } catch (e) {
      Get.snackbar('Error', 'No se pudo crear el cliente');
    } finally {
      isLoading.value = false;
    }
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

  void clearInput() {
    identification.value = '';
    names.value = '';
    address.value = '';
    email.value = '';
    phone.value = '';
    identificationDocumentId.value = '';
    tributeId.value = '';
    municipalityId.value = '';
  }
}
