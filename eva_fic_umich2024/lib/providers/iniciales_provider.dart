import 'package:flutter/material.dart';

class InicialesProvider extends ChangeNotifier {
  int _selectMenu = 2;
  int _id = 0;
  String _usuarioSistema = ''; 
  String _nombreInspector = '';
  String _claveInspector = '';

  int get id {
    return _id;
  }
  
  String get usuarioSistema {
    return _usuarioSistema;
  }

  String get nombreInspector {
    return _nombreInspector;
  }

  String get claveInspector {
    return _claveInspector;
  }

  int get selectMenu {
    return _selectMenu;
  }

  set id(int vid) {
    _id = vid;
    notifyListeners();
  }
  
  set claveInspector(String vclaveInspector) {
    _claveInspector = vclaveInspector;
    notifyListeners();
  }

  set nombreInspector(String vnombreInspector) {
    _nombreInspector = vnombreInspector;
    notifyListeners();
  }

  set selectMenu(int i) {
    _selectMenu = i;
    notifyListeners();
  }

  set usuarioSistema(String vusuarioSistema) {
    _usuarioSistema = vusuarioSistema;
    notifyListeners();
  }
}
