import 'dart:io';

import 'package:eva_fic_umich2024/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LevantamientosProvider extends ChangeNotifier {
  List<LevantamientosModel> levantamientos = [];
  bool _subiendoLevantamiento = false;

  bool get isLoading => _subiendoLevantamiento;

  void setLoading(bool loading) {
    _subiendoLevantamiento = loading;
    notifyListeners();
  }

  nuevoLevantamiento(String nombre, String fecha, String estado,
      String municipio, String usuario) async {
    final tempInsert = LevantamientosModel(
        nombre: nombre,
        fecha: fecha,
        estado: estado,
        municipio: municipio,
        usuario: usuario,
        subido: '');
    final id = await DBProvider.db.nuevoLevantamiento(tempInsert);
    tempInsert.id = id;
    levantamientos.add(tempInsert);
    notifyListeners();
  }

  cargarLevantamientos() async {
    final levantamientosBD = await DBProvider.db.obtenerLevantamientos();
    levantamientos = [...?levantamientosBD];
    notifyListeners();
  }

  borrarLevantamiento(int id) async {
    await DBProvider.db.borrarLevantamientos(id);
    final directory = await getApplicationDocumentsDirectory();
    final destinationPath = '${directory.path}/inspeccion_$id/';
    final carpeta = Directory(destinationPath);
    if (await carpeta.exists()) {
      await carpeta.delete(recursive: true);
    }
  }

  actualizarSubidaLevantamiento(int idLocal, String idFirebase) async {
    try {
      await DBProvider.db.actualizarLevantamientoSubido(idLocal, idFirebase);
      final levantamientosBD = await DBProvider.db.obtenerLevantamientos();
      levantamientos = [...?levantamientosBD];
      notifyListeners();
      return true; // Retorna true si la operación fue exitosa
    } catch (e) {
      return false; // Retorna false si ocurrió un error
    }
  }
}
