import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/data/model/customer_model.dart';

import '../../../data/services/customer_service.dart';
import '../../../routing/app_routes.dart';


class CustomerController extends GetxController{

  // ---------- FORM ----------
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  // ---------- DATA ----------

  final Rxn<Map<String, dynamic>> customer = Rxn<Map<String, dynamic>>();
  bool get isEditing => customer.value != null;

  // ---------- FIELS ----------
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

  // ---------- LIFECYCLE  ----------
  @override
  void onInit() {
    super.onInit();
    customer.value = Get.arguments;
    if (isEditing) {
      final c = customer.value!;
      identificationDocumentId.value = c['identification_document_id']?.toString() ?? '';
      identification.value = c['identification'] ?? '';
      names.value = c['names'] ?? '';
      address.value = c['address'] ?? '';
      email.value = c['email'] ?? '';
      phone.value = c['phone'] ?? '';
      tributeId.value = c['tribute_id']?.toString() ?? '';
      municipalityId.value = c['municipality_id']?.toString() ?? '';
    }
  }

  // ---------- ACTIONS ----------
  void submit() {
    if (!formKey.currentState!.validate()) return;
    isEditing ? editCustomer() : addCustomer();
  }


  final CustomerService _service = CustomerService();

  Stream<QuerySnapshot> get getCustomers => _service.getCustomers();

  Future<void> addCustomer() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      await _service.createCustomer(_payload());
      Get.snackbar('Éxito', 'Cliente creado correctamente', snackPosition: SnackPosition.BOTTOM,);
      Get.toNamed(AppRoutes.CUSTOMERDETAIL);

      //formKey.currentState?.reset();

    } catch (e) {
      Get.snackbar('Error', 'No se pudo crear el cliente');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editCustomer() async {
    await _service.updateCustomer(_payload());
  }

  Future<void> removeCustomer(String id) async {
    print('Se preciono el boton de eliminar $id');
    try{
      isLoading.value = true;

      await _service.deleteCustomer(id);
      Get.snackbar('Éxito', 'Cliente eliminado correctamente', snackPosition: SnackPosition.BOTTOM,);

    }catch(e){
      Get.snackbar('Error', 'No se pudo eliminar el cliente');
    }finally{
      isLoading.value = false;
    }

  }

  CustomerModel _payload() {
    return CustomerModel(
      id: '',
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
