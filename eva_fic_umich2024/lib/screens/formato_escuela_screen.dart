import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/formato_escuela_provider.dart';


class FormatoEscuelaScreen extends StatelessWidget {
  const FormatoEscuelaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatoEscuelaProvider = Provider.of<FormFormatoEscuelaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formato Escuela'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Column(
                children: [
                  _buildTextFormField(
                    label: "Nombre",

                    onChanged: (value) => formatoEscuelaProvider.nombre = value,
                    validator: (value) => value != null && value.isNotEmpty ? null : 'Ingrese un nombre válido',
                  ),
                  const SizedBox(height: 30),
                  _buildTextFormField(
                    label: "Fecha",

                    onChanged: (value) => formatoEscuelaProvider.fecha = value,
                    validator: (value) => value != null && value.isNotEmpty ? null : 'Ingrese una fecha válida',
                  ),
                  // Agrega más campos aquí usando _buildTextFormField
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  

  Widget _buildTextFormField({
    required String label,
    required Function(String) onChanged,
    String? Function(String?)? validator, // Acepta nulos y puede devolver nulos
  }) {
  return TextFormField(
    decoration: InputDecoration(labelText: label),
    onChanged: onChanged,
    validator: (value) {
      // Aquí se garantiza que se devuelve un String, nunca null
      if (validator != null) {
        return validator(value) ?? ''; // Si validator devuelve null, devuelve un String vacío
      }
      return null; // Asume que no hay errores si no hay validator
    },
  );
}


}
