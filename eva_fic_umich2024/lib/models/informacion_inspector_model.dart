
import 'dart:convert';

InformacionInspectorModel informacionInspectorModelFromJson(String str) => InformacionInspectorModel.fromJson(json.decode(str));
String informacionInspectorModelToJson(InformacionInspectorModel data) => json.encode(data.toJson());

class InformacionInspectorModel {
    InformacionInspectorModel({
        this.id,
        required this.usuario,
        required this.nombre,
        required this.clave
    });

    int? id;
    String usuario;
    String nombre;
    String clave;
    

    factory InformacionInspectorModel.fromJson(Map<String, dynamic> json) => InformacionInspectorModel(
        usuario: json["usuario"],
        id: json["id"],
        nombre: json["nombre"],
        clave: json["clave"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
         "usuario": usuario,
        "nombre": nombre,
        "clave": clave
    };
}
