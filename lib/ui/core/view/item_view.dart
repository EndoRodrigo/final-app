import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Items'),),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.formKey,
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
                  DropdownButtonFormField(
                      decoration: InputDecoration(label: Text('Select unit of measurement'), border: OutlineInputBorder(),),
                      items: [
                        DropdownMenuItem(value: 70, child: Text('Unidad')),
                        DropdownMenuItem(value: 414, child: Text('kilogramo'))
                      ],
                      onChanged: (v){}),
                  SizedBox(height: 18,),
                  DropdownButtonFormField(
                      decoration: InputDecoration(label: Text('Select standard code id'), border: OutlineInputBorder(),),
                      items: [
                        DropdownMenuItem(value: 1, child: Text('Unidad')),
                        DropdownMenuItem(value: 2, child: Text('kilogramo'))
                      ],
                      onChanged: (v){}),
                  SizedBox(height: 18,),
                  DropdownButtonFormField(
                      decoration: InputDecoration(label: Text('Is excluded'), border: OutlineInputBorder(),),
                      items: [
                        DropdownMenuItem(value: 1, child: Text('SI')),
                        DropdownMenuItem(value: 0, child: Text('No'))
                      ],
                      onChanged: (v){}),
                  SizedBox(height: 18,),
                  DropdownButtonFormField(
                      decoration: InputDecoration(label: Text(' Select tribute id'), border: OutlineInputBorder(),),
                      items: [
                        DropdownMenuItem(value: 1, child: Text('Impuesto sobre la Ventas')),
                        DropdownMenuItem(value: 2, child: Text('Impuesto de Industria, Comercio y Aviso'))
                      ],
                      onChanged: (v){}),
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
        ),
    );
  }
}
