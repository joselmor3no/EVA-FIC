import 'package:eva_fi_umich/providers/db_provider.dart';
import 'package:eva_fi_umich/providers/form_levantamiento_provider.dart';
import 'package:eva_fi_umich/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NuevoLevantamientoScreen extends StatelessWidget {
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formLevantamiento = Provider.of<FormLevantamietoProvider>(context);
    //DBProvider.db.database;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Crear una nueva inspección'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        decoration: _boxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: formLevantamiento.formLevantamientoKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '', labelText: 'Nombre Levantamiento'),
                  onChanged: (value) => formLevantamiento.setNombre(value),
                  validator: (value) {
                    return (value != null && value.length >= 6)
                        ? null
                        : 'La contraseña debe de ser de 6 caracteres';
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _date,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    labelText: 'Selecciona la fecha',
                  ),
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      _date.text = date.toString();
                    }
                  },
                  onChanged: (value) => formLevantamiento.setFecha(value),
                  validator: (value) {
                    return (value != null && value.length >= 3)
                        ? null
                        : 'Seleccione una fecha';
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '', labelText: 'Estado'),
                  onChanged: (value) => formLevantamiento.setEstado(value),
                  validator: (value) {
                    return (value != null && value.length >= 3)
                        ? null
                        : 'Ingrese un Estado';
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '', labelText: 'Municipio'),
                  onChanged: (value) => formLevantamiento.setMunicipio(value),
                  validator: (value) {
                    return (value != null && value.length >= 3)
                        ? null
                        : 'Ingrese un Municipio';
                  },
                ),
                SizedBox(height: 50),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: const Color.fromARGB(255, 3, 31, 81),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        'Guardar Inspección',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () {
                    if (formLevantamiento.isValidForm()) {
                      final tempInsert = LevantamientosModel(
                          nombre: formLevantamiento.nombre,
                          fecha: formLevantamiento.fecha,
                          estado: formLevantamiento.estado,
                          municipio: formLevantamiento.municipio);
                      DBProvider.db.nuevoLevantamiento(tempInsert);
                      formLevantamiento.formLevantamientoKey.currentState?.reset();
                      Navigator.pushReplacementNamed(context, 'levantamientos');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      );
}
