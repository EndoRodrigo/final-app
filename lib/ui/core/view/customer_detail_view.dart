
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../routing/app_routes.dart';
import '../controller/customer_controller.dart';

class CustomerDetailView extends StatelessWidget {
  CustomerDetailView({super.key});

  final controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar clientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.CUSTOMER),
              child: const Text('Crear cliente'),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Buscar',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buscar'),
                ),
              ],
            ),
            Divider(),
            //const SizedBox(height: 18),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getCustomers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error al cargar clientes'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No hay clientes registrados'),
                    );
                  }

                  final clientes = snapshot.data!.docs;

                  return ListView.separated(
                    itemCount: clientes.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final data =
                      clientes[index].data() as Map<String, dynamic>;

                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(data['names'] ?? 'Sin nombre'),
                        subtitle: Text(data['email'] ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.CUSTOMERDETAIL, arguments: data);
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.CUSTOMERDETAIL, arguments: data);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
