import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'package:eva_fic_umich2024/providers/db_provider.dart';
import 'package:eva_fic_umich2024/providers/providers.dart';
import 'package:eva_fic_umich2024/ui/input_decorations.dart';

import '../services/services.dart';

class NuevoLevantamientoScreen extends StatelessWidget {
  final TextEditingController _date = TextEditingController();

  NuevoLevantamientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formLevantamiento = Provider.of<FormLevantamietoProvider>(context);
    final inicialesProvider = Provider.of<InicialesProvider>(context);
    final levantamientosProvider = Provider.of<LevantamientosProvider>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    final estadosMunicipiosProvider =
        Provider.of<EstadosMunicipiosProvider>(context);

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: _boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formLevantamiento.formLevantamientoKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '', labelText: 'Nombre del levantamiento'),
                  onChanged: (value) => formLevantamiento.setNombre(value),
                  validator: (value) {
                    return (value != null && value.length >= 6)
                        ? null
                        : 'La contraseña debe de ser de 6 caracteres';
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _date,
                  decoration: const InputDecoration(
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
                      formLevantamiento.setFecha(_date.text);
                    }
                  },
                  onChanged: (value) => formLevantamiento.setFecha(value),
                  validator: (value) {
                    return (value != null && value.length >= 3)
                        ? null
                        : 'Seleccione una fecha';
                  },
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value:
                      null, // Valor seleccionado, inicialmente no hay ninguno seleccionado
                  onChanged: (value) {
                    if (value != null) {
                      formLevantamiento.setEstado(value);
                    }
                  },
                  validator: (value) {
                    return (value != null && value.length >= 3)
                        ? null
                        : 'Seleccione un estado';
                  },
                  items: estadosMunicipiosProvider.estados.map((estado) {
                    // Crea un DropdownMenuItem para cada estado
                    return DropdownMenuItem<String>(
                      value: estado.nombre, // Valor del estado
                      child: Text(
                          '${estado.nombre} (${estado.sigla})'), // Texto a mostrar en el menú desplegable
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Estado', // Etiqueta del campo
                  ),
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 20),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: const Color.fromARGB(255, 3, 31, 81),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: const Text(
                        'Guardar Levantamiento',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () async {
                    var usuario = await authService.readUsuario();
                    if (formLevantamiento.isValidForm()) {
                      final tempInsert = LevantamientosModel(
                          nombre: formLevantamiento.nombre,
                          fecha: formLevantamiento.fecha,
                          estado: formLevantamiento.estado,
                          municipio: formLevantamiento.municipio,
                          usuario: usuario);
                      var idInspeccion =
                          await DBProvider.db.nuevoLevantamiento(tempInsert);

                      final String folderName = 'inspeccion_$idInspeccion';
                      final directory =
                          await getApplicationDocumentsDirectory();
                      String folderPath = '${directory.path}/$folderName';
                      if (await Directory(folderPath).exists()) {
                        //print('La carpeta ya existe: $folderPath');
                      } else {
                        // Crea la carpeta
                        await Directory(folderPath).create(recursive: true);
                        //print('Se creo la carpeta: $folderPath');
                      }
                      formLevantamiento.formLevantamientoKey.currentState
                          ?.reset();
                      levantamientosProvider.cargarLevantamientos();
                      // ignore: use_build_context_synchronously
                      //Navigator.pushReplacementNamed(context, 'home');
                      inicialesProvider.selectMenu = 2;
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
        borderRadius: BorderRadius.all(Radius.circular(15)),
      );
}
