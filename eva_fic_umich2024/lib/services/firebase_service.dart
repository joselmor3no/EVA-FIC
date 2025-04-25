import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_fic_umich2024/models/formato_general_model.dart';
import 'package:eva_fic_umich2024/models/imagen_fg_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';
import '../providers/providers.dart';


class FirebaseService {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  

  static Future<String> subirLevantamientoUsuario(
      BuildContext context, int levantamientoId) async {
    try {
      // Obtener el levantamiento de la base de datos local
      LevantamientosModel? levantamiento =
          await DBProvider.db.obtenerLevantamientoPorId(levantamientoId);
      if (levantamiento == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Levantamiento no encontrado')));
        return "false";
      }

      // Subir el levantamiento a Firestore
      DocumentReference levantamientoRef =
          db.collection('levantamientos').doc();
      await levantamientoRef.set({
        'nombre': levantamiento.nombre,
        'estado': levantamiento.estado,
        'municipio': levantamiento.municipio,
        'usuario': levantamiento.usuario,
        'id_levantamiento_local': levantamiento.id
      });
      String idEvaluacion = levantamientoRef.id;

      // Subir formatos y sus imágenes asociadas
      List<FormatoGeneralModel>? formatos =
          await DBProvider.db.obtenerFormatosGenerales(levantamientoId);
      if (formatos != null) {
        for (FormatoGeneralModel formato in formatos) {
          DocumentReference formatoRef =
              levantamientoRef.collection('formatos').doc();
          await formatoRef.set({
            ...formato.toJson(),
            'id_evaluacion': idEvaluacion,
            'id_formato_local': formato.id
          });

          List<ImagenesFGModel>? imagenes =
              await DBProvider.db.obtenerImagenesFG(formato.id!);
          if (imagenes != null && imagenes.isNotEmpty) {
            await subirImagenes(idEvaluacion,formatoRef.id, imagenes);
          }
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Levantamiento subido con éxito')));
      return idEvaluacion;
    } catch (e) {
      //print('Error al subir el levantamiento y formatos: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al subir levantamiento y formatos: $e')));
      return "false";
    }
  }

  static Future<void> subirImagenes(String idLevantamiento,
      String idFormato, List<ImagenesFGModel> imagenes) async {

    for (ImagenesFGModel imagen in imagenes) {
      File file = File(imagen.rutaDispositivo);
      if (!await file.exists()) {
        //print('Archivo no encontrado: ${imagen.rutaDispositivo}');
        continue;
      }

      try {
        var ref = FirebaseStorage.instance.ref(
            'imagenes_formatos/$idFormato/${path.basename(imagen.rutaDispositivo)}');
        UploadTask uploadTask = ref.putFile(file);

        // Espera a que la subida se complete
        TaskSnapshot snapshot = await uploadTask;
        if (snapshot.state == TaskState.success) {
          final String downloadUrl = await ref.getDownloadURL();

          await FirebaseFirestore.instance
              .collection('levantamientos') 
              .doc(idLevantamiento) 
              .collection('formatos') 
              .doc(idFormato) 
              .collection('imagenes')
              .add({
            'url': downloadUrl,
            'nombre': path.basename(imagen.rutaDispositivo)
          });

        } else {
          //print('Upload failed with state: ${snapshot.state}');
        }
      } catch (e) {
        //print('Error al subir imagen: $e');
      }
    }
  }


  static Future<String?> verificarSolicitudEnviada(
      BuildContext context, String inspeccionId) async {
    final inicialesProvider =
        Provider.of<InicialesProvider>(context, listen: false);
    String inspectorCorreo = inicialesProvider.usuarioSistema;

    try {
      QuerySnapshot querySolicitudes = await db
          .collection('solicitudes')
          .where('correoInspector', isEqualTo: inspectorCorreo)
          .where('inspeccionId', isEqualTo: inspeccionId)
          .get();

      if (querySolicitudes.docs.isNotEmpty) {
        DocumentSnapshot solicitudDoc = querySolicitudes.docs.first;
        return solicitudDoc['estado'] as String?;
      } else {
        return null;
      }
    } catch (e) {
      //print('Error al verificar solicitud: $e');
      return null;
    }
  }

  static Future<void> registrarUsuarioEnInspeccion(
      BuildContext context, String inspeccionId) async {
    try {
      final inicialesProvider =
          Provider.of<InicialesProvider>(context, listen: false);
      String inspectorCorreo = inicialesProvider.usuarioSistema;

      await db.collection('solicitudes').add({
        'correoInspector': inspectorCorreo,
        'inspeccionId': inspeccionId,
        'estado': 'pendiente',
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Solicitud enviada con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al enviar la solicitud')),
      );
    }
  }

  static Future<List> getInspeccionesActivas(BuildContext context) async {
    List inspecciones = [];
    List inspeccionesUsuario = [];

    CollectionReference collectionReferenceInspecciones =
        db.collection('inspecciones');

    // Agregamos el filtro para obtener solo inspecciones activas
    QuerySnapshot queryInspecciones = await collectionReferenceInspecciones
        .where('activo', isEqualTo: true)
        .get();

    // Obtener las inspecciones del usuario
    inspeccionesUsuario = await getInspeccionesUsuario(context);

    List<String> inspeccionesUsuarioIds = inspeccionesUsuario
        .map((inspeccion) => inspeccion['id'] as String)
        .toList();

    for (var documento in queryInspecciones.docs) {
      var inspeccionData = documento.data() as Map<String, dynamic>;
      inspeccionData['id'] = documento.id;
      String inspeccionId = documento.id;

      if (!inspeccionesUsuarioIds.contains(inspeccionId)) {
        inspecciones.add(inspeccionData);
      }
    }

    return inspecciones;
  }

  static Future<List> getInspeccionesUsuario(BuildContext context) async {
    List inspecciones = [];

    // Obtén el correo del usuario desde el provider
    final inicialesProvider =
        Provider.of<InicialesProvider>(context, listen: false);
    String inspector = inicialesProvider.usuarioSistema;

    // Consulta en la colección de inspectores usando el correo del usuario
    QuerySnapshot queryInspectores = await db
        .collection('inspectores')
        .where('correo', isEqualTo: inspector)
        .get();

    if (queryInspectores.docs.isNotEmpty) {
      DocumentSnapshot usuarioDoc = queryInspectores.docs.first;
      Map<String, dynamic> data = usuarioDoc.data() as Map<String, dynamic>;
      List<dynamic> inspeccionesIds = data['inspecciones'];

      // Consulta las inspecciones activas
      for (String inspeccionId in inspeccionesIds) {
        DocumentSnapshot inspeccionDoc =
            await db.collection('inspecciones').doc(inspeccionId).get();
        if (inspeccionDoc.exists && inspeccionDoc['activo'] == true) {
          Map<String, dynamic> inspeccionData =
              inspeccionDoc.data() as Map<String, dynamic>;
          inspeccionData['id'] =
              inspeccionId; // Incluye el ID para la comparación
          inspecciones.add(inspeccionData);
        }
      }
    }

    return inspecciones;
  }


}
