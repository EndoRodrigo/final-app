
import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
        
              /*"identification": "123456789",
            "dv": "3",
            "company": "",
            "trade_name": "",
            "names": "Alan Turing",
            "address": "calle 1 # 2-68",
            "email": "alanturing@enigmasas.com",
            "phone": "1234567890",
            "legal_organization_id": "2",
            "tribute_id": "21",
            "identification_document_id": 3,
            "municipality_id": "980"
              */
              children: [
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('identification')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('dv')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('trade_name')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('names')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('address')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('email')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('phone')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('tribute_id')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('identification_document_id')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('municipality_id')),),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){}, child: Text('Crear'))
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
