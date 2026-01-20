
import 'package:flutter/material.dart';

class RegisterWiew extends StatelessWidget {
  const RegisterWiew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tirando Factus'),),
      body: Column(
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
          ElevatedButton(onPressed: (){}, child: Text('Register'))
        ],
      ),
    );
  }
}
