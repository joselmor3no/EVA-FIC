import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_fic_umich2024/screens/levantamientos_inspecciones_screen.dart';
import 'package:eva_fic_umich2024/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class InspeccionesScreen extends StatelessWidget {
  const InspeccionesScreen({super.key});

  String formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return DateFormat('yyyy-MM-dd – kk:mm').format(date); // Ajusta el formato según tus necesidades
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Fondo blanco
        padding: const EdgeInsets.all(8.0), // Padding para el borde
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 223, 222, 222)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Inspecciones Activas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                inspeccionesActivas(context),
                const SizedBox(height: 20),
                const Text(
                  'Mis Inspecciones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                inspeccionesRegistradas(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded inspeccionesActivas(BuildContext context) {
    return Expanded(
                child: FutureBuilder<List>(
                  future: FirebaseService.getInspeccionesActivas(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child:
                              Text('Error al cargar las inspecciones activas'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No hay inspecciones activas'));
                    } else {
                      List inspeccionesActivas = snapshot.data!;
                      return ListView.builder(
                        itemCount: inspeccionesActivas.length,
                        itemBuilder: (context, index) {
                          final inspeccion = inspeccionesActivas[index];
                          final id = inspeccion['id'] ?? 'ID no disponible';
                          final fecha = inspeccion['fecha'] != null
                              ? formatTimestamp(inspeccion['fecha'])
                              : 'Fecha no disponible';

                          return FutureBuilder<String?>(
                            future: FirebaseService.verificarSolicitudEnviada(context, id),
                            builder: (context, solicitudSnapshot) {
                              if (solicitudSnapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (solicitudSnapshot.hasError) {
                                return const Center(child: Text('Error al verificar solicitud'));
                              } else {
                                final estadoSolicitud = solicitudSnapshot.data;
                                  if (estadoSolicitud == null) {
                                    return ListTile(
                                      title: Text(inspeccion['nombre']),
                                      subtitle: Text(fecha),
                                      trailing: ElevatedButton(
                                        onPressed: () async {
                                          await FirebaseService.registrarUsuarioEnInspeccion(context, id);
                                        },
                                        child: const Text('Solicitar Registro'),
                                      ),
                                    );
                                  } else {
                                    return ListTile(
                                      title: Text(id),
                                      subtitle: Text(fecha),
                                      trailing: Text(
                                        estadoSolicitud == 'pendiente' || estadoSolicitud == 'rechazada'
                                            ? 'Solicitud $estadoSolicitud'
                                            : 'Solicitud $estadoSolicitud',
                                        style: TextStyle(
                                          color: estadoSolicitud == 'aprobada' ? Colors.green : Colors.orange,
                                        ),
                                      ),
                                    );
                                  }
                              }
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              );
  }

  Expanded inspeccionesRegistradas(BuildContext context) {
    return Expanded(
                child: FutureBuilder<List>(
                  future: FirebaseService.getInspeccionesUsuario(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error al cargar mis inspecciones'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No hay inspecciones registradas'));
                    } else {
                      List misInspecciones = snapshot.data!;
                      return ListView.builder(
                        itemCount: misInspecciones.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(misInspecciones[index]['nombre']),
                            subtitle: Text(formatTimestamp(misInspecciones[index]['fecha'])),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LevantamientosInspeccionesScreen(inspeccionId: misInspecciones[index]['id']),
                                          ),
                                );
                              },
                              child: const Text('Subir Levantamientos'),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              );
  }
}
