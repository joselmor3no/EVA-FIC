import 'package:eva_fi_umich/providers/connection_status_provider.dart';
import 'package:eva_fi_umich/services/auth_service.dart';
import 'package:eva_fi_umich/utils/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eva_fi_umich/providers/providers.dart';

import '../widgets/widgets.dart';

class LevantamientosScreen extends StatefulWidget {
  const LevantamientosScreen({Key? key}) : super(key: key);

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
    final authService = Provider.of<AuthService>(context, listen: false);
    

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('Lista de inspecciones Locales'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              tooltip: 'Salir',
            ),
          ]),
      body: Container(
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
                onDismissed: (direction) {
                  setState(() {
                    levantamientosProvider.levantamientos.removeAt(index);
                    levantamientosProvider.borrarLevantamiento(item.id!);
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('$item dismissed')));
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
                        color:
                            conexionInternet.status != ConnectionStatus.online
                                ? Colors.grey
                                : Colors.green,
                      ),
                      onTap: () {
                        if (conexionInternet.status !=
                            ConnectionStatus.online) {
                          formatosGeneralesProvider
                              .cargarFormatosGenerales(item.id!);
                          Navigator.pushNamed(context, 'no_internet',
                              arguments: item);
                        } else {
                          formatosGeneralesProvider
                              .cargarFormatosGenerales(item.id!);
                          Navigator.pushNamed(context, 'no_internet',
                              arguments: item);
                        }
                      },
                    ),
                    onTap: () => {}),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle),
        onPressed: () {
          Navigator.pushNamed(context, 'nuevo_levantamiento');
        },
      ),
      //bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
