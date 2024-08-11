import 'package:eva_fic_umich2024/providers/connection_status_provider.dart';
import 'package:eva_fic_umich2024/utils/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_fic_umich2024/providers/providers.dart';

class LevantamientosScreen extends StatefulWidget {
  const LevantamientosScreen({super.key});

  @override
  State<LevantamientosScreen> createState() => _LevantamientosScreenState();
}

class _LevantamientosScreenState extends State<LevantamientosScreen> {
  @override
  Widget build(BuildContext context) {
    final levantamientosProvider = Provider.of<LevantamientosProvider>(context);
    final formatosGeneralesProvider = Provider.of<FormatosProvider>(context);
    final conexionInternet =
        Provider.of<ConnectionStatusChangeProvider>(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(2, 20, 2, 0),
      child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: levantamientosProvider.levantamientos.length,
          itemBuilder: (context, index) {
            final item = levantamientosProvider.levantamientos[index];
            return Dismissible(
              key: Key(
                  levantamientosProvider.levantamientos[index].id.toString()),
              background: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Eliminar',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await _confirmarEliminacion(context);
              },
              onDismissed: (direction) {
                setState(() {
                  levantamientosProvider.levantamientos.removeAt(index);
                  levantamientosProvider.borrarLevantamiento(item.id!);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Levantamiento eliminado')));
              },
              child: ListTile(
                  leading: Icon(
                    Icons.add_location_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: GestureDetector(
                    child: Text('${item.nombre} - ${item.fecha}'),
                    onTap: () {
                      // print('manda carga');
                      formatosGeneralesProvider
                          .cargarFormatosGenerales(item.id!);
                      Navigator.pushNamed(context, 'lista_formatos',
                          arguments: item);
                    },
                  ),
                  subtitle: Text('${item.municipio} - ${item.estado}'),
                  trailing: GestureDetector(
                    child: Icon(
                      Icons.upload,
                      color: conexionInternet.status != ConnectionStatus.online
                          ? Colors.grey
                          : Colors.green,
                    ),
                    onTap: () {
                      if (conexionInternet.status != ConnectionStatus.online) {
                        formatosGeneralesProvider
                            .cargarFormatosGenerales(item.id!);
                        Navigator.pushReplacementNamed(context, 'no_internet',
                            arguments: item);
                      } else {
                        formatosGeneralesProvider
                            .cargarFormatosGenerales(item.id!);
                        Navigator.pushReplacementNamed(context, 'no_internet',
                            arguments: item);
                      }
                    },
                  ),
                  onTap: () => {}),
            );
          }),
    );
  }

  Future<bool?> _confirmarEliminacion(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Eliminar Levantamiento"),
          content: const Text("¿Está seguro de eliminar el elemento?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Eliminar"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}
