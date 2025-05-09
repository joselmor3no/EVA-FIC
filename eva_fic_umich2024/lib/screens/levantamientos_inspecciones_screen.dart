import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../services/firebase_service.dart'; // Asegúrate de tener este servicio

class LevantamientosInspeccionesScreen extends StatelessWidget {
  final String inspeccionId;

  const LevantamientosInspeccionesScreen(
      {super.key, required this.inspeccionId});

  String formatTimestamp(DateTime date) {
    return DateFormat('yyyy-MM-dd – kk:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final levantamientosProvider = Provider.of<LevantamientosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Levantamientos')),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: levantamientosProvider.levantamientos.length,
            itemBuilder: (context, index) {
              final item = levantamientosProvider.levantamientos[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2.0),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.add_location_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: GestureDetector(
                    child: Text('${item.nombre} - ${(item.fecha)}'),
                  ),
                  subtitle: Text('${item.municipio} - ${item.estado}'),
                  trailing: item.subido != null
                      ? const Text('Levantamiento enviado')
                      : ElevatedButton(
                          onPressed: () async {
                            levantamientosProvider.setLoading(true);
                            String idFirebase =
                                await FirebaseService.subirLevantamientoUsuario(
                                    context, item.id!);
                            levantamientosProvider.setLoading(false);
                            levantamientosProvider
                                .actualizarSubidaLevantamiento(
                                    item.id!, idFirebase);
                          },
                          child: const Text('Subir'),
                        ),
                ),
              );
            },
          ),
          if (levantamientosProvider.isLoading)
            const Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
