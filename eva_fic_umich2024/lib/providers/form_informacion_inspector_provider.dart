import 'package:flutter/material.dart';


class FormInformacionInspectorProvider extends ChangeNotifier {
  GlobalKey<FormState> formInformacionInspectorKey = GlobalKey<FormState>();
  

  String _nombre = '';
  String _clave = '';
  String _telefono = '';
 

  String get nombre => _nombre;
  String get clave => _clave;
  String get telefono => _telefono;


  void setNombre(String value) {
    _nombre = value;
  }

  void setClave(String value) {
    _clave = value;
  }

  void setTelefono(String value) {
    _telefono = value;
  }



  bool isValidForm() {
    return formInformacionInspectorKey.currentState?.validate() ?? false;
  }
}
