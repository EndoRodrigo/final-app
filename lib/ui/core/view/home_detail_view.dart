import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routing/app_routes.dart';
import '../controller/item_controller.dart';
import '../widgets/ModernProductListCard.dart';

class HomeDetailView extends StatelessWidget {
  HomeDetailView({super.key});

  final controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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

                  return ListView.builder(
                      itemCount: clientes.length,
                      itemBuilder: (context, index) {
                        final doc = clientes[index];
                        final data = doc.data() as Map<String, dynamic>;
                        // Aseguramos que el ID del documento esté en el mapa
                        data['id'] = doc.id;

                        return ModernProductListCard(name: data['name'] ?? 'Sin nombre', price: data['price'].toString(), imageUrl: data['image_url'] ?? '',);
                      }
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
