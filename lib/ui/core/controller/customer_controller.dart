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

  // ---------- FIELDS ----------
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

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  // ---------- ACTIONS ----------
  void submit() {
    if (!formKey.currentState!.validate()) return;
    isEditing ? editCustomer() : addCustomer();
  }


  final CustomerService _service = CustomerService();

  Stream<QuerySnapshot> get getCustomers => _service.getCustomers();

  Future<void> addCustomer() async {
    try {
      isLoading.value = true;
      await _service.createCustomer(_payload());
      Get.snackbar('Éxito', 'Cliente creado correctamente', snackPosition: SnackPosition.BOTTOM,);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'No se pudo crear el cliente');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editCustomer() async {
    try {
      isLoading.value = true;
      await _service.updateCustomer(_payload());
      Get.snackbar('Éxito', 'Cliente actualizado correctamente', snackPosition: SnackPosition.BOTTOM,);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'No se pudo actualizar el cliente');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeCustomer(String id) async {
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
        id: isEditing ? customer.value!['id'] : '',
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
        identificationDocumentId: int.tryParse(identificationDocumentId.value) ?? 1,
        municipalityId: municipalityId.value,
    );
  }

  void getData(){
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      customer.value = args;
      identification.value = args['identification']?.toString() ?? '';
      dv.value = args['dv']?.toString() ?? '';
      company.value = args['company'] ?? '';
      tradeName.value = args['trade_name'] ?? '';
      names.value = args['names'] ?? '';
      address.value = args['address'] ?? '';
      email.value = args['email'] ?? '';
      phone.value = args['phone']?.toString() ?? '';
      legalOrganizationId.value = args['legal_organization_id']?.toString() ?? '';
      tributeId.value = args['tribute_id']?.toString() ?? '';
      identificationDocumentId.value = args['identification_document_id']?.toString() ?? '';
      municipalityId.value = args['municipality_id']?.toString() ?? '';
    } else {
      customer.value = null;
      clearInput();
    }
  }


  void clearInput() {
    identification.value = '';
    dv.value = '';
    company.value = '';
    tradeName.value = '';
    names.value = '';
    address.value = '';
    email.value = '';
    phone.value = '';
    legalOrganizationId.value = '';
    tributeId.value = '';
    identificationDocumentId.value = '';
    municipalityId.value = '';
  }
}
