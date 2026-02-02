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
    customer.value = Get.arguments;
    print('Informacion del customer $customer');
    if(Get.arguments != null){
      print('Se ejecuta metodo de actualizar');
      return CustomerModel(
          id: customer.value!['id'],
          identification: customer.value!['identification'],
          dv: customer.value!['dv'],
          company: customer.value!['company'],
          tradeName: customer.value!['trade_name'],
          names: customer.value!['names'],
          address: customer.value!['address'],
          email: customer.value!['email'],
          phone: customer.value!['phone'],
          legalOrganizationId: customer.value!['legal_organization_id'],
          tributeId: customer.value!['tribute_id'],
          identificationDocumentId: customer.value!['identification_document_id'],
          municipalityId: customer.value!['municipality_id'],
      );
    }else{
      print('Se ejecuta metodo de crear');
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
