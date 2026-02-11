import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tirando_factos/domain/models/withholding_taxes.dart';

import '../controller/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.isEditing ? 'Edit item' : 'Create items'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: controller.code_reference.value,
                  decoration: InputDecoration(label: Text('Code reference'), border: OutlineInputBorder(),),
                  onChanged: (v) => controller.code_reference.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.name.value,
                  decoration: InputDecoration(label: Text('Name'), border: OutlineInputBorder(),),
                  onChanged: (v) => controller.name.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.quantity.value.toString(),
                  decoration: InputDecoration(label: Text('Quantity'), border: OutlineInputBorder(),),
                  onChanged: (v) => controller.quantity.value = int.parse(v),
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.discount_rate.value.toString(),
                  decoration: InputDecoration(label: Text('Discount'), border: OutlineInputBorder(),),
                  onChanged: (v) => controller.discount_rate.value = double.parse(v),
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.price.value.toString(),
                  decoration: InputDecoration(label: Text('Price'), border: OutlineInputBorder(),),
                  onChanged: (v) => controller.price.value = double.parse(v),
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.tax_rate.value,
                  decoration: InputDecoration(label: Text('IVA'), border: OutlineInputBorder(),),
                  onChanged: (v) => controller.tax_rate.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                SizedBox(height: 18),
                Obx(() => DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text('Select unit of measurement'),
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: 70, child: Text('Unidad')),
                    DropdownMenuItem(value: 414, child: Text('kilogramo')),
                  ],
                  onChanged: (v) => controller.unit_measure_id.value = int.parse(v as String),
                ),),
                SizedBox(height: 18),
                Obx(() => DropdownButtonFormField(
                  decoration: InputDecoration(label: Text('Select standard code id'), border: OutlineInputBorder(),),
                  items: [
                    DropdownMenuItem(value: 1, child: Text('Unidad')),
                    DropdownMenuItem(value: 2, child: Text('kilogramo')),
                  ],
                  onChanged: (v) => controller.standard_code_id.value = int.parse(v as String),
                ),),
                SizedBox(height: 18),
                Obx(() => DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text('Select is excluded'),
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: 1, child: Text('SI')),
                    DropdownMenuItem(value: 0, child: Text('No')),
                  ],
                  onChanged: (v) => controller.is_excluded.value = int.parse(v as String),
                ),),
                SizedBox(height: 18),
                Obx(() => DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text('Select tribute id'),
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: 1, child: Text('Impuesto sobre la Ventas')),
                    DropdownMenuItem(value: 2, child: Text('Impuesto de Industria, Comercio y Aviso')),
                  ],
                  onChanged: (v) => controller.tribute_id.value = int.parse(v as String),
                ),),
                SizedBox(height: 18),

                Obx(() => DropdownButtonFormField(
                  decoration: InputDecoration(
                    label: Text('Select withholding tax rate'),
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: 1, child: Text('IVA')),
                    DropdownMenuItem(value: 2, child: Text('No aplica')),
                  ],
                  onChanged: (v) => controller.withholding_taxes.value = int.parse(v as String) as List<Withholding_taxes>,
                ),),

                SizedBox(height: 30),
                Obx(() => controller.isLoading.value ? const CircularProgressIndicator() : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.submit,
                    child: Text(
                      controller.isEditing ? 'Actualizar' : 'Crear',
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
