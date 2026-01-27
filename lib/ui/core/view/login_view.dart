import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/routing/app_routes.dart';
import 'package:tirando_factos/ui/core/controller/auth_controller.dart';


class LoginView extends StatelessWidget {
  LoginView({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/factus-logo.ywiieubc.png'),
            SizedBox(height: 30,),
            TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            onChanged: (v) => controller.email.value = v),
            SizedBox(height: 30,),
            TextField(decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            onChanged: (v) => controller.password.value = v,),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: controller.login, child: Text('Login')),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
