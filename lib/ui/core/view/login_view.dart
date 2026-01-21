import 'package:flutter/material.dart';

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
            ElevatedButton(onPressed: (){}, child: Text('Login')),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){}, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
