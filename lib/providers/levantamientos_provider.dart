import 'package:eva_fi_umich/providers/db_provider.dart';
import 'package:flutter/material.dart';

class LevantamientosProvider extends ChangeNotifier {
  List<LevantamientosModel> levantamientos = [];

  nuevoLevantamiento(
      String nombre, String fecha, String estado, String municipio) async {
    final tempInsert = LevantamientosModel(
        nombre: nombre, fecha: fecha, estado: estado, municipio: municipio);
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
  }
}
