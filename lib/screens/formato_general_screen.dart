import 'package:flutter/material.dart';

class FormatoGeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(2, 40, 2, 0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                'Coordenadas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'N'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'O'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'msnm'),
              ),
              SizedBox(height: 16),
              Text(
                'General',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del inmueble'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Calle y Numero'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Colonia'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Codigo Postal'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pueblo o Ciudad'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Referencias'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefono'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              Text(
                'Uso',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Vivienda'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Hospital'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Oficinas'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Iglesia'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Comercio'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Escuela'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Reunion "cine/estadio"'),
                value: false,
                onChanged: (value) {},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Niveles'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sotanos'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ocupantes'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Text(
                'Topografía',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Frente X "mts"'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Frente Y "mts"'),
                keyboardType: TextInputType.number,
              ),
              CheckboxListTile(
                title: Text('Planicie'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Ladera de Cerro'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Rivera rio/lago'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Fondo de valle'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Costa'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Depositos lacustres'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Text(
                'Dirección X',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Marcos de acero'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Marcos de concreto'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Columnas y losa plana (sin vigas)'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Muros de carga de mamposteria'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Marcos y muros diafragma'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Uso contravientos'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Muros de adobe y bahareque'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Muros de madera, lamina, otros'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Text(
                'Dirección Y',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Marcos de acero'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Marcos de concreto'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Columnas y losa plana (sin vigas)'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Muros de carga de mamposteria'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Marcos y muros diafragma'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Uso contravientos'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Muros de adobe y bahareque'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Muros de madera, lamina, otros'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Text(
                'Muros de Mamposteria',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Confinada'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Refuerzo Interior'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Bloque concreto 20x40'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Tabique hueco de arcilla'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Tabicon de concreto'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Simple'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Text(
                'Sistema de piso',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Losa maciza'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Losa reticular'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Vigueta y bovedilla'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('No se sabe'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Text(
                'Sistema de techo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Igual al del piso'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Lámina'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Teja'),
                value: false,
                onChanged: (value) {},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Otro'),
              ),
              SizedBox(height: 16),
              Text(
                'Cimentación',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Zapatas aisladas'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Zapatas corridas'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Cimiento de piedra'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Losa de cimentación'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Pilotes/Pilas'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Cajón'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('No se sabe'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Text(
                'Posición en manzana',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Esquina'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Medio'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Frente a calle'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Frente a predio baldío'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Frente a parque'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Frente a corriente agua'),
                value: false,
                onChanged: (value) {},
              ),
              CheckboxListTile(
                title: Text('Frente a barranca'),
                value: false,
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Guardar'),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}