import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('Tirando Factus',),
            Image.asset('assets/images/factus-logo.ywiieubc.png'),
            //Icon(Icons.shopping_cart, size: 80,),
            SizedBox(height: 24,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
