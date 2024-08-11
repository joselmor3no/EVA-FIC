import 'package:flutter/material.dart';

import '../models/formato_escuela_model.dart';
import 'db_provider.dart';

class FormFormatoEscuelaProvider extends ChangeNotifier {
  String _id = '';
  String _nombre = '';
  String _fecha = '';

  String get id => _id;
  String get nombre => _nombre;
  String get fecha => _fecha;

  set id(String value) {
    _id = value;
    notifyListeners();
  }

  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  set fecha(String value) {
    _fecha = value;
    notifyListeners();
  }

  void guardaFormatoEscuela(FormatoEscuelaModel nuevoFormatoEscuela) {
    DBProvider.db.nuevoFormatoEscuela(nuevoFormatoEscuela);
    notifyListeners();
  } 

}
