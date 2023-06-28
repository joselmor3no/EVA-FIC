import 'package:flutter/foundation.dart';

class Estado {
  final String nombre;
  final String sigla;

  Estado(this.nombre, this.sigla);
}

class EstadosMunicipiosProvider with ChangeNotifier {
  final List<Estado> estados = [
    Estado('Aguascalientes', 'AGU'),
    Estado('Baja California', 'BCN'),
    Estado('Baja California Sur', 'BCS'),
    Estado('Campeche', 'CAM'),
    Estado('Chiapas', 'CHP'),
    Estado('Chihuahua', 'CHH'),
    Estado('Coahuila', 'COA'),
    Estado('Colima', 'COL'),
    Estado('Durango', 'DUR'),
    Estado('Estado de México', 'MEX'),
    Estado('Guanajuato', 'GUA'),
    Estado('Guerrero', 'GRO'),
    Estado('Hidalgo', 'HID'),
    Estado('Jalisco', 'JAL'),
    Estado('Michoacán', 'MIC'),
    Estado('Morelos', 'MOR'),
    Estado('Nayarit', 'NAY'),
    Estado('Nuevo León', 'NLE'),
    Estado('Oaxaca', 'OAX'),
    Estado('Puebla', 'PUE'),
    Estado('Querétaro', 'QUE'),
    Estado('Quintana Roo', 'ROO'),
    Estado('San Luis Potosí', 'SLP'),
    Estado('Sinaloa', 'SIN'),
    Estado('Sonora', 'SON'),
    Estado('Tabasco', 'TAB'),
    Estado('Tamaulipas', 'TAM'),
    Estado('Tlaxcala', 'TLA'),
    Estado('Veracruz', 'VER'),
    Estado('Yucatán', 'YUC'),
    Estado('Zacatecas', 'ZAC'),
  ];
}
