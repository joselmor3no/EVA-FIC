import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:eva_fic_umich2024/models/formato_general_model.dart';
import 'package:eva_fic_umich2024/models/formato_escuela_model.dart';
import 'package:eva_fic_umich2024/models/imagen_fg_model.dart';
import 'package:eva_fic_umich2024/models/informacion_inspector_model.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:eva_fic_umich2024/models/levantamientos_model.dart';

export 'package:eva_fic_umich2024/models/levantamientos_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'evaFICDB.db');

    // Crear base de datos
    return await openDatabase(path, version: 3, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE inspecciones(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            fecha TEXT,
            estado TEXT,
            municipio TEXT,
            usuario TEXT,
            subido TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE inspector(
            id INTEGER PRIMARY KEY,
            usuario TEXT,
            nombre TEXT,
            clave TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE imagenes_levantamiento_fg (
            id INTEGER PRIMARY KEY,
            id_levantamiento INTEGER,
            id_formato_general INTEGER,
            ruta_dispositivo TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE formatos_escuela (
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            fecha TEXT,
            cct_principal TEXT,
            numero_edificios INTEGER,
            calle_numero TEXT,
            municipio TEXT,
            codigo_postal TEXT,
            coordenadas TEXT,
            contacto TEXT,
            tipo_contacto TEXT,
            telefono_contacto TEXT,
            aviso_existente TEXT,
            clave_inspector TEXT,
            id_edificio TEXT,
            prototipo TEXT,
            rehabilitacion_previa INTEGER,
            anio_rehabilitacion INTEGER,
            tecnicas_rehabilitacion TEXT,
            numero_pisos INTEGER,
            numero_sotanos INTEGER,
            anio_construccion TEXT,
            aulas INTEGER,
            laboratorio INTEGER,
            biblioteca INTEGER,
            sanitarios INTEGER,
            administrativo INTEGER,
            cuarto_maquinas INTEGER,
            bodega INTEGER,
            auditorio INTEGER,
            consejeria INTEGER,
            cocina_comedor INTEGER,
            taller INTEGER,
            usos_multiples INTEGER,
            otro_uso INTEGER,
            otro_uso_texto TEXT,
            marcos_concreto INTEGER,
            marcos_acero INTEGER,
            marcos_muros_concreto INTEGER,
            marcos_contravientos INTEGER,
            marcos_muros_diafragmas INTEGER,
            mamposteria_simple INTEGER,
            mamposteria_confinada INTEGER,
            columnas_losas_planas INTEGER,
            otro_tipo_estructura TEXT,
            aplanado INTEGER,
            tabique_artesanal INTEGER,
            tabique_industrial INTEGER,
            tabique_vidriado INTEGER,
            otro_material_fachada INTEGER,
            otro_material_fachada_texto TEXT,
            desprendimiento_elementos INTEGER,
            asentamiento_emersion INTEGER,
            inclinacion INTEGER,
            descontinuidades_verticales INTEGER,
            configuracion_irregular_planta INTEGER,
            colindancia_junta_insuficiente INTEGER,
            desp_lateral_suelo INTEGER,
            agrietamiento_suelo INTEGER,
            inestabilidad_suelo INTEGER,
            inestabilidad_talud INTEGER,
            socavaciones_oquedades INTEGER,
            mov_adayacentes_fallas INTEGER,
            bardas_inclinadas INTEGER,
            estructura_separada INTEGER,
            otro_fallasp INTEGER,
            otro_fallasp_texto TEXT,
            colapso_total TEXT,
            colapso_parcial TEXT,
            desplomo_inclinacion TEXT,
            otro_dano_global_texto TEXT,
            cimentacion TEXT,
            sistemas_piso TEXT,
            sistemas_techo TEXT,
            sistemas_cargas_verticales TEXT,
            sistemas_cargas_laterales TEXT,
            conexiones TEXT,
            otro_dano_estructural TEXT,
            pretiles TEXT,
            ornamentos TEXT,
            fachadas TEXT,
            vidrios_rotos TEXT,
            plafones TEXT,
            muros_divisorios TEXT,
            entradas_salidas TEXT,
            escaleras_elevadores TEXT,
            instalaciones_electricas TEXT,
            instalaciones_hidrosanitarias TEXT,
            instalaciones_gas TEXT,
            otro_dano_noestruectural TEXT,
            dano_global_estimado TEXT,
            comentarios TEXT,
            dano_observado TEXT,
            aviso TEXT,
            exterior TEXT,
            interior TEXT,
            evaluacion_geotecnica INTEGER,
            ninguna INTEGER,
            evaluacion_intermedia INTEGER,
            evaluacion_ie TEXT,
            evaluacion_ie_otro INTEGER,
            evaluacion_ie_otro_texto TEXT,
            evaluacion_propietario TEXT,
            requiere_acordonamiento INTEGER,
            requiere_bloqueo_coc INTEGER,
            urgencia_accion TEXT,
            acciones_inmediatas TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE formatos_generales (
  id INTEGER PRIMARY KEY,
  id_evaluacion INTEGER,
  consecutivo INTEGER,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  n DECIMAL,
  o DECIMAL,
  msnm DECIMAL,
  nombre_inmueble TEXT,
  calle_numero TEXT,
  colonia TEXT,
  codigo_postal TEXT,
  pueblo_ciudad TEXT,
  referencias TEXT,
  propietario TEXT,
  telefono TEXT,
  vivienda BOOLEAN,
  hospital BOOLEAN,
  oficinas BOOLEAN,
  iglesia BOOLEAN,
  comercio BOOLEAN,
  escuela BOOLEAN,
  reunion_cine_estadio BOOLEAN,
  desocupada BOOLEAN,
  niveles INTEGER,
  sotanos INTEGER,
  ocupantes INTEGER,
  frente_x DECIMAL,
  frente_y DECIMAL,
  planicie BOOLEAN,
  ladera_cerro BOOLEAN,
  rivera_rio_lago BOOLEAN,
  fondo_valle BOOLEAN,
  costa BOOLEAN,
  depositos_lacustres BOOLEAN,
  marcos_acero_1 BOOLEAN,
  marcos_concreto_1 BOOLEAN,
  columnas_losa_plana_1 BOOLEAN,
  muros_carga_mamposteria_1 BOOLEAN,
  marcos_muros_diafragma_1 BOOLEAN,
  uso_contravientos_1 BOOLEAN,
  muros_adobe_bahareque BOOLEAN,
  muros_madera_lamina_otros BOOLEAN,
  marcos_acero_2 BOOLEAN,
  marcos_concreto_2 BOOLEAN,
  columnas_losa_plana_2 BOOLEAN,
  muros_carga_mamposteria_2 BOOLEAN,
  marcos_muros_diafragma_2 BOOLEAN,
  uso_contravientos_2 BOOLEAN,
  muros_adobe_bahareque_2 BOOLEAN,
  muros_madera_lamina_otros_2 BOOLEAN,
  confinada BOOLEAN,
  refuerzo_interior BOOLEAN,
  bloque_concreto BOOLEAN,
  tabique_hueco_arcilla BOOLEAN,
  tabicon_concreto BOOLEAN,
  simple BOOLEAN,
  losa_maciza BOOLEAN,
  losa_reticular BOOLEAN,
  vigueta_bovedilla BOOLEAN,
  no_se_sabe_sistema_piso BOOLEAN,
  igual_al_del_piso BOOLEAN,
  lamina BOOLEAN,
  teja BOOLEAN,
  otro_sistema_techo TEXT,
  zapatas_aisladas BOOLEAN,
  zapatas_corridas BOOLEAN,
  cimiento_piedra BOOLEAN,
  losa_cimentacion BOOLEAN,
  pilotes_pilas BOOLEAN,
  cajon BOOLEAN,
  no_se_sabe_cimentacion BOOLEAN,
  esquina BOOLEAN,
  medio BOOLEAN,
  aislado BOOLEAN,
  frente_calle BOOLEAN,
  frente_predio BOOLEAN,
  frente_parque BOOLEAN,
  frente_corriente BOOLEAN,
  frente_barranca BOOLEAN,
  asimetria_muro_cubos_cargas BOOLEAN,
  grandes_aberturas BOOLEAN,
  geometria_irregular_planta BOOLEAN,
  planta_baja_doble_altura BOOLEAN,
  muros_no_llegan_cimentacion BOOLEAN,
  planta_baja_flexible BOOLEAN,
  columna_corta BOOLEAN,
  grandes_masas_pisos_superiores BOOLEAN,
  reduccion_brusca_pisos_superiores BOOLEAN,
  separacion_edif_vecino DECIMAL,
  grietas_terreno BOOLEAN,
  hundimientos BOOLEAN,
  inclinacion_edificio DECIMAL,
  colapso_losas BOOLEAN,
  grietas_max DECIMAL,
  flechas_max DECIMAL,
  falla_conexiones BOOLEAN,
  col_colapso BOOLEAN,
  col_grietas_cortante BOOLEAN,
  col_grietas_flexion BOOLEAN,
  col_aplastamiento BOOLEAN,
  col_pandeo_barras BOOLEAN,
  col_pandeo_placas BOOLEAN,
  col_falla_soldadura BOOLEAN,
  col_ancho_max_grieta DECIMAL,
  col_separacion_estribos DECIMAL,
  col_seccion_espesor_muro DECIMAL,
  trabes_colapso BOOLEAN,
  trabes_grietas_cortante BOOLEAN,
  trabes_grietas_flexion BOOLEAN,
  trabes_aplastamiento BOOLEAN,
  trabes_pandeo_barras BOOLEAN,
  trabes_pandeo_placas BOOLEAN,
  trabes_falla_soldadura BOOLEAN,
  trabes_ancho_max_grieta DECIMAL,
  trabes_separacion_estribos DECIMAL,
  trabes_seccion_espesor_muro DECIMAL,
  mc_colapso BOOLEAN,
  mc_grietas_cortante BOOLEAN,
  mc_grietas_flexion BOOLEAN,
  mc_aplastamiento BOOLEAN,
  mc_pandeo_barras BOOLEAN,
  mc_pandeo_placas BOOLEAN,
  mc_falla_soldadura BOOLEAN,
  mc_ancho_max_grieta DECIMAL,
  mc_separacion_estribos DECIMAL,
  mc_seccion_espesor_muro DECIMAL,
  mm_colapso BOOLEAN,
  mm_grietas_cortante BOOLEAN,
  mm_grietas_flexion BOOLEAN,
  mm_aplastamiento BOOLEAN,
  mm_pandeo_barras BOOLEAN,
  mm_pandeo_placas BOOLEAN,
  mm_falla_soldadura BOOLEAN,
  mm_ancho_max_grieta DECIMAL,
  mm_separacion_estribos DECIMAL,
  mm_seccion_espesor_muro DECIMAL,
  numero_columnas_dano_severo DECIMAL,
  total_columnas_entrepiso DECIMAL,
  de_colapso_total BOOLEAN,
  de_dano_severo BOOLEAN,
  de_dano_medio BOOLEAN,
  de_dano_ligero BOOLEAN,
  od_vidrios BOOLEAN,
  od_acabados BOOLEAN,
  od_plafones BOOLEAN,
  od_fachadas BOOLEAN,
  od_bardas BOOLEAN,
  od_instalaciones BOOLEAN,
  od_cubos BOOLEAN,
  tipo_dano_general TEXT
)
''');
    });
  }

  Future<LevantamientosModel?> obtenerLevantamientoPorId(int id) async {
    final db = await database;
    final res = await db.query(
      'inspecciones',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (res.isNotEmpty) {
      return LevantamientosModel.fromJson(res.first);
    } else {
      return null; // No se encontró el levantamiento
    }
  }

  Future<List<String>> obtenerDatosInspector() async {
    final db = await database;
    const id = 0;
    final res = await db.query('inspector', where: 'id=?', whereArgs: [id]);
    if (res.isNotEmpty) {
      return [
        res[0]['id'].toString(),
        res[0]['nombre'].toString(),
        res[0]['clave'].toString()
      ];
    } else {
      return ["0", "", ""];
    } 
  }

  Future<List<String>> obtenerInformacionInspector(String usuario) async {
    final db = await database;
    final res = await db.query('inspector', where: 'usuario=?', whereArgs: [usuario]);
    if (res.isNotEmpty) {
      return [
        res[0]['id'].toString(),
        res[0]['nombre'].toString(),
        res[0]['clave'].toString()
      ];
    } else {
      return ["0", "", ""];
    }
  }

  Future<List<ImagenesFGModel>?> obtenerImagenesFG(int id) async {
    final db = await database;
    final res = await db.query('imagenes_levantamiento_fg',
        where: 'id_formato_general=?', whereArgs: [id]);
    return res.isNotEmpty
        ? res.map((e) => ImagenesFGModel.fromJson(e)).toList()
        : null;
  }

  Future<int> nuevaImagenFGP(ImagenesFGModel nuevoImagenFG) async {
    final db = await database;
    final res =
        await db.insert('imagenes_levantamiento_fg', nuevoImagenFG.toJson());
    return res;
  }

  Future<int> actualizarFormatoGeneral(
      FormatoGeneralModel formatoGeneral) async {
    final db = await database;
    final res = await db.update('formatos_generales', formatoGeneral.toJson(),
        where: 'id=?', whereArgs: [formatoGeneral.id]);
    return res;
  }

  Future<List<FormatoGeneralModel>?> obtenerFormatosGenerales(int id) async {
    final db = await database;
    late List<FormatoGeneralModel>? formatosGenerales;
    await db.transaction((txn) async {
      final res = await txn.query('formatos_generales',
          where: 'id_evaluacion=?', whereArgs: [id]);
      formatosGenerales = res.isNotEmpty
          ? res.map((e) => FormatoGeneralModel.fromJson(e)).toList()
          : null;
    });
    return formatosGenerales;
  }

  Future<int> obtenerUltimoConsecutivo() async {
    final db = await database;
    final res = await db.rawQuery(
        'SELECT MAX(consecutivo) as max_consecutivo FROM formatos_generales');
    return res.first['max_consecutivo'] == null
        ? 1
        : int.parse(res.first['max_consecutivo'].toString()) + 1;
  }

  Future<int> nuevoFormatoGeneral(
      FormatoGeneralModel nuevoFormatoGeneral) async {
    final db = await database;
    final res =
        await db.insert('formatos_generales', nuevoFormatoGeneral.toJson());
    return res;
  }

  Future<int> nuevoFormatoEscuela(
      FormatoEscuelaModel nuevoFormatoEscuela) async {
    final db = await database;
    final res =
        await db.insert('formatos_Escuelaes', nuevoFormatoEscuela.toJson());
    return res;
  }

  Future<int> nuevoLevantamiento(LevantamientosModel nuevoLevantamiento) async {
    final db = await database;
    final res = await db.insert('inspecciones', nuevoLevantamiento.toJson());
    return res;
  }

  Future<int> editarInformacionInspector(
      InformacionInspectorModel informacionInspector) async {
    final db = await database;
    const id = 0;
    //print(informacionInspector.toJson());
    final res =
        await db.rawQuery('SELECT MAX(id) as max_consecutivo FROM inspector');
    return res.first['max_consecutivo'] == null
        ? await db.insert('inspector', informacionInspector.toJson())
        : await db.update('inspector', informacionInspector.toJson(),
            where: 'id = ?', whereArgs: [id]);
  }

  Future<List<LevantamientosModel>?> obtenerLevantamientos() async {
    final db = await database;
    final res = await db.query('inspecciones');
    return res.isNotEmpty
        ? res.map((e) => LevantamientosModel.fromJson(e)).toList()
        : null;
  }

  Future<int> borrarLevantamientos(int id) async {
    final db = await database;
    final res = await db.delete('inspecciones', where: 'id=?', whereArgs: [id]);
    return res;
  }

  Future<int> actualizarLevantamientoSubido(int idLocal, String idFirebase) async {
  final db = await database;
  return await db.update(
    'inspecciones',
    {
      'subido': idFirebase,
    },
    where: 'id = ?',
    whereArgs: [idLocal],
  );
}

  //=============Hacer una copia de una tabla sqlite a txt
  Future<void> exportTableToTxt(
      String tableName, String idInspeccion, String columna) async {
    final db = await database;

    // Verificar si la tabla existe
    final tables = await db
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    final tableExists = tables.any((table) => table['name'] == tableName);
    if (!tableExists) {
      return;
    }
    final data = await db
        .query(tableName, where: '$columna = ?', whereArgs: [idInspeccion]);
    // Obtener el directorio de almacenamiento
    final directory = await getApplicationDocumentsDirectory();
    final file =
        File('${directory.path}/inspeccion_$idInspeccion/$tableName.txt');
    // Escribir los datos en el archivo de texto
    final lines = data.map((row) => row.values.join(',')).toList();
    final content = lines.join('\n');
    await file.writeAsString(content);
  }

  // Hacer una copia de las imagenes del levantamiento a la carpeta de la inspeccion
  Future<int> copiaImagenesCarpeta(String idInspeccion) async {
    final db = await database;
    final res = await db.query('imagenes_levantamiento_fg',
        where: 'id_levantamiento=?', whereArgs: [idInspeccion]);
    for (final row in res) {
      final ruta = row['ruta_dispositivo'];
      final id = row['id'];
      final idFormatoGeneral = row['id_formato_general'];
      final directory = await getApplicationDocumentsDirectory();
      final imagenOriginal = File(ruta.toString());
      final imagenNueva = File(
          '${directory.path}/inspeccion_$idInspeccion/${idFormatoGeneral}_$id.jpg');

      try {
        // Copiar la imagen al destino
        imagenOriginal.copySync(imagenNueva.path);
        // print('Imagen copiada exitosamente');
      } catch (e) {
        //print('Error al copiar la imagen: $e');
      }
    }
    return 1;
  }

  // Crear el zip de la carpeta de la inspeccion
  Future<String> comprimirCarpeta(String idInspeccion) async {
    final directory = await getApplicationDocumentsDirectory();
    final destinationPath =
        '${directory.path}/inspeccion_$idInspeccion/inspeccion_$idInspeccion.zip';

    final folderPath = '${directory.path}/inspeccion_$idInspeccion/';
    final encoder = ZipFileEncoder();
    final zipFile = File(destinationPath);
    final archivoExiste = await zipFile.exists();
    if (archivoExiste) {
      await zipFile.delete();
    }
    final folder = Directory(folderPath);
    final files = folder.listSync(recursive: true);
    encoder.open(zipFile.path); // Inicializar el encoder
    final archive = Archive();

    for (var file in files) {
      if (file is File) {
        final filePath = file.path;
        final fileContent = File(filePath).readAsBytesSync();
        final fileRelativePath = filePath.replaceAll(folderPath, '');

        final archiveFile =
            ArchiveFile(fileRelativePath, fileContent.length, fileContent);
        archive.addFile(archiveFile);
      }
    }

    final zipData = ZipEncoder().encode(archive);
    zipFile.writeAsBytesSync(zipData!);

    encoder.close();
    return destinationPath;
  }
}
