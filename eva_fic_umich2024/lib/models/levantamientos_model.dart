import 'dart:convert';

LevantamientosModel levantamientosModelFromJson(String str) => LevantamientosModel.fromJson(json.decode(str));
String levantamientosModelToJson(LevantamientosModel data) => json.encode(data.toJson());

class LevantamientosModel {
    LevantamientosModel({
        this.id,
        required this.nombre,
        required this.fecha,
        required this.estado,
        required this.municipio,
        required this.usuario,
        this.subido,
    });

    int? id;
    String nombre;
    String fecha;
    String estado;
    String municipio;
    String usuario;
    String? subido='';

    factory LevantamientosModel.fromJson(Map<String, dynamic> json) => LevantamientosModel(
        id: json["id"] != null ? int.tryParse(json["id"].toString()) : null,
        nombre: json["nombre"],
        fecha: json["fecha"],
        estado: json["estado"],
        municipio: json["municipio"],
        usuario: json["usuario"],
        subido: json["subido"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fecha": fecha,
        "estado": estado,
        "municipio": municipio,
        "usuario": usuario,
        "subido": subido,
    };
}
