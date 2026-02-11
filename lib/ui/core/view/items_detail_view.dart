import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routing/app_routes.dart';
import '../controller/item_controller.dart';

class ItemsDetailView extends StatelessWidget {
  ItemsDetailView({super.key});

  final controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Items'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.ITEM, arguments: null);
                controller.getData();
              },
              child: const Text('Create items'),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search items',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Search'),
                ),
              ],
            ),
            const Divider(),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: controller.getItems,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error al cargar los items'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No hay items registrados'),
                    );
                  }

                  final clientes = snapshot.data!.docs;

                  return ListView.separated(
                    itemCount: clientes.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final doc = clientes[index];
                      final data = doc.data() as Map<String, dynamic>;
                      // Aseguramos que el ID del documento esté en el mapa
                      data['id'] = doc.id;

                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(data['name'] ?? 'Sin nombre'),
                        subtitle: Text(data['code_reference'] ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.ITEM, arguments: data);
                                controller.getData();
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () => controller.removeItem(doc.id),
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
