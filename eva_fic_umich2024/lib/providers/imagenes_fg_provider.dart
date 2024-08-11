import 'package:eva_fic_umich2024/models/imagen_fg_model.dart';
import 'package:eva_fic_umich2024/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ImagenesFGProvider extends ChangeNotifier {
  late List<ImagenesFGModel> imagenesFG = [];

  nuevaImagenFGP(ImagenesFGModel imagenesFGModel) async {
    DBProvider.db.nuevaImagenFGP(imagenesFGModel);
    notifyListeners();
  }

  cargarFormatosGenerales(int idFormato) async {
    final imagenesFGBD = await DBProvider.db.obtenerImagenesFG(idFormato);
    imagenesFG = [...?imagenesFGBD];
    notifyListeners();
  }

  borrarLevantamiento(int id) async {
    await DBProvider.db.borrarLevantamientos(id);
  }
}
