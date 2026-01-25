
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
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Selecionar tipo de documento', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Registro civil')),
                    DropdownMenuItem(value: '2', child: Text('Tarjeta de identidad')),
                    DropdownMenuItem(value: '3', child: Text('Cédula de ciudadanía')),
                    DropdownMenuItem(value: '4', child: Text('Tarjeta de extranjería')),
                    DropdownMenuItem(value: '5', child: Text('Cédula de extranjería')),
                    DropdownMenuItem(value: '6', child: Text('NIT')),
                    DropdownMenuItem(value: '7', child: Text('Pasaporte')),
                    DropdownMenuItem(value: '8', child: Text('Documento de identificación extranjero')),
                    DropdownMenuItem(value: '9', child: Text('PEP')),
                    DropdownMenuItem(value: '10', child: Text('NIT otro país')),
                    DropdownMenuItem(value: '11', child: Text('NUIP')),

                  ],
                  onChanged: (value) {
                    if (value != null) {

                    }
                  },
                ),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('identification')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('names')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('address')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('email')),),
                SizedBox(height: 18,),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(), label: Text('phone')),),
                SizedBox(height: 18,),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'identification_document_id', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: '1', child: Text('Persona Juridica')),
                    DropdownMenuItem(value: '2', child: Text('Persona Natural')),
                  ],
                  onChanged: (value) {
                    if (value != null) {

                    }
                  },
                ),
                SizedBox(height: 18,),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'tribute_id ', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: '18', child: Text('IVA')),
                    DropdownMenuItem(value: '21', child: Text('No aplica')),
                  ],
                  onChanged: (value) {
                    if (value != null) {

                    }
                  },
                ),
                SizedBox(height: 18,),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'municipality_id  ', border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: '18', child: Text('Rionegro')),
                    DropdownMenuItem(value: '21', child: Text('Sabanalarga')),
                  ],
                  onChanged: (value) {
                    if (value != null) {

                    }
                  },
                ),
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
