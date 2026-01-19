import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
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
