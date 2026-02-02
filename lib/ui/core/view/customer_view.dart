import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/customer_controller.dart';

class CustomerView extends GetView<CustomerController> {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.isEditing ? 'Editar cliente' : 'Crear cliente'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                // ------ DOCUMENT TYPE ------------
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.identificationDocumentId.value.isEmpty ? null : controller.identificationDocumentId.value,
                  decoration: const InputDecoration(labelText: 'Seleccionar tipo de documento', border: OutlineInputBorder(),),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Registro civil')),
                    DropdownMenuItem(value: '2', child: Text('Tarjeta de identidad'),),
                    DropdownMenuItem(value: '3', child: Text('Cédula de ciudadanía'),),
                    DropdownMenuItem(value: '4', child: Text('Tarjeta de extranjería'),),
                    DropdownMenuItem(value: '5', child: Text('Cédula de extranjería'),),
                    DropdownMenuItem(value: '6', child: Text('NIT')),
                    DropdownMenuItem(value: '7', child: Text('Pasaporte')),
                    DropdownMenuItem(value: '8', child: Text('Documento de identificación extranjero'),),
                    DropdownMenuItem(value: '9', child: Text('PEP')),
                    DropdownMenuItem(value: '10', child: Text('NIT otro país')),
                    DropdownMenuItem(value: '11', child: Text('NUIP')),
                  ],
                  onChanged: (v) => controller.identificationDocumentId.value = v!,),),
                const SizedBox(height: 18),
                // ------ IDENTIFICACION ------------
                TextFormField(
                  initialValue: controller.identification.value,
                  decoration: const InputDecoration(labelText: 'Identificación', border: OutlineInputBorder(),),
                  onChanged: (v) => controller.identification.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,),
                const SizedBox(height: 18),
                // ------ NAMES ------------
                TextFormField(
                  initialValue: controller.names.value,
                  decoration: const InputDecoration(labelText: 'Nombres', border: OutlineInputBorder(),),
                  onChanged: (v) => controller.names.value = v,
                  validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,),
                const SizedBox(height: 18),
                // ------ ADDRESS ------------
                TextFormField(
                  initialValue: controller.address.value,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Dirección',),
                  onChanged: (v) => controller.address.value = v,),
                const SizedBox(height: 18),
                // ------ EMAIL ------------
                TextFormField(
                  initialValue: controller.email.value,
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder(),),
                  onChanged: (v) => controller.email.value = v,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Campo requerido' : null,
                ),
                const SizedBox(height: 18),
                // ------ PHONE ------------
                TextFormField(
                  initialValue: controller.phone.value,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Teléfono',),
                  onChanged: (v) => controller.phone.value = v,),
                const SizedBox(height: 18),
                // ------ LEGAL ORGANIZATION ------------
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.legalOrganizationId.value.isEmpty ? null : controller.legalOrganizationId.value,
                  decoration: const InputDecoration(labelText: 'Organización legal', border: OutlineInputBorder(),),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Persona Jurídica'),),
                    DropdownMenuItem(value: '2', child: Text('Persona Natural'),),
                  ],
                  onChanged: (v) => controller.legalOrganizationId.value = v!,),
                ),
                const SizedBox(height: 18),
                // ------ TRIBUTE ------------
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.tributeId.value.isEmpty ? null : controller.tributeId.value,
                  decoration: const InputDecoration(labelText: 'Tributo', border: OutlineInputBorder(),),
                  items: const [
                    DropdownMenuItem(value: '18', child: Text('IVA')),
                    DropdownMenuItem(value: '21', child: Text('No aplica')),
                  ],
                  onChanged: (v) => controller.tributeId.value = v!,
                )),
                const SizedBox(height: 18),
                // ------ MUNICIPALITY ------------
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.municipalityId.value.isEmpty ? null : controller.municipalityId.value,
                  decoration: const InputDecoration(labelText: 'Municipio', border: OutlineInputBorder(),),
                  items: const [
                    DropdownMenuItem(value: '18', child: Text('Rionegro')),
                    DropdownMenuItem(value: '21', child: Text('Sabanalarga')),
                  ],
                  onChanged: (v) => controller.municipalityId.value = v!,
                )),
                const SizedBox(height: 30),
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
