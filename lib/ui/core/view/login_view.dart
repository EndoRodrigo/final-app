import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tirando_factos/routing/app_routes.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/factus-logo.ywiieubc.png'),
            SizedBox(height: 30,),
            TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),),
            SizedBox(height: 30,),
            TextField(decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){Get.toNamed(AppRoutes.CUSTOMER);}, child: Text('Login')),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
