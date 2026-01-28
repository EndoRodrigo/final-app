import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../routing/app_routes.dart';

class CustomerDetailView extends StatelessWidget {
  const CustomerDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultar clientes'),),
      body: ElevatedButton(onPressed: () => Get.toNamed(AppRoutes.CUSTOMER), child: Text('Crear cliente'))
    );
  }
}
