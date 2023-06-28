import 'package:eva_fi_umich/models/formato_general_model.dart';
import 'package:eva_fi_umich/providers/db_provider.dart';
import 'package:flutter/material.dart';

class FormatosProvider extends ChangeNotifier {
  late List<FormatoGeneralModel> formatosGenerales = [];

  cargarFormatosGenerales(int idFormato) async {
    print('carga formatos generales par $idFormato');
    final formatosGeneralesBD =
        await DBProvider.db.obtenerFormatosGenerales(idFormato);
    
    formatosGenerales = [...?formatosGeneralesBD];
    notifyListeners();
  }

  borrarLevantamiento(int id) async {
    await DBProvider.db.borrarLevantamientos(id);
  }
}
