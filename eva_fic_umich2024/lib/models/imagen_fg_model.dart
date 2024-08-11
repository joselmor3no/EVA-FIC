import 'dart:convert';

ImagenesFGModel imagenesFGModelFromJson(String str) =>
    ImagenesFGModel.fromJson(json.decode(str));

String imagenesFGModelToJson(ImagenesFGModel data) =>
    json.encode(data.toJson());

class ImagenesFGModel {
  ImagenesFGModel({
    this.id,
    required this.idLevantamiento,
    required this.idFormatoGeneral,
    required this.rutaDispositivo,
  });

  int? id;
  int idLevantamiento;
  int idFormatoGeneral;
  String rutaDispositivo;

  factory ImagenesFGModel.fromJson(Map<String, dynamic> json) =>
      ImagenesFGModel(
        id: json["id"],
        idLevantamiento: json["id_levantamiento"],
        idFormatoGeneral: json["id_formato_general"],
        rutaDispositivo: json["ruta_dispositivo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_levantamiento": idLevantamiento,
        "id_formato_general": idFormatoGeneral,
        "ruta_dispositivo": rutaDispositivo,
      };
}
