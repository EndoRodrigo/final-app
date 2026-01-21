
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tirando_factos/routing/app_routes.dart';

class RegisterWiew extends StatelessWidget {
  const RegisterWiew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tirando Factus'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/factus-logo.ywiieubc.png'),
            SizedBox(height: 24,),
            TextField(
              decoration: InputDecoration(labelText: 'email',border: OutlineInputBorder()),
            ),
            SizedBox(height: 24,),
            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            ),
            SizedBox(height: 24,),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Rol', border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'client', child: Text('Cliente')),
                DropdownMenuItem(value: 'admin', child: Text('Administrador')),
              ],
              onChanged: (value) {
                if (value != null) {

                }
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){}, child: Text('Register')),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){Get.toNamed(AppRoutes.LOGIN);}, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
