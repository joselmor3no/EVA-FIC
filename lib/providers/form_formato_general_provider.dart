// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

import '../models/formato_general_model.dart';
import 'db_provider.dart';

class FormFormatoGeneralProvider extends ChangeNotifier {
  GlobalKey<FormState> formFormatoGeneralKey = GlobalKey<FormState>();

  String _id_evaluacion = '';
  int _consecutivo = 0;
  String _fecha = '';
  double _n = 0.0;
  double _o = 0.0;
  double _msnm = 0.0;
  String _nombre_inmueble = '';
  String _calle_numero = '';
  String _colonia = '';
  String _codigo_postal = '';
  String _pueblo_ciudad = '';
  String _referencias = '';
  String _propietario = '';
  String _telefono = '';
  bool _vivienda = false;
  bool _hospital = false;
  bool _oficinas = false;
  bool _iglesia = false;
  bool _comercio = false;
  bool _escuela = false;
  bool _reunion_cine_estadio = false;
  bool _desocupada = false;
  int _niveles = 0;
  int _sotanos = 0;
  int _ocupantes = 0;
  double _frente_x = 0.0;
  double _frente_y = 0.0;
  bool _planicie = false;
  bool _ladera_cerro = false;
  bool _rivera_rio_lago = false;
  bool _fondo_valle = false;
  bool _costa = false;
  bool _depositos_lacustres = false;
  bool _marcos_acero_1 = false;
  bool _marcos_concreto_1 = false;
  bool _columnas_losa_plana_1 = false;
  bool _muros_carga_mamposteria_1 = false;
  bool _marcos_muros_diafragma_1 = false;
  bool _uso_contravientos_1 = false;
  bool _muros_adobe_bahareque = false;
  bool _muros_madera_lamina_otros = false;
  bool _marcos_acero_2 = false;
  bool _marcos_concreto_2 = false;
  bool _columnas_losa_plana_2 = false;
  bool _muros_carga_mamposteria_2 = false;
  bool _marcos_muros_diafragma_2 = false;
  bool _uso_contravientos_2 = false;
  bool _muros_adobe_bahareque_2 = false;
  bool _muros_madera_lamina_otros_2 = false;
  bool _confinada = false;
  bool _refuerzo_interior = false;
  bool _bloque_concreto = false;
  bool _tabique_hueco_arcilla = false;
  bool _tabicon_concreto = false;
  bool _simple = false;
  bool _losa_maciza = false;
  bool _losa_reticular = false;
  bool _vigueta_bovedilla = false;
  bool _no_se_sabe_sistema_piso = false;
  bool _igual_al_del_piso = false;
  bool _lamina = false;
  bool _teja = false;
  String _otro_sistema_techo = '';
  bool _zapatas_aisladas = false;
  bool _zapatas_corridas = false;
  bool _cimiento_piedra = false;
  bool _losa_cimentacion = false;
  bool _pilotes_pilas = false;
  bool _cajon = false;
  bool _no_se_sabe_cimentacion = false;
  bool _esquina = false;
  bool _medio = false;
  bool _frente_calle = false;
  bool _frente_predio = false;
  bool _frente_parque = false;
  bool _frente_corriente = false;
  bool _frente_barranca = false;
  bool _aislado = false;
  bool _asimetria_muro_cubos_cargas = false;
  bool _grandes_aberturas = false;
  bool _geometria_irregular_planta = false;
  bool _planta_baja_doble_altura = false;
  bool _muros_no_llegan_cimentacion = false;
  bool _planta_baja_flexible = false;
  bool _columna_corta = false;
  bool _grandes_masas_pisos_superiores = false;
  bool _reduccion_brusca_pisos_superiores = false;
  double _separacion_edif_vecino = 0.0;
  bool _grietas_terreno = false;
  bool _hundimientos = false;
  double _inclinacion_edificio = 0.0;
  bool _colapso_losas = false;
  double _grietas_max = 0.0;
  double _flechas_max = 0.0;
  bool _falla_conexiones = false;
  bool _col_colapso = false;
  bool _col_grietas_cortante = false;
  bool _col_grietas_flexion = false;
  bool _col_aplastamiento = false;
  bool _col_pandeo_barras = false;
  bool _col_pandeo_placas = false;
  bool _col_falla_soldadura = false;
  double _col_ancho_max_grieta = 0.0;
  double _col_separacion_estribos = 0.0;
  double _col_seccion_espesor_muro = 0.0;
  bool _trabes_colapso = false;
  bool _trabes_grietas_cortante = false;
  bool _trabes_grietas_flexion = false;
  bool _trabes_aplastamiento = false;
  bool _trabes_pandeo_barras = false;
  bool _trabes_pandeo_placas = false;
  bool _trabes_falla_soldadura = false;
  double _trabes_ancho_max_grieta = 0.0;
  double _trabes_separacion_estribos = 0.0;
  double _trabes_seccion_espesor_muro = 0.0;
  bool _mc_colapso = false;
  bool _mc_grietas_cortante = false;
  bool _mc_grietas_flexion = false;
  bool _mc_aplastamiento = false;
  bool _mc_pandeo_barras = false;
  bool _mc_pandeo_placas = false;
  bool _mc_falla_soldadura = false;
  double _mc_ancho_max_grieta = 0.0;
  double _mc_separacion_estribos = 0.0;
  double _mc_seccion_espesor_muro = 0.0;
  bool _mm_colapso = false;
  bool _mm_grietas_cortante = false;
  bool _mm_grietas_flexion = false;
  bool _mm_aplastamiento = false;
  bool _mm_pandeo_barras = false;
  bool _mm_pandeo_placas = false;
  bool _mm_falla_soldadura = false;
  double _mm_ancho_max_grieta = 0.0;
  double _mm_separacion_estribos = 0.0;
  double _mm_seccion_espesor_muro = 0.0;
  double _numero_columnas_dano_severo = 0.0;
  double _total_columnas_entrepiso = 0.0;
  bool _de_colapso_total = false;
  bool _de_dano_severo = false;
  bool _de_dano_medio = false;
  bool _de_dano_ligero = false;
  bool _od_vidrios = false;
  bool _od_acabados = false;
  bool _od_plafones = false;
  bool _od_fachadas = false;
  bool _od_Bardas = false;
  bool _od_instalaciones = false;
  bool _od_cubos = false;
  String _tipo_dano_general = '';

  String get id_evaluacion => _id_evaluacion;
  int get consecutivo => _consecutivo;
  String get fecha => _fecha;
  double get n => _n;
  double get o => _o;
  double get msnm => _msnm;
  String get nombre_inmueble => _nombre_inmueble;
  String get calle_numero => _calle_numero;
  String get colonia => _colonia;
  String get codigo_postal => _codigo_postal;
  String get pueblo_ciudad => _pueblo_ciudad;
  String get referencias => _referencias;
  String get propietario => _propietario;
  String get telefono => _telefono;
  bool get vivienda => _vivienda;
  bool get hospital => _hospital;
  bool get oficinas => _oficinas;
  bool get iglesia => _iglesia;
  bool get comercio => _comercio;
  bool get escuela => _escuela;
  bool get reunion_cine_estadio => _reunion_cine_estadio;
  bool get desocupada => _desocupada;
  int get niveles => _niveles;
  int get sotanos => _sotanos;
  int get ocupantes => _ocupantes;
  double get frente_x => _frente_x;
  double get frente_y => _frente_y;
  bool get planicie => _planicie;
  bool get ladera_cerro => _ladera_cerro;
  bool get rivera_rio_lago => _rivera_rio_lago;
  bool get fondo_valle => _fondo_valle;
  bool get costa => _costa;
  bool get depositos_lacustres => _depositos_lacustres;
  bool get marcos_acero_1 => _marcos_acero_1;
  bool get marcos_concreto_1 => _marcos_concreto_1;
  bool get columnas_losa_plana_1 => _columnas_losa_plana_1;
  bool get muros_carga_mamposteria_1 => _muros_carga_mamposteria_1;
  bool get marcos_muros_diafragma_1 => _marcos_muros_diafragma_1;
  bool get uso_contravientos_1 => _uso_contravientos_1;
  bool get muros_adobe_bahareque => _muros_adobe_bahareque;
  bool get muros_madera_lamina_otros => _muros_madera_lamina_otros;
  bool get marcos_acero_2 => _marcos_acero_2;
  bool get marcos_concreto_2 => _marcos_concreto_2;
  bool get columnas_losa_plana_2 => _columnas_losa_plana_2;
  bool get muros_carga_mamposteria_2 => _muros_carga_mamposteria_2;
  bool get marcos_muros_diafragma_2 => _marcos_muros_diafragma_2;
  bool get uso_contravientos_2 => _uso_contravientos_2;
  bool get muros_adobe_bahareque_2 => _muros_adobe_bahareque_2;
  bool get muros_madera_lamina_otros_2 => _muros_madera_lamina_otros_2;
  bool get confinada => _confinada;
  bool get refuerzo_interior => _refuerzo_interior;
  bool get bloque_concreto => _bloque_concreto;
  bool get tabique_hueco_arcilla => _tabique_hueco_arcilla;
  bool get tabicon_concreto => _tabicon_concreto;
  bool get simple => _simple;
  bool get losa_maciza => _losa_maciza;
  bool get losa_reticular => _losa_reticular;
  bool get vigueta_bovedilla => _vigueta_bovedilla;
  bool get no_se_sabe_sistema_piso => _no_se_sabe_sistema_piso;
  bool get igual_al_del_piso => _igual_al_del_piso;
  bool get lamina => _lamina;
  bool get teja => _teja;
  String get otro_sistema_techo => _otro_sistema_techo;
  bool get zapatas_aisladas => _zapatas_aisladas;
  bool get zapatas_corridas => _zapatas_corridas;
  bool get cimiento_piedra => _cimiento_piedra;
  bool get losa_cimentacion => _losa_cimentacion;
  bool get pilotes_pilas => _pilotes_pilas;
  bool get cajon => _cajon;
  bool get no_se_sabe_cimentacion => _no_se_sabe_cimentacion;
  bool get esquina => _esquina;
  bool get medio => _medio;
  bool get frente_calle => _frente_calle;
  bool get frente_predio => _frente_predio;
  bool get frente_parque => _frente_parque;
  bool get frente_corriente => _frente_corriente;
  bool get frente_barranca => _frente_barranca;
  bool get aislado => _aislado;
  bool get asimetria_muro_cubos_cargas => _asimetria_muro_cubos_cargas;
  bool get grandes_aberturas => _grandes_aberturas;
  bool get geometria_irregular_planta => _geometria_irregular_planta;
  bool get planta_baja_doble_altura => _planta_baja_doble_altura;
  bool get muros_no_llegan_cimentacion => _muros_no_llegan_cimentacion;
  bool get planta_baja_flexible => _planta_baja_flexible;
  bool get columna_corta => _columna_corta;
  bool get grandes_masas_pisos_superiores => _grandes_masas_pisos_superiores;
  bool get reduccion_brusca_pisos_superiores =>
      _reduccion_brusca_pisos_superiores;
  double get separacion_edif_vecino => _separacion_edif_vecino;
  bool get grietas_terreno => _grietas_terreno;
  bool get hundimientos => _hundimientos;
  double get inclinacion_edificio => _inclinacion_edificio;
  bool get colapso_losas => _colapso_losas;
  double get grietas_max => _grietas_max;
  double get flechas_max => _flechas_max;
  bool get falla_conexiones => _falla_conexiones;
  // Columnas
  bool get col_colapso => _col_colapso;
  bool get col_grietas_cortante => _col_grietas_cortante;
  bool get col_grietas_flexion => _col_grietas_flexion;
  bool get col_aplastamiento => _col_aplastamiento;
  bool get col_pandeo_barras => _col_pandeo_barras;
  bool get col_pandeo_placas => _col_pandeo_placas;
  bool get col_falla_soldadura => _col_falla_soldadura;
  double get col_ancho_max_grieta => _col_ancho_max_grieta;
  double get col_separacion_estribos => _col_separacion_estribos;
  double get col_seccion_espesor_muro => _col_seccion_espesor_muro;
  // Trabes
  bool get trabes_colapso => _trabes_colapso;
  bool get trabes_grietas_cortante => _trabes_grietas_cortante;
  bool get trabes_grietas_flexion => _trabes_grietas_flexion;
  bool get trabes_aplastamiento => _trabes_aplastamiento;
  bool get trabes_pandeo_barras => _trabes_pandeo_barras;
  bool get trabes_pandeo_placas => _trabes_pandeo_placas;
  bool get trabes_falla_soldadura => _trabes_falla_soldadura;
  double get trabes_ancho_max_grieta => _trabes_ancho_max_grieta;
  double get trabes_separacion_estribos => _trabes_separacion_estribos;
  double get trabes_seccion_espesor_muro => _trabes_seccion_espesor_muro;

  // Muros de concreto
  bool get mc_colapso => _mc_colapso;
  bool get mc_grietas_cortante => _mc_grietas_cortante;
  bool get mc_grietas_flexion => _mc_grietas_flexion;
  bool get mc_aplastamiento => _mc_aplastamiento;
  bool get mc_pandeo_barras => _mc_pandeo_barras;
  bool get mc_pandeo_placas => _mc_pandeo_placas;
  bool get mc_falla_soldadura => _mc_falla_soldadura;
  double get mc_ancho_max_grieta => _mc_ancho_max_grieta;
  double get mc_separacion_estribos => _mc_separacion_estribos;
  double get mc_seccion_espesor_muro => _mc_seccion_espesor_muro;

  // Muros de concreto
  bool get mm_colapso => _mm_colapso;
  bool get mm_grietas_cortante => _mm_grietas_cortante;
  bool get mm_grietas_flexion => _mm_grietas_flexion;
  bool get mm_aplastamiento => _mm_aplastamiento;
  bool get mm_pandeo_barras => _mm_pandeo_barras;
  bool get mm_pandeo_placas => _mm_pandeo_placas;
  bool get mm_falla_soldadura => _mm_falla_soldadura;
  double get mm_ancho_max_grieta => _mm_ancho_max_grieta;
  double get mm_separacion_estribos => _mm_separacion_estribos;
  double get mm_seccion_espesor_muro => _mm_seccion_espesor_muro;

  // Otros daños
  double get numero_columnas_dano_severo => _numero_columnas_dano_severo;
  double get total_columnas_entrepiso => _total_columnas_entrepiso;
  bool get de_colapso_total => _de_colapso_total;
  bool get de_dano_severo => _de_dano_severo;
  bool get de_dano_medio => _de_dano_medio;
  bool get de_dano_ligero => _de_dano_ligero;
  bool get od_vidrios => _od_vidrios;
  bool get od_acabados => _od_acabados;
  bool get od_plafones => _od_plafones;
  bool get od_fachadas => _od_fachadas;
  bool get od_Bardas => _od_Bardas;
  bool get od_instalaciones => _od_instalaciones;
  bool get od_cubos => _od_cubos;
  String get tipo_dano_general => _tipo_dano_general;

  set id_evaluacion(String value) {
    _id_evaluacion = value;
    notifyListeners();
  }

  set consecutivo(int value) {
    _consecutivo = value;
    notifyListeners();
  }

  set fecha(String value) {
    _fecha = value;
    notifyListeners();
  }

  set n(double value) {
    _n = value;
    notifyListeners();
  }

  set o(double value) {
    _o = value;
    notifyListeners();
  }

  set msnm(double value) {
    _msnm = value;
    notifyListeners();
  }

  set nombre_inmueble(String value) {
    _nombre_inmueble = value;
    notifyListeners();
  }

  set calle_numero(String value) {
    _calle_numero = value;
    notifyListeners();
  }

  set colonia(String value) {
    _colonia = value;
    notifyListeners();
  }

  set codigo_postal(String value) {
    _codigo_postal = value;
    notifyListeners();
  }

  set pueblo_ciudad(String value) {
    _pueblo_ciudad = value;
    notifyListeners();
  }

  set referencias(String value) {
    _referencias = value;
    notifyListeners();
  }

  set propietario(String value) {
    _propietario = value;
    notifyListeners();
  }

  set telefono(String value) {
    _telefono = value;
    notifyListeners();
  }

  set vivienda(bool value) {
    _vivienda = value;
    notifyListeners();
  }

  set hospital(bool value) {
    _hospital = value;
    notifyListeners();
  }

  set oficinas(bool value) {
    _oficinas = value;
    notifyListeners();
  }

  set iglesia(bool value) {
    _iglesia = value;
    notifyListeners();
  }

  set comercio(bool value) {
    _comercio = value;
    notifyListeners();
  }

  set escuela(bool value) {
    _escuela = value;
    notifyListeners();
  }

  set reunion_cine_estadio(bool value) {
    _reunion_cine_estadio = value;
    notifyListeners();
  }

  set desocupada(bool value) {
    _desocupada = value;
    notifyListeners();
  }

  set niveles(int value) {
    _niveles = value;
    notifyListeners();
  }

  set sotanos(int value) {
    _sotanos = value;
    notifyListeners();
  }

  set ocupantes(int value) {
    _ocupantes = value;
    notifyListeners();
  }

  set frente_x(double value) {
    _frente_x = value;
    notifyListeners();
  }

  set frente_y(double value) {
    _frente_y = value;
    notifyListeners();
  }

  set planicie(bool value) {
    _planicie = value;
    notifyListeners();
  }

  set ladera_cerro(bool value) {
    _ladera_cerro = value;
    notifyListeners();
  }

  set rivera_rio_lago(bool value) {
    _rivera_rio_lago = value;
    notifyListeners();
  }

  set fondo_valle(bool value) {
    _fondo_valle = value;
    notifyListeners();
  }

  set costa(bool value) {
    _costa = value;
    notifyListeners();
  }

  set depositos_lacustres(bool value) {
    _depositos_lacustres = value;
    notifyListeners();
  }

  set marcos_acero_1(bool value) {
    _marcos_acero_1 = value;
    notifyListeners();
  }

  set marcos_concreto_1(bool value) {
    _marcos_concreto_1 = value;
    notifyListeners();
  }

  set columnas_losa_plana_1(bool value) {
    _columnas_losa_plana_1 = value;
    notifyListeners();
  }

  set muros_carga_mamposteria_1(bool value) {
    _muros_carga_mamposteria_1 = value;
    notifyListeners();
  }

  set marcos_muros_diafragma_1(bool value) {
    _marcos_muros_diafragma_1 = value;
    notifyListeners();
  }

  set uso_contravientos_1(bool value) {
    _uso_contravientos_1 = value;
    notifyListeners();
  }

  set muros_adobe_bahareque(bool value) {
    _muros_adobe_bahareque = value;
    notifyListeners();
  }

  set muros_madera_lamina_otros(bool value) {
    _muros_madera_lamina_otros = value;
    notifyListeners();
  }

  set marcos_acero_2(bool value) {
    _marcos_acero_2 = value;
    notifyListeners();
  }

  set marcos_concreto_2(bool value) {
    _marcos_concreto_2 = value;
    notifyListeners();
  }

  set columnas_losa_plana_2(bool value) {
    _columnas_losa_plana_2 = value;
    notifyListeners();
  }

  set muros_carga_mamposteria_2(bool value) {
    _muros_carga_mamposteria_2 = value;
    notifyListeners();
  }

  set marcos_muros_diafragma_2(bool value) {
    _marcos_muros_diafragma_2 = value;
    notifyListeners();
  }

  set uso_contravientos_2(bool value) {
    _uso_contravientos_2 = value;
    notifyListeners();
  }

  set muros_adobe_bahareque_2(bool value) {
    _muros_adobe_bahareque_2 = value;
    notifyListeners();
  }

  set muros_madera_lamina_otros_2(bool value) {
    _muros_madera_lamina_otros_2 = value;
    notifyListeners();
  }

  set confinada(bool value) {
    _confinada = value;
    notifyListeners();
  }

  set refuerzo_interior(bool value) {
    _refuerzo_interior = value;
    notifyListeners();
  }

  set bloque_concreto(bool value) {
    _bloque_concreto = value;
    notifyListeners();
  }

  set tabique_hueco_arcilla(bool value) {
    _tabique_hueco_arcilla = value;
    notifyListeners();
  }

  set tabicon_concreto(bool value) {
    _tabicon_concreto = value;
    notifyListeners();
  }

  set simple(bool value) {
    _simple = value;
    notifyListeners();
  }

  set losa_maciza(bool value) {
    _losa_maciza = value;
    notifyListeners();
  }

  set losa_reticular(bool value) {
    _losa_reticular = value;
    notifyListeners();
  }

  set vigueta_bovedilla(bool value) {
    _vigueta_bovedilla = value;
    notifyListeners();
  }

  set no_se_sabe_sistema_piso(bool value) {
    _no_se_sabe_sistema_piso = value;
    notifyListeners();
  }

  set igual_al_del_piso(bool value) {
    _igual_al_del_piso = value;
    notifyListeners();
  }

  set lamina(bool value) {
    _lamina = value;
    notifyListeners();
  }

  set teja(bool value) {
    _teja = value;
    notifyListeners();
  }

  set otro_sistema_techo(String value) {
    _otro_sistema_techo = value;
    notifyListeners();
  }

  set zapatas_aisladas(bool value) {
    _zapatas_aisladas = value;
    notifyListeners();
  }

  set zapatas_corridas(bool value) {
    _zapatas_corridas = value;
    notifyListeners();
  }

  set cimiento_piedra(bool value) {
    _cimiento_piedra = value;
    notifyListeners();
  }

  set losa_cimentacion(bool value) {
    _losa_cimentacion = value;
    notifyListeners();
  }

  set pilotes_pilas(bool value) {
    _pilotes_pilas = value;
    notifyListeners();
  }

  set cajon(bool value) {
    _cajon = value;
    notifyListeners();
  }

  set no_se_sabe_cimentacion(bool value) {
    _no_se_sabe_cimentacion = value;
    notifyListeners();
  }

  set esquina(bool value) {
    _esquina = value;
    notifyListeners();
  }

  set medio(bool value) {
    _medio = value;
    notifyListeners();
  }

  set frente_calle(bool value) {
    _frente_calle = value;
    notifyListeners();
  }

  set frente_predio(bool value) {
    _frente_predio = value;
    notifyListeners();
  }

  set frente_parque(bool value) {
    _frente_parque = value;
    notifyListeners();
  }

  set frente_corriente(bool value) {
    _frente_corriente = value;
    notifyListeners();
  }

  set frente_barranca(bool value) {
    _frente_barranca = value;
    notifyListeners();
  }

  set aislado(bool value) {
    _aislado = value;
    notifyListeners();
  }

  set asimetria_muro_cubos_cargas(bool value) {
    _asimetria_muro_cubos_cargas = value;
    notifyListeners();
  }

  set grandes_aberturas(bool value) {
    _grandes_aberturas = value;
    notifyListeners();
  }

  set geometria_irregular_planta(bool value) {
    _geometria_irregular_planta = value;
    notifyListeners();
  }

  set planta_baja_doble_altura(bool value) {
    _planta_baja_doble_altura = value;
    notifyListeners();
  }

  set muros_no_llegan_cimentacion(bool value) {
    _muros_no_llegan_cimentacion = value;
    notifyListeners();
  }

  set planta_baja_flexible(bool value) {
    _planta_baja_flexible = value;
    notifyListeners();
  }

  set columna_corta(bool value) {
    _columna_corta = value;
    notifyListeners();
  }

  set grandes_masas_pisos_superiores(bool value) {
    _grandes_masas_pisos_superiores = value;
    notifyListeners();
  }

  set reduccion_brusca_pisos_superiores(bool value) {
    _reduccion_brusca_pisos_superiores = value;
    notifyListeners();
  }

  set separacion_edif_vecino(double value) {
    _separacion_edif_vecino = value;
    notifyListeners();
  }

  set grietas_terreno(bool value) {
    _grietas_terreno = value;
    notifyListeners();
  }

  set hundimientos(bool value) {
    _hundimientos = value;
    notifyListeners();
  }

  set inclinacion_edificio(double value) {
    _inclinacion_edificio = value;
    notifyListeners();
  }

  set colapso_losas(bool value) {
    _colapso_losas = value;
    notifyListeners();
  }

  set grietas_max(double value) {
    _grietas_max = value;
    notifyListeners();
  }

  set flechas_max(double value) {
    _flechas_max = value;
    notifyListeners();
  }

  set falla_conexiones(bool value) {
    _falla_conexiones = value;
    notifyListeners();
  }

  set col_colapso(bool value) {
    _col_colapso = value;
    notifyListeners();
  }

  set col_grietas_cortante(bool value) {
    _col_grietas_cortante = value;
    notifyListeners();
  }

  set col_grietas_flexion(bool value) {
    _col_grietas_flexion = value;
    notifyListeners();
  }

  set col_aplastamiento(bool value) {
    _col_aplastamiento = value;
    notifyListeners();
  }

  set col_pandeo_barras(bool value) {
    _col_pandeo_barras = value;
    notifyListeners();
  }

  set col_pandeo_placas(bool value) {
    _col_pandeo_placas = value;
    notifyListeners();
  }

  set col_falla_soldadura(bool value) {
    _col_falla_soldadura = value;
    notifyListeners();
  }

  set col_ancho_max_grieta(double value) {
    _col_ancho_max_grieta = value;
    notifyListeners();
  }

  set col_separacion_estribos(double value) {
    _col_separacion_estribos = value;
    notifyListeners();
  }

  set col_seccion_espesor_muro(double value) {
    _col_seccion_espesor_muro = value;
    notifyListeners();
  }

  set trabes_colapso(bool value) {
    _trabes_colapso = value;
    notifyListeners();
  }

  set trabes_grietas_cortante(bool value) {
    _trabes_grietas_cortante = value;
    notifyListeners();
  }

  set trabes_grietas_flexion(bool value) {
    _trabes_grietas_flexion = value;
    notifyListeners();
  }

  set trabes_aplastamiento(bool value) {
    _trabes_aplastamiento = value;
    notifyListeners();
  }

  set trabes_pandeo_barras(bool value) {
    _trabes_pandeo_barras = value;
    notifyListeners();
  }

  set trabes_pandeo_placas(bool value) {
    _trabes_pandeo_placas = value;
    notifyListeners();
  }

  set trabes_falla_soldadura(bool value) {
    _trabes_falla_soldadura = value;
    notifyListeners();
  }

  set trabes_ancho_max_grieta(double value) {
    _trabes_ancho_max_grieta = value;
    notifyListeners();
  }

  set trabes_separacion_estribos(double value) {
    _trabes_separacion_estribos = value;
    notifyListeners();
  }

  set trabes_seccion_espesor_muro(double value) {
    _trabes_seccion_espesor_muro = value;
    notifyListeners();
  }

  // Muros de concreto
  set mc_colapso(bool value) {
    _mc_colapso = value;
    notifyListeners();
  }

  set mc_grietas_cortante(bool value) {
    _mc_grietas_cortante = value;
    notifyListeners();
  }

  set mc_grietas_flexion(bool value) {
    _mc_grietas_flexion = value;
    notifyListeners();
  }

  set mc_aplastamiento(bool value) {
    _mc_aplastamiento = value;
    notifyListeners();
  }

  set mc_pandeo_barras(bool value) {
    _mc_pandeo_barras = value;
    notifyListeners();
  }

  set mc_pandeo_placas(bool value) {
    _mc_pandeo_placas = value;
    notifyListeners();
  }

  set mc_falla_soldadura(bool value) {
    _mc_falla_soldadura = value;
    notifyListeners();
  }

  set mc_ancho_max_grieta(double value) {
    _mc_ancho_max_grieta = value;
    notifyListeners();
  }

  set mc_separacion_estribos(double value) {
    _mc_separacion_estribos = value;
    notifyListeners();
  }

  set mc_seccion_espesor_muro(double value) {
    _mc_seccion_espesor_muro = value;
    notifyListeners();
  }

  // Muros de concreto
  set mm_colapso(bool value) {
    _mm_colapso = value;
    notifyListeners();
  }

  set mm_grietas_cortante(bool value) {
    _mm_grietas_cortante = value;
    notifyListeners();
  }

  set mm_grietas_flexion(bool value) {
    _mm_grietas_flexion = value;
    notifyListeners();
  }

  set mm_aplastamiento(bool value) {
    _mm_aplastamiento = value;
    notifyListeners();
  }

  set mm_pandeo_barras(bool value) {
    _mm_pandeo_barras = value;
    notifyListeners();
  }

  set mm_pandeo_placas(bool value) {
    _mm_pandeo_placas = value;
    notifyListeners();
  }

  set mm_falla_soldadura(bool value) {
    _mm_falla_soldadura = value;
    notifyListeners();
  }

  set mm_ancho_max_grieta(double value) {
    _mm_ancho_max_grieta = value;
    notifyListeners();
  }

  set mm_separacion_estribos(double value) {
    _mm_separacion_estribos = value;
    notifyListeners();
  }

  set mm_seccion_espesor_muro(double value) {
    _mm_seccion_espesor_muro = value;
    notifyListeners();
  }

  // Otros daños
  set numero_columnas_dano_severo(double value) {
    _numero_columnas_dano_severo = value;
    notifyListeners();
  }

  set total_columnas_entrepiso(double value) {
    _total_columnas_entrepiso = value;
    notifyListeners();
  }

  set de_colapso_total(bool value) {
    _de_colapso_total = value;
    notifyListeners();
  }

  set de_dano_severo(bool value) {
    _de_dano_severo = value;
    notifyListeners();
  }

  set de_dano_medio(bool value) {
    _de_dano_medio = value;
    notifyListeners();
  }

  set de_dano_ligero(bool value) {
    _de_dano_ligero = value;
    notifyListeners();
  }

  set od_vidrios(bool value) {
    _od_vidrios = value;
    notifyListeners();
  }

  set od_acabados(bool value) {
    _od_acabados = value;
    notifyListeners();
  }

  set od_plafones(bool value) {
    _od_plafones = value;
    notifyListeners();
  }

  set od_fachadas(bool value) {
    _od_fachadas = value;
    notifyListeners();
  }

  set od_Bardas(bool value) {
    _od_Bardas = value;
    notifyListeners();
  }

  set od_instalaciones(bool value) {
    _od_instalaciones = value;
    notifyListeners();
  }

  set od_cubos(bool value) {
    _od_cubos = value;
    notifyListeners();
  }

  set tipo_dano_general(String value) {
    _tipo_dano_general = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formFormatoGeneralKey.currentState?.validate() ?? false;
  }

  void guardaFormatoGeneral(FormatoGeneralModel nuevoFormatoGeneral) {
    DBProvider.db.nuevoFormatoGeneral(nuevoFormatoGeneral);
    notifyListeners();
  }

  void editaFormatoGeneral(FormatoGeneralModel formatoGeneral) {
    DBProvider.db.actualizarFormatoGeneral(formatoGeneral);
    notifyListeners();
  }


  void resetea() {
    formFormatoGeneralKey.currentState?.reset();
    fecha = '';
    n = 0.0;
    o = 0.0;
    msnm = 0.0;
    nombre_inmueble = '';
    calle_numero = '';
    colonia = '';
    codigo_postal = '';
    pueblo_ciudad = '';
    referencias = '';
    telefono = '';
    propietario = '';
    vivienda = false;
    hospital = false;
    oficinas = false;
    iglesia = false;
    comercio = false;
    escuela = false;
    reunion_cine_estadio = false;
    desocupada = false;
    planicie = false;
    ladera_cerro = false;
    rivera_rio_lago = false;
    fondo_valle = false;
    costa = false;
    depositos_lacustres = false;
    marcos_acero_1 = false;
    marcos_concreto_1 = false;
    columnas_losa_plana_1 = false;
    muros_carga_mamposteria_1 = false;
    marcos_muros_diafragma_1 = false;
    uso_contravientos_1 = false;
    muros_adobe_bahareque = false;
    muros_madera_lamina_otros = false;
    marcos_acero_2 = false;
    marcos_concreto_2 = false;
    columnas_losa_plana_2 = false;
    muros_carga_mamposteria_2 = false;
    marcos_muros_diafragma_2 = false;
    uso_contravientos_2 = false;
    muros_adobe_bahareque_2 = false;
    muros_madera_lamina_otros_2 = false;
    confinada = false;
    refuerzo_interior = false;
    bloque_concreto = false;
    tabique_hueco_arcilla = false;
    tabicon_concreto = false;
    simple = false;
    losa_maciza = false;
    losa_reticular = false;
    vigueta_bovedilla = false;
    no_se_sabe_sistema_piso = false;
    igual_al_del_piso = false;
    lamina = false;
    teja = false;
    zapatas_aisladas = false;
    zapatas_corridas = false;
    cimiento_piedra = false;
    losa_cimentacion = false;
    pilotes_pilas = false;
    cajon = false;
    no_se_sabe_cimentacion = false;
    esquina = false;
    medio = false;
    frente_calle = false;
    frente_predio = false;
    frente_parque = false;
    frente_corriente = false;
    frente_barranca = false;
    aislado = false;
    asimetria_muro_cubos_cargas = false;
    grandes_aberturas = false;
    geometria_irregular_planta = false;
    planta_baja_doble_altura = false;
    muros_no_llegan_cimentacion = false;
    planta_baja_flexible = false;
    columna_corta = false;
    grandes_masas_pisos_superiores = false;
    reduccion_brusca_pisos_superiores = false;
    grietas_terreno = false;
    hundimientos = false;
    colapso_losas = false;
    falla_conexiones = false;
    col_colapso = false;
    col_grietas_cortante = false;
    col_grietas_flexion = false;
    col_aplastamiento = false;
    col_pandeo_barras = false;
    col_pandeo_placas = false;
    col_falla_soldadura = false;
    trabes_colapso = false;
    trabes_grietas_cortante = false;
    trabes_grietas_flexion = false;
    trabes_aplastamiento = false;
    trabes_pandeo_barras = false;
    trabes_pandeo_placas = false;
    trabes_falla_soldadura = false;
    mc_colapso = false;
    mc_grietas_cortante = false;
    mc_grietas_flexion = false;
    mc_aplastamiento = false;
    mc_pandeo_barras = false;
    mc_pandeo_placas = false;
    mc_falla_soldadura = false;
    mm_colapso = false;
    mm_grietas_cortante = false;
    mm_grietas_flexion = false;
    mm_aplastamiento = false;
    mm_pandeo_barras = false;
    mm_pandeo_placas = false;
    mm_falla_soldadura = false;
    de_colapso_total = false;
    de_dano_severo = false;
    de_dano_medio = false;
    de_dano_ligero = false;
    od_vidrios = false;
    od_acabados = false;
    od_plafones = false;
    od_fachadas = false;
    od_Bardas = false;
    od_instalaciones = false;
    od_cubos = false;
    tipo_dano_general = '';
    notifyListeners();
  }
}
