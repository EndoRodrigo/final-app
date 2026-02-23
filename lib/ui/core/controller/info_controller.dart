import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/item_model.dart';
import '../../../data/services/Item_service.dart';
import '../../../domain/models/withholding_taxes.dart';


class ItemController extends GetxController{

  // ---------- FORM ----------
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  // ---------- DATA ----------

  final Rxn<Map<String, dynamic>> controller = Rxn<Map<String, dynamic>>();
  bool get isEditing => controller.value != null;
  Set<String> Opcion = { 'si', 'no' };

  // ---------- FIELDS ----------
  final code_reference = ''.obs;
  final name = ''.obs;
  final quantity = 0.obs;
  final discount_rate = 0.0.obs;
  final price = 0.0.obs;
  final tax_rate = ''.obs;
  final unit_measure_id = 0.obs;
  final standard_code_id = 0.obs;
  final is_excluded = 0.obs;
  final tribute_id = 0.obs;
  //final withholding_taxes = <Withholding_taxes>[].obs;


  @override
  void onInit() {
    super.onInit();
    getData();
  }

  // ---------- ACTIONS ----------
  void submit() {
    if (!formKey.currentState!.validate()) return;
    isEditing ? editcontroller() : addcontroller();
  }


  final ItemService _service = ItemService();

  Stream<QuerySnapshot> get getItems => _service.getItems();

  Future<void> addcontroller() async {
    try {
      isLoading.value = true;
      print(_payload());
      await _service.createItem(_payload());
      Get.snackbar('Éxito', 'Cliente creado correctamente', snackPosition: SnackPosition.BOTTOM,);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'No se pudo crear el cliente');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editcontroller() async {
    try {
      isLoading.value = true;
      await _service.updateItem(_payload());
      Get.snackbar('Éxito', 'Cliente actualizado correctamente', snackPosition: SnackPosition.BOTTOM,);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'No se pudo actualizar el cliente');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeItem(String id) async {
    try{
      isLoading.value = true;
      await _service.deleteItem(id);
      Get.snackbar('Éxito', 'Cliente eliminado correctamente', snackPosition: SnackPosition.BOTTOM,);
    }catch(e){
      Get.snackbar('Error', 'No se pudo eliminar el cliente');
    }finally{
      isLoading.value = false;
    }

  }

  ItemModel _payload() {
    return ItemModel(
      id: controller.value?['id'] ?? '',
      code_reference: code_reference.value,
      name: name.value,
      quantity: quantity.value,
      discount_rate: discount_rate.value,
      price: price.value,
      tax_rate: tax_rate.value,
      unit_measure_id: unit_measure_id.value,
      standard_code_id: standard_code_id.value,
      is_excluded: is_excluded.value,
      tribute_id: tribute_id.value,
      //withholding_taxes: withholding_taxes.value,
    );
  }

  void getData(){
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      controller.value = args;
      code_reference.value = controller.value!['code_reference'];
      name.value = controller.value!['name'];
      quantity.value = controller.value!['quantity'];
      discount_rate.value = controller.value!['discount_rate'];
      price.value = controller.value!['price'];
      tax_rate.value = controller.value!['tax_rate'];
      unit_measure_id.value = controller.value!['unit_measure_id'];
      standard_code_id.value = controller.value!['standard_code_id'];
      is_excluded.value = controller.value!['is_excluded'];
      tribute_id.value = controller.value!['tribute_id'];
      //withholding_taxes.value = controller.value!['withholding_taxes'];

    } else {
      controller.value = null;
      clearInput();
    }
  }


  void clearInput() {
    code_reference.value = '';
    name.value = '';
    quantity.value = 0;
    discount_rate.value = 0.0;
    price.value = 0.0;
    tax_rate.value = '';
    unit_measure_id.value = 0;
    standard_code_id.value = 0;
    is_excluded.value = 0;
    tribute_id.value = 0;
    //withholding_taxes.value = [];
  }
}
