import 'package:eva_fic_umich2024/models/informacion_inspector_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';
import '../providers/providers.dart';
import '../services/notifications_service.dart';

class InformacionInspectorScreen extends StatelessWidget {
  const InformacionInspectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formInspector =
        Provider.of<FormInformacionInspectorProvider>(context);
    final inicialesProvider = Provider.of<InicialesProvider>(context);
    //DBProvider.db.database;
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: _boxDecoration(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formInspector.formInformacionInspectorKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                  initialValue: inicialesProvider.usuarioSistema,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: inicialesProvider.nombreInspector,
                  decoration:
                      const InputDecoration(labelText: 'Nombre de Inspector'),
                  onChanged: (value) =>
                      inicialesProvider.nombreInspector = value,
                  validator: (value) {
                    return (value != null && value.isNotEmpty)
                        ? null
                        : 'Llene este campo';
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: inicialesProvider.claveInspector,
                  decoration:
                      const InputDecoration(labelText: 'CURP de Inspector'),
                  onChanged: (value) =>
                      inicialesProvider.claveInspector = value,
                ),
                const SizedBox(height: 30),
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
                        'Actualizar Datos',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () async {
                    if (formInspector.isValidForm()) {
                      final tempInsert = InformacionInspectorModel(
                          id: inicialesProvider.id,
                          nombre: inicialesProvider.nombreInspector,
                          clave: inicialesProvider.claveInspector,
                          usuario: inicialesProvider.usuarioSistema);
                      await DBProvider.db
                          .editarInformacionInspector(tempInsert);
                      NotificationsService.showSnackbar("Datos Actualizados");
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
}

BoxDecoration _boxDecoration() => const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );
