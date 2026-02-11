import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.isEditing ? 'Editar ítem' : 'Crear ítem'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: controller.code_reference.value,
                  decoration: const InputDecoration(label: Text('Referencia de código'), border: OutlineInputBorder()),
                  onChanged: (v) => controller.code_reference.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.name.value,
                  decoration: const InputDecoration(label: Text('Nombre'), border: OutlineInputBorder()),
                  onChanged: (v) => controller.name.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.quantity.value.toString(),
                  decoration: const InputDecoration(label: Text('Cantidad'), border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => controller.quantity.value = int.tryParse(v) ?? 0,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.discount_rate.value.toString(),
                  decoration: const InputDecoration(label: Text('Descuento'), border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => controller.discount_rate.value = double.tryParse(v) ?? 0.0,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.price.value.toString(),
                  decoration: const InputDecoration(label: Text('Precio'), border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => controller.price.value = double.tryParse(v) ?? 0.0,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                TextFormField(
                  initialValue: controller.tax_rate.value,
                  decoration: const InputDecoration(label: Text('IVA'), border: OutlineInputBorder()),
                  onChanged: (v) => controller.tax_rate.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                Obx(() => DropdownButtonFormField<int>(
                  value: controller.unit_measure_id.value == 0 ? null : controller.unit_measure_id.value,
                  decoration: const InputDecoration(label: Text('Unidad de medida'), border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 70, child: Text('Unidad')),
                    DropdownMenuItem(value: 414, child: Text('Kilogramo')),
                  ],
                  onChanged: (v) => controller.unit_measure_id.value = v!,
                )),
                const SizedBox(height: 18),
                Obx(() => DropdownButtonFormField<int>(
                  value: controller.standard_code_id.value == 0 ? null : controller.standard_code_id.value,
                  decoration: const InputDecoration(label: Text('Código estándar'), border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('Unidad')),
                    DropdownMenuItem(value: 2, child: Text('Kilogramo')),
                  ],
                  onChanged: (v) => controller.standard_code_id.value = v!,
                )),
                const SizedBox(height: 18),
                Obx(() => DropdownButtonFormField<int>(
                  value: controller.is_excluded.value,
                  decoration: const InputDecoration(label: Text('¿Es excluido?'), border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('SÍ')),
                    DropdownMenuItem(value: 0, child: Text('NO')),
                  ],
                  onChanged: (v) => controller.is_excluded.value = v!,
                )),
                const SizedBox(height: 18),
                Obx(() => DropdownButtonFormField<int>(
                  value: controller.tribute_id.value == 0 ? null : controller.tribute_id.value,
                  decoration: const InputDecoration(label: Text('Tributo'), border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('Impuesto sobre las Ventas')),
                    DropdownMenuItem(value: 2, child: Text('Impuesto de Industria y Comercio')),
                  ],
                  onChanged: (v) => controller.tribute_id.value = v!,
                )),
                const SizedBox(height: 18),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(label: Text('Tasa de retención'), border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('IVA')),
                    DropdownMenuItem(value: 2, child: Text('No aplica')),
                  ],
                  onChanged: (v) {}, // Temporal hasta que tengas la variable en el controlador
                ),
                const SizedBox(height: 30),
                Obx(() => controller.isLoading.value 
                  ? const Center(child: CircularProgressIndicator()) 
                  : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.submit,
                      child: Text(controller.isEditing ? 'Actualizar' : 'Crear'),
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
