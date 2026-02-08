import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Items'),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(label: Text('Code reference'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Name'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Quantity'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Discount'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Price'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('IVA'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Units of measurement'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Standard code id'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Is excluded'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('Code'), border: OutlineInputBorder(),)),
                SizedBox(height: 18,),
                TextFormField(decoration: InputDecoration(label: Text('withholding_tax_rate'), border: OutlineInputBorder(),)),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){}, child: Text('Crear'))

              ],
            ),
          ),
        ),
    );
  }
}
