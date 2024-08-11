import 'package:flutter/material.dart';


class FormLevantamietoProvider extends ChangeNotifier {
  GlobalKey<FormState> formLevantamientoKey = GlobalKey<FormState>();
  
  String _nombre = '';
  String _fecha = '';
  String _municipio = '';
  String _estado = '';

  String get nombre => _nombre;
  String get fecha => _fecha;
  String get municipio => _municipio;
  String get estado => _estado;

  void setNombre(String value) {
    _nombre = value;
  }

  void setFecha(String value) {
    _fecha = value;
  }

  void setMunicipio(String value) {
    _municipio = value;
  }

  void setEstado(String value) {
    _estado = value;
  }


  bool isValidForm() {
    return formLevantamientoKey.currentState?.validate() ?? false;
  }
}
