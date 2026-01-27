import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/customer_controller.dart';

class CustomerView extends GetView<CustomerController> {
  CustomerView({super.key});

  final controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Selecionar tipo de documento',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Registro civil')),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('Tarjeta de identidad'),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text('Cédula de ciudadanía'),
                    ),
                    DropdownMenuItem(
                      value: '4',
                      child: Text('Tarjeta de extranjería'),
                    ),
                    DropdownMenuItem(
                      value: '5',
                      child: Text('Cédula de extranjería'),
                    ),
                    DropdownMenuItem(value: '6', child: Text('NIT')),
                    DropdownMenuItem(value: '7', child: Text('Pasaporte')),
                    DropdownMenuItem(
                      value: '8',
                      child: Text('Documento de identificación extranjero'),
                    ),
                    DropdownMenuItem(value: '9', child: Text('PEP')),
                    DropdownMenuItem(value: '10', child: Text('NIT otro país')),
                    DropdownMenuItem(value: '11', child: Text('NUIP')),
                  ],
                  onChanged: (v) =>
                      controller.identificationDocumentId.value = v!,
                ),
                SizedBox(height: 18),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Identificación',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) => controller.identification.value = v,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Campo requerido' : null,
                ),

                const SizedBox(height: 18),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nombres',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) => controller.names.value = v,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Campo requerido' : null,
                ),

                const SizedBox(height: 18),

                SizedBox(height: 18),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('address'),
                  ),
                  onChanged: (v) => controller.address.value = v,
                ),
                SizedBox(height: 18),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) => controller.email.value = v,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Campo requerido' : null,
                ),

                SizedBox(height: 18),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('phone'),
                  ),
                  onChanged: (v) => controller.phone.value = v,
                ),
                SizedBox(height: 18),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'identification_document_id',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Text('Persona Juridica'),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('Persona Natural'),
                    ),
                  ],
                  onChanged: (v) =>
                      controller.identificationDocumentId.value = v!,
                ),
                SizedBox(height: 18),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'tribute_id ',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: '18', child: Text('IVA')),
                    DropdownMenuItem(value: '21', child: Text('No aplica')),
                  ],
                  onChanged: (v) => controller.tributeId.value = v!,
                ),
                SizedBox(height: 18),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'municipality_id ',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: '18', child: Text('Rionegro')),
                    DropdownMenuItem(value: '21', child: Text('Sabanalarga')),
                  ],
                  onChanged: (v) => controller.municipalityId.value = v!,
                ),

                const SizedBox(height: 30),

                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: controller.addCustomer,
                          child: const Text('Crear'),
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
