import 'dart:convert';

FormatoEscuelaModel formatoEscuelaModelFromJson(String str) => FormatoEscuelaModel.fromJson(json.decode(str));
String formatoEscuelaModelToJson(FormatoEscuelaModel data) => json.encode(data.toJson());

class FormatoEscuelaModel {
    FormatoEscuelaModel({
        this.id,
        required this.nombre,
        required this.fecha
    });

    int? id;
    String nombre;
    String fecha;
    

    factory FormatoEscuelaModel.fromJson(Map<String, dynamic> json) => FormatoEscuelaModel(
        id: json["id"],
        nombre: json["nombre"],
        fecha: json["fecha"],
       
    );

    Map<String, dynamic> toJson() => {
        "id":id,
        "nombre":nombre,
        "fecha":fecha,
    };
}
