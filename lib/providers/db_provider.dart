import 'dart:io';

import 'package:eva_fi_umich/screens/levantamientos_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:eva_fi_umich/models/levantamientos_model.dart';
export 'package:eva_fi_umich/models/levantamientos_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'evaFICDB.db');
    print(path);

    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE inspecciones(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            fecha TEXT,
            estado TEXT,
            municipio TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE evaluaciones (
            id INTEGER PRIMARY KEY,
            codigo TEXT,
            tipo TEXT,
            fecha TEXT,
            usuario TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE formatos_generales (
  id INTEGER PRIMARY KEY,
  id_evaluacion INTEGER,
  codigo TEXT,
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  n TEXT,
  o TEXT,
  msnm TEXT,
  nombre_inmueble TEXT,
  calle_numero TEXT,
  colonia TEXT,
  codigo_postal TEXT,
  pueblo_ciudad TEXT,
  referencias TEXT,
  telefono INTEGER,
  vivienda BOOLEAN,
  hospital BOOLEAN,
  oficinas BOOLEAN,
  iglesia BOOLEAN,
  comercio BOOLEAN,
  escuela BOOLEAN,
  reunion_cine_estadio BOOLEAN,
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
  bloque_concreto_20x40 BOOLEAN,
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
  colapso_columnas BOOLEAN,
  grietas_cortante BOOLEAN,
  grietas_flexion BOOLEAN,
  aplastamiento BOOLEAN,
  pandeo_barras BOOLEAN,
  pandeo_placas BOOLEAN,
  falla_soldadura BOOLEAN,
  ancho_max_grieta DECIMAL,
  separacion_estribos DECIMAL,
  seccion_espesor_muro DECIMAL
)
''');

    });
  }

  Future<int> nuevoLevantamiento(LevantamientosModel nuevoLevantamiento) async {
    final db = await database;
    final res = await db.insert('inspecciones', nuevoLevantamiento.toJson());
    return res;
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
}
