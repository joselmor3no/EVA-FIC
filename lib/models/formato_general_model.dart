// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

FormatoGeneralModel FormatoGeneralModelFromJson(String str) =>
    FormatoGeneralModel.fromJson(json.decode(str));
String FormatoGeneralModelToJson(FormatoGeneralModel data) =>
    json.encode(data.toJson());

class FormatoGeneralModel {
  FormatoGeneralModel(
      {this.id,
      required this.id_evaluacion,
      required this.consecutivo,
      this.fecha,
      required this.n,
      required this.o,
      required this.msnm,
      required this.nombre_inmueble,
      required this.calle_numero,
      required this.colonia,
      required this.codigo_postal,
      required this.pueblo_ciudad,
      required this.referencias,
      required this.propietario,
      required this.telefono,
      required this.vivienda,
      required this.hospital,
      required this.oficinas,
      required this.iglesia,
      required this.comercio,
      required this.escuela,
      required this.reunion_cine_estadio,
      required this.desocupada,
      required this.niveles,
      required this.sotanos,
      required this.ocupantes,
      required this.frente_x,
      required this.frente_y,
      required this.planicie,
      required this.ladera_cerro,
      required this.rivera_rio_lago,
      required this.fondo_valle,
      required this.costa,
      required this.depositos_lacustres,
      required this.marcos_acero_1,
      required this.marcos_concreto_1,
      required this.columnas_losa_plana_1,
      required this.muros_carga_mamposteria_1,
      required this.marcos_muros_diafragma_1,
      required this.uso_contravientos_1,
      required this.muros_adobe_bahareque,
      required this.muros_madera_lamina_otros,
      required this.marcos_acero_2,
      required this.marcos_concreto_2,
      required this.columnas_losa_plana_2,
      required this.muros_carga_mamposteria_2,
      required this.marcos_muros_diafragma_2,
      required this.uso_contravientos_2,
      required this.muros_adobe_bahareque_2,
      required this.muros_madera_lamina_otros_2,
      required this.confinada,
      required this.refuerzo_interior,
      required this.bloque_concreto,
      required this.tabique_hueco_arcilla,
      required this.tabicon_concreto,
      required this.simple,
      required this.losa_maciza,
      required this.losa_reticular,
      required this.vigueta_bovedilla,
      required this.no_se_sabe_sistema_piso,
      required this.igual_al_del_piso,
      required this.lamina,
      required this.teja,
      required this.otro_sistema_techo,
      required this.zapatas_aisladas,
      required this.zapatas_corridas,
      required this.cimiento_piedra,
      required this.losa_cimentacion,
      required this.pilotes_pilas,
      required this.cajon,
      required this.no_se_sabe_cimentacion,
      required this.esquina,
      required this.medio,
      required this.frente_calle,
      required this.frente_predio,
      required this.frente_parque,
      required this.frente_corriente,
      required this.frente_barranca,
      required this.aislado,
      required this.asimetria_muro_cubos_cargas,
      required this.grandes_aberturas,
      required this.geometria_irregular_planta,
      required this.planta_baja_doble_altura,
      required this.muros_no_llegan_cimentacion,
      required this.planta_baja_flexible,
      required this.columna_corta,
      required this.grandes_masas_pisos_superiores,
      required this.reduccion_brusca_pisos_superiores,
      required this.separacion_edif_vecino,
      required this.grietas_terreno,
      required this.hundimientos,
      required this.inclinacion_edificio,
      required this.colapso_losas,
      required this.grietas_max,
      required this.flechas_max,
      required this.falla_conexiones,
      required this.col_colapso,
      required this.col_grietas_cortante,
      required this.col_grietas_flexion,
      required this.col_aplastamiento,
      required this.col_pandeo_barras,
      required this.col_pandeo_placas,
      required this.col_falla_soldadura,
      required this.col_ancho_max_grieta,
      required this.col_separacion_estribos,
      required this.col_seccion_espesor_muro,
      required this.trabes_colapso,
      required this.trabes_grietas_cortante,
      required this.trabes_grietas_flexion,
      required this.trabes_aplastamiento,
      required this.trabes_pandeo_barras,
      required this.trabes_pandeo_placas,
      required this.trabes_falla_soldadura,
      required this.trabes_ancho_max_grieta,
      required this.trabes_separacion_estribos,
      required this.trabes_seccion_espesor_muro,
      required this.mc_colapso,
      required this.mc_grietas_cortante,
      required this.mc_grietas_flexion,
      required this.mc_aplastamiento,
      required this.mc_pandeo_barras,
      required this.mc_pandeo_placas,
      required this.mc_falla_soldadura,
      required this.mc_ancho_max_grieta,
      required this.mc_separacion_estribos,
      required this.mc_seccion_espesor_muro,
      required this.mm_colapso,
      required this.mm_grietas_cortante,
      required this.mm_grietas_flexion,
      required this.mm_aplastamiento,
      required this.mm_pandeo_barras,
      required this.mm_pandeo_placas,
      required this.mm_falla_soldadura,
      required this.mm_ancho_max_grieta,
      required this.mm_separacion_estribos,
      required this.mm_seccion_espesor_muro,
      required this.numero_columnas_dano_severo,
      required this.total_columnas_entrepiso,
      required this.de_colapso_total,
      required this.de_dano_severo,
      required this.de_dano_medio,
      required this.de_dano_ligero,
      required this.od_vidrios,
      required this.od_acabados,
      required this.od_plafones,
      required this.od_fachadas,
      required this.od_bardas,
      required this.od_instalaciones,
      required this.od_cubos,
      required this.tipo_dano_general});

  int? id;
  int id_evaluacion;
  int consecutivo;
  String? fecha;
  double n;
  double o;
  double msnm;
  String nombre_inmueble;
  String calle_numero;
  String colonia;
  String codigo_postal;
  String pueblo_ciudad;
  String referencias;
  String propietario;
  String telefono;
  bool vivienda;
  bool hospital;
  bool oficinas;
  bool iglesia;
  bool comercio;
  bool escuela;
  bool reunion_cine_estadio;
  bool desocupada;
  int niveles;
  int sotanos;
  int ocupantes;
  double frente_x;
  double frente_y;
  bool planicie;
  bool ladera_cerro;
  bool rivera_rio_lago;
  bool fondo_valle;
  bool costa;
  bool depositos_lacustres;
  bool marcos_acero_1;
  bool marcos_concreto_1;
  bool columnas_losa_plana_1;
  bool muros_carga_mamposteria_1;
  bool marcos_muros_diafragma_1;
  bool uso_contravientos_1;
  bool muros_adobe_bahareque;
  bool muros_madera_lamina_otros;
  bool marcos_acero_2;
  bool marcos_concreto_2;
  bool columnas_losa_plana_2;
  bool muros_carga_mamposteria_2;
  bool marcos_muros_diafragma_2;
  bool uso_contravientos_2;
  bool muros_adobe_bahareque_2;
  bool muros_madera_lamina_otros_2;
  bool confinada;
  bool refuerzo_interior;
  bool bloque_concreto;
  bool tabique_hueco_arcilla;
  bool tabicon_concreto;
  bool simple;
  bool losa_maciza;
  bool losa_reticular;
  bool vigueta_bovedilla;
  bool no_se_sabe_sistema_piso;
  bool igual_al_del_piso;
  bool lamina;
  bool teja;
  String otro_sistema_techo;
  bool zapatas_aisladas;
  bool zapatas_corridas;
  bool cimiento_piedra;
  bool losa_cimentacion;
  bool pilotes_pilas;
  bool cajon;
  bool no_se_sabe_cimentacion;
  bool esquina;
  bool medio;
  bool frente_calle;
  bool frente_predio;
  bool frente_parque;
  bool frente_corriente;
  bool frente_barranca;
  bool aislado;
  bool asimetria_muro_cubos_cargas;
  bool grandes_aberturas;
  bool geometria_irregular_planta;
  bool planta_baja_doble_altura;
  bool muros_no_llegan_cimentacion;
  bool planta_baja_flexible;
  bool columna_corta;
  bool grandes_masas_pisos_superiores;
  bool reduccion_brusca_pisos_superiores;
  double separacion_edif_vecino;
  bool grietas_terreno;
  bool hundimientos;
  double inclinacion_edificio;
  bool colapso_losas;
  double grietas_max;
  double flechas_max;
  bool falla_conexiones;
  bool col_colapso;
  bool col_grietas_cortante;
  bool col_grietas_flexion;
  bool col_aplastamiento;
  bool col_pandeo_barras;
  bool col_pandeo_placas;
  bool col_falla_soldadura;
  double col_ancho_max_grieta;
  double col_separacion_estribos;
  double col_seccion_espesor_muro;
  bool trabes_colapso;
  bool trabes_grietas_cortante;
  bool trabes_grietas_flexion;
  bool trabes_aplastamiento;
  bool trabes_pandeo_barras;
  bool trabes_pandeo_placas;
  bool trabes_falla_soldadura;
  double trabes_ancho_max_grieta;
  double trabes_separacion_estribos;
  double trabes_seccion_espesor_muro;
  bool mc_colapso;
  bool mc_grietas_cortante;
  bool mc_grietas_flexion;
  bool mc_aplastamiento;
  bool mc_pandeo_barras;
  bool mc_pandeo_placas;
  bool mc_falla_soldadura;
  double mc_ancho_max_grieta;
  double mc_separacion_estribos;
  double mc_seccion_espesor_muro;
  bool mm_colapso;
  bool mm_grietas_cortante;
  bool mm_grietas_flexion;
  bool mm_aplastamiento;
  bool mm_pandeo_barras;
  bool mm_pandeo_placas;
  bool mm_falla_soldadura;
  double mm_ancho_max_grieta;
  double mm_separacion_estribos;
  double mm_seccion_espesor_muro;
  double numero_columnas_dano_severo;
  double total_columnas_entrepiso;
  bool de_colapso_total;
  bool de_dano_severo;
  bool de_dano_medio;
  bool de_dano_ligero;
  bool od_vidrios;
  bool od_acabados;
  bool od_plafones;
  bool od_fachadas;
  bool od_bardas;
  bool od_instalaciones;
  bool od_cubos;
  String tipo_dano_general;

  factory FormatoGeneralModel.fromJson(Map<String, dynamic> json) =>
      FormatoGeneralModel(
          id: json["id"],
          id_evaluacion: json["id_evaluacion"],
          consecutivo: json["consecutivo"],
          fecha: json["fecha"],
          n: double.parse(json["n"].toString()),
          o: double.parse(json["o"].toString()),
          msnm:double.parse( json["msnm"].toString()),
          nombre_inmueble: json["nombre_inmueble"],
          calle_numero: json["calle_numero"],
          colonia: json["colonia"],
          codigo_postal: json["codigo_postal"],
          pueblo_ciudad: json["pueblo_ciudad"],
          referencias: json["referencias"],
          telefono: json["telefono"].toString(),
          propietario: json["propietario"],
          vivienda: json["vivienda"]!=0,
          hospital: json["hospital"]!=0,
          oficinas: json["oficinas"]!=0,
          iglesia: json["iglesia"]!=0,
          comercio: json["comercio"]!=0,
          escuela: json["escuela"]!=0,
          reunion_cine_estadio: json["reunion_cine_estadio"]!=0,
          desocupada: json["desocupada"]!=0,
          niveles: json["niveles"],
          sotanos: json["sotanos"],
          ocupantes: json["ocupantes"],
          frente_x: double.parse(json["frente_x"].toString()),
          frente_y: double.parse(json["frente_y"].toString()),
          planicie: json["planicie"]!=0,
          ladera_cerro: json["ladera_cerro"]!=0,
          rivera_rio_lago: json["rivera_rio_lago"]!=0,
          fondo_valle: json["fondo_valle"]!=0,
          costa: json["costa"]!=0,
          depositos_lacustres: json["depositos_lacustres"]!=0,
          marcos_acero_1: json["marcos_acero_1"]!=0,
          marcos_concreto_1: json["marcos_concreto_1"]!=0,
          columnas_losa_plana_1: json["columnas_losa_plana_1"]!=0,
          muros_carga_mamposteria_1: json["muros_carga_mamposteria_1"]!=0,
          marcos_muros_diafragma_1: json["marcos_muros_diafragma_1"]!=0,
          uso_contravientos_1: json["uso_contravientos_1"]!=0,
          muros_adobe_bahareque: json["muros_adobe_bahareque"]!=0,
          muros_madera_lamina_otros: json["muros_madera_lamina_otros"]!=0,
          marcos_acero_2: json["marcos_acero_2"]!=0,
          marcos_concreto_2: json["marcos_concreto_2"]!=0,
          columnas_losa_plana_2: json["columnas_losa_plana_2"]!=0,
          muros_carga_mamposteria_2: json["muros_carga_mamposteria_2"]!=0,
          marcos_muros_diafragma_2: json["marcos_muros_diafragma_2"]!=0,
          uso_contravientos_2: json["uso_contravientos_2"]!=0,
          muros_adobe_bahareque_2: json["muros_adobe_bahareque_2"]!=0,
          muros_madera_lamina_otros_2: json["muros_madera_lamina_otros_2"]!=0,
          confinada: json["confinada"]!=0,
          refuerzo_interior: json["refuerzo_interior"]!=0,
          bloque_concreto: json["bloque_concreto"]!=0,
          tabique_hueco_arcilla: json["tabique_hueco_arcilla"]!=0,
          tabicon_concreto: json["tabicon_concreto"]!=0,
          simple: json["simple"]!=0,
          losa_maciza: json["losa_maciza"]!=0,
          losa_reticular: json["losa_reticular"]!=0,
          vigueta_bovedilla: json["vigueta_bovedilla"]!=0,
          no_se_sabe_sistema_piso: json["no_se_sabe_sistema_piso"]!=0,
          igual_al_del_piso: json["igual_al_del_piso"]!=0,
          lamina: json["lamina"]!=0,
          teja: json["teja"]!=0,
          otro_sistema_techo: json["otro_sistema_techo"],
          zapatas_aisladas: json["zapatas_aisladas"]!=0,
          zapatas_corridas: json["zapatas_corridas"]!=0,
          cimiento_piedra: json["cimiento_piedra"]!=0,
          losa_cimentacion: json["losa_cimentacion"]!=0,
          pilotes_pilas: json["pilotes_pilas"]!=0,
          cajon: json["cajon"]!=0,
          no_se_sabe_cimentacion: json["no_se_sabe_cimentacion"]!=0,
          esquina: json["esquina"]!=0,
          medio: json["medio"]!=0,
          frente_calle: json["frente_calle"]!=0,
          frente_predio: json["frente_predio"]!=0,
          frente_parque: json["frente_parque"]!=0,
          frente_corriente: json["frente_corriente"]!=0,
          frente_barranca: json["frente_barranca"]!=0,
          aislado: json["aislado"]!=0,
          asimetria_muro_cubos_cargas: json["asimetria_muro_cubos_cargas"]!=0,
          grandes_aberturas: json["grandes_aberturas"]!=0,
          geometria_irregular_planta: json["geometria_irregular_planta"]!=0,
          planta_baja_doble_altura: json["planta_baja_doble_altura"]!=0,
          muros_no_llegan_cimentacion: json["muros_no_llegan_cimentacion"]!=0,
          planta_baja_flexible: json["planta_baja_flexible"]!=0,
          columna_corta: json["columna_corta"]!=0,
          grandes_masas_pisos_superiores:
              json["grandes_masas_pisos_superiores"]!=0,
          reduccion_brusca_pisos_superiores:
              json["reduccion_brusca_pisos_superiores"]!=0,
          separacion_edif_vecino: double.parse(json["separacion_edif_vecino"].toString()),
          grietas_terreno: json["grietas_terreno"]!=0,
          hundimientos: json["hundimientos"]!=0,
          inclinacion_edificio: double.parse(json["inclinacion_edificio"].toString()),
          colapso_losas: json["colapso_losas"]!=0,
          grietas_max: double.parse(json["grietas_max"].toString()),
          flechas_max: double.parse(json["flechas_max"].toString()),
          falla_conexiones: json["falla_conexiones"]!=0,
          col_colapso: json["col_colapso"]!=0,
          col_grietas_cortante: json["col_grietas_cortante"]!=0,
          col_grietas_flexion: json["col_grietas_flexion"]!=0,
          col_aplastamiento: json["col_aplastamiento"]!=0,
          col_pandeo_barras: json["col_pandeo_barras"]!=0,
          col_pandeo_placas: json["col_pandeo_placas"]!=0,
          col_falla_soldadura: json["col_falla_soldadura"]!=0,
          col_ancho_max_grieta: double.parse(json["col_ancho_max_grieta"].toString()),
          col_separacion_estribos: double.parse(json["col_separacion_estribos"].toString()),
          col_seccion_espesor_muro: double.parse(json["col_seccion_espesor_muro"].toString()),
          trabes_colapso: json["trabes_colapso"]!=0,
          trabes_grietas_cortante: json["trabes_grietas_cortante"]!=0,
          trabes_grietas_flexion: json["trabes_grietas_flexion"]!=0,
          trabes_aplastamiento: json["trabes_aplastamiento"]!=0,
          trabes_pandeo_barras: json["trabes_pandeo_barras"]!=0,
          trabes_pandeo_placas: json["trabes_pandeo_placas"]!=0,
          trabes_falla_soldadura: json["trabes_falla_soldadura"]!=0,
          trabes_ancho_max_grieta: double.parse(json["trabes_ancho_max_grieta"].toString()),
          trabes_separacion_estribos: double.parse(json["trabes_separacion_estribos"].toString()),
          trabes_seccion_espesor_muro: double.parse(json["trabes_seccion_espesor_muro"].toString()),
          mc_colapso: json["mc_colapso"]!=0,
          mc_grietas_cortante: json["mc_grietas_cortante"]!=0,
          mc_grietas_flexion: json["mc_grietas_flexion"]!=0,
          mc_aplastamiento: json["mc_aplastamiento"]!=0,
          mc_pandeo_barras: json["mc_pandeo_barras"]!=0,
          mc_pandeo_placas: json["mc_pandeo_placas"]!=0,
          mc_falla_soldadura: json["mc_falla_soldadura"]!=0,
          mc_ancho_max_grieta: double.parse(json["mc_ancho_max_grieta"].toString()),
          mc_separacion_estribos: double.parse(json["mc_separacion_estribos"].toString()),
          mc_seccion_espesor_muro: double.parse(json["mc_seccion_espesor_muro"].toString()),
          mm_colapso: json["mm_colapso"]!=0,
          mm_grietas_cortante: json["mm_grietas_cortante"]!=0,
          mm_grietas_flexion: json["mm_grietas_flexion"]!=0,
          mm_aplastamiento: json["mm_aplastamiento"]!=0,
          mm_pandeo_barras: json["mm_pandeo_barras"]!=0,
          mm_pandeo_placas: json["mm_pandeo_placas"]!=0,
          mm_falla_soldadura: json["mm_falla_soldadura"]!=0,
          mm_ancho_max_grieta: double.parse(json["mm_ancho_max_grieta"].toString()),
          mm_separacion_estribos: double.parse(json["mm_separacion_estribos"].toString()),
          mm_seccion_espesor_muro: double.parse(json["mm_seccion_espesor_muro"].toString()),
          numero_columnas_dano_severo: double.parse(json["numero_columnas_dano_severo"].toString()),
          total_columnas_entrepiso: double.parse(json["total_columnas_entrepiso"].toString()),
          de_colapso_total: json["de_colapso_total"]!=0,
          de_dano_severo: json["de_dano_severo"]!=0,
          de_dano_medio: json["de_dano_medio"]!=0,
          de_dano_ligero: json["de_dano_ligero"]!=0,
          od_vidrios: json["od_vidrios"]!=0,
          od_acabados: json["od_acabados"]!=0,
          od_plafones: json["od_plafones"]!=0,
          od_fachadas: json["od_fachadas"]!=0,
          od_bardas: json["od_bardas"]!=0,
          od_instalaciones: json["od_instalaciones"]!=0,
          od_cubos: json["od_cubos"]!=0,
          tipo_dano_general: json["tipo_dano_general"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_evaluacion": id_evaluacion,
        "consecutivo": consecutivo,
        "fecha": fecha,
        "n": n,
        "o": o,
        "msnm": msnm,
        "nombre_inmueble": nombre_inmueble,
        "calle_numero": calle_numero,
        "colonia": colonia,
        "codigo_postal": codigo_postal,
        "pueblo_ciudad": pueblo_ciudad,
        "referencias": referencias,
        "propietario": propietario,
        "telefono": telefono,
        "vivienda": vivienda,
        "hospital": hospital,
        "oficinas": oficinas,
        "iglesia": iglesia,
        "comercio": comercio,
        "escuela": escuela,
        "reunion_cine_estadio": reunion_cine_estadio,
        "desocupada": desocupada,
        "niveles": niveles,
        "sotanos": sotanos,
        "ocupantes": ocupantes,
        "frente_x": frente_x,
        "frente_y": frente_y,
        "planicie": planicie,
        "ladera_cerro": ladera_cerro,
        "rivera_rio_lago": rivera_rio_lago,
        "fondo_valle": fondo_valle,
        "costa": costa,
        "depositos_lacustres": depositos_lacustres,
        "marcos_acero_1": marcos_acero_1,
        "marcos_concreto_1": marcos_concreto_1,
        "columnas_losa_plana_1": columnas_losa_plana_1,
        "muros_carga_mamposteria_1": muros_carga_mamposteria_1,
        "marcos_muros_diafragma_1": marcos_muros_diafragma_1,
        "uso_contravientos_1": uso_contravientos_1,
        "muros_adobe_bahareque": muros_adobe_bahareque,
        "muros_madera_lamina_otros": muros_madera_lamina_otros,
        "marcos_acero_2": marcos_acero_2,
        "marcos_concreto_2": marcos_concreto_2,
        "columnas_losa_plana_2": columnas_losa_plana_2,
        "muros_carga_mamposteria_2": muros_carga_mamposteria_2,
        "marcos_muros_diafragma_2": marcos_muros_diafragma_2,
        "uso_contravientos_2": uso_contravientos_2,
        "muros_adobe_bahareque_2": muros_adobe_bahareque_2,
        "muros_madera_lamina_otros_2": muros_madera_lamina_otros_2,
        "confinada": confinada,
        "refuerzo_interior": refuerzo_interior,
        "bloque_concreto": bloque_concreto,
        "tabique_hueco_arcilla": tabique_hueco_arcilla,
        "tabicon_concreto": tabicon_concreto,
        "simple": simple,
        "losa_maciza": losa_maciza,
        "losa_reticular": losa_reticular,
        "vigueta_bovedilla": vigueta_bovedilla,
        "no_se_sabe_sistema_piso ": no_se_sabe_sistema_piso,
        "igual_al_del_piso": igual_al_del_piso,
        "lamina": lamina,
        "teja": teja,
        "otro_sistema_techo ": otro_sistema_techo,
        "zapatas_aisladas ": zapatas_aisladas,
        "zapatas_corridas": zapatas_corridas,
        "cimiento_piedra": cimiento_piedra,
        "losa_cimentacion": losa_cimentacion,
        "pilotes_pilas": pilotes_pilas,
        "cajon": cajon,
        "no_se_sabe_cimentacion": no_se_sabe_cimentacion,
        "esquina": esquina,
        "medio": medio,
        "frente_calle": frente_calle,
        "frente_predio": frente_predio,
        "frente_parque": frente_parque,
        "frente_corriente": frente_corriente,
        "frente_barranca": frente_barranca,
        "aislado": aislado,
        "asimetria_muro_cubos_cargas": asimetria_muro_cubos_cargas,
        "grandes_aberturas": grandes_aberturas,
        "geometria_irregular_planta": geometria_irregular_planta,
        "planta_baja_doble_altura": planta_baja_doble_altura,
        "muros_no_llegan_cimentacion": muros_no_llegan_cimentacion,
        "planta_baja_flexible": planta_baja_flexible,
        "columna_corta": columna_corta,
        "grandes_masas_pisos_superiores": grandes_masas_pisos_superiores,
        "reduccion_brusca_pisos_superiores": reduccion_brusca_pisos_superiores,
        "separacion_edif_vecino": separacion_edif_vecino,
        "grietas_terreno": grietas_terreno,
        "hundimientos": hundimientos,
        "inclinacion_edificio": inclinacion_edificio,
        "colapso_losas": colapso_losas,
        "grietas_max": grietas_max,
        "flechas_max": flechas_max,
        "falla_conexiones": falla_conexiones,
        "col_colapso": col_colapso,
        "col_grietas_cortante": col_grietas_cortante,
        "col_grietas_flexion": col_grietas_flexion,
        "col_aplastamiento": col_aplastamiento,
        "col_pandeo_barras": col_pandeo_barras,
        "col_pandeo_placas": col_pandeo_placas,
        "col_falla_soldadura": col_falla_soldadura,
        "col_ancho_max_grieta": col_ancho_max_grieta,
        "col_separacion_estribos": col_separacion_estribos,
        "col_seccion_espesor_muro": col_seccion_espesor_muro,
        "trabes_colapso": trabes_colapso,
        "trabes_grietas_cortante": trabes_grietas_cortante,
        "trabes_grietas_flexion": trabes_grietas_flexion,
        "trabes_aplastamiento": trabes_aplastamiento,
        "trabes_pandeo_barras": trabes_pandeo_barras,
        "trabes_pandeo_placas": trabes_pandeo_placas,
        "trabes_falla_soldadura": trabes_falla_soldadura,
        "trabes_ancho_max_grieta": trabes_ancho_max_grieta,
        "trabes_separacion_estribos": trabes_separacion_estribos,
        "trabes_seccion_espesor_muro": trabes_seccion_espesor_muro,
        "mc_colapso": mc_colapso,
        "mc_grietas_cortante": mc_grietas_cortante,
        "mc_grietas_flexion": mc_grietas_flexion,
        "mc_aplastamiento": mc_aplastamiento,
        "mc_pandeo_barras": mc_pandeo_barras,
        "mc_pandeo_placas": mc_pandeo_placas,
        "mc_falla_soldadura": mc_falla_soldadura,
        "mc_ancho_max_grieta": mc_ancho_max_grieta,
        "mc_separacion_estribos": mc_separacion_estribos,
        "mc_seccion_espesor_muro": mc_seccion_espesor_muro,
        "mm_colapso": mm_colapso,
        "mm_grietas_cortante": mm_grietas_cortante,
        "mm_grietas_flexion": mm_grietas_flexion,
        "mm_aplastamiento": mm_aplastamiento,
        "mm_pandeo_barras": mm_pandeo_barras,
        "mm_pandeo_placas": mm_pandeo_placas,
        "mm_falla_soldadura": mm_falla_soldadura,
        "mm_ancho_max_grieta": mm_ancho_max_grieta,
        "mm_separacion_estribos": mm_separacion_estribos,
        "mm_seccion_espesor_muro": mm_seccion_espesor_muro,
        "numero_columnas_dano_severo": numero_columnas_dano_severo,
        "total_columnas_entrepiso": total_columnas_entrepiso,
        "de_colapso_total": de_colapso_total,
        "de_dano_severo": de_dano_severo,
        "de_dano_medio": de_dano_medio,
        "de_dano_ligero": de_dano_ligero,
        "od_vidrios": od_vidrios,
        "od_acabados": od_acabados,
        "od_plafones": od_plafones,
        "od_fachadas": od_fachadas,
        "od_bardas": od_bardas,
        "od_instalaciones": od_instalaciones,
        "od_cubos": od_cubos,
        "tipo_dano_general": tipo_dano_general
      };

    FormatoGeneralModel crearInstanciaVacia() {
      return FormatoGeneralModel(
      id: null,
      id_evaluacion: 0,
      consecutivo: 0,
      fecha: null,
      n: 0.0,
      o: 0.0,
      msnm: 0.0,
      nombre_inmueble: '',
      calle_numero: '',
      colonia: '',
      codigo_postal: '',
      pueblo_ciudad: '',
      referencias: '',
      propietario: '',
      telefono: '',
      vivienda: false,
      hospital: false,
      oficinas: false,
      iglesia: false,
      comercio: false,
      escuela: false,
      reunion_cine_estadio: false,
      desocupada: false,
      niveles: 0,
      sotanos: 0,
      ocupantes: 0,
      frente_x: 0,
      frente_y: 0,
      planicie: false,
      ladera_cerro: false,
      rivera_rio_lago: false,
      fondo_valle: false,
      costa: false,
      depositos_lacustres: false,
      marcos_acero_1: false,
      marcos_concreto_1: false,
      columnas_losa_plana_1: false,
      muros_carga_mamposteria_1: false,
      marcos_muros_diafragma_1: false,
      uso_contravientos_1: false,
      muros_adobe_bahareque: false,
      muros_madera_lamina_otros: false,
      marcos_acero_2: false,
      marcos_concreto_2: false,
      columnas_losa_plana_2: false,
      muros_carga_mamposteria_2: false,
      marcos_muros_diafragma_2: false,
      uso_contravientos_2: false,
      muros_adobe_bahareque_2: false,
      muros_madera_lamina_otros_2: false,
      confinada: false,
      refuerzo_interior: false,
      bloque_concreto: false,
      tabique_hueco_arcilla: false,
      tabicon_concreto: false,
      simple: false,
      losa_maciza: false,
      losa_reticular: false,
      vigueta_bovedilla: false,
      no_se_sabe_sistema_piso : false,
      igual_al_del_piso: false,
      lamina: false,
      teja: false,
      otro_sistema_techo : '',
      zapatas_aisladas : false,
      zapatas_corridas: false,
      cimiento_piedra: false,
      losa_cimentacion: false,
      pilotes_pilas: false,
      cajon: false,
      no_se_sabe_cimentacion: false,
      esquina: false,
      medio: false,
      frente_calle: false,
      frente_predio: false,
      frente_parque: false,
      frente_corriente: false,
      frente_barranca: false,
      aislado: false,
      asimetria_muro_cubos_cargas: false,
      grandes_aberturas: false,
      geometria_irregular_planta: false,
      planta_baja_doble_altura: false,
      muros_no_llegan_cimentacion: false,
      planta_baja_flexible: false,
      columna_corta: false,
      grandes_masas_pisos_superiores: false,
      reduccion_brusca_pisos_superiores: false,
      separacion_edif_vecino: 0,
      grietas_terreno: false,
      hundimientos: false,
      inclinacion_edificio: 0,
      colapso_losas: false,
      grietas_max: 0,
      flechas_max: 0,
      falla_conexiones: false,
      col_colapso: false,
      col_grietas_cortante: false,
      col_grietas_flexion: false,
      col_aplastamiento: false,
      col_pandeo_barras: false,
      col_pandeo_placas: false,
      col_falla_soldadura: false,
      col_ancho_max_grieta: 0,
      col_separacion_estribos: 0,
      col_seccion_espesor_muro: 0,
      trabes_colapso: false,
      trabes_grietas_cortante: false,
      trabes_grietas_flexion: false,
      trabes_aplastamiento: false,
      trabes_pandeo_barras: false,
      trabes_pandeo_placas: false,
      trabes_falla_soldadura: false,
      trabes_ancho_max_grieta: 0,
      trabes_separacion_estribos: 0,
      trabes_seccion_espesor_muro: 0,
      mc_colapso: false,
      mc_grietas_cortante: false,
      mc_grietas_flexion: false,
      mc_aplastamiento: false,
      mc_pandeo_barras: false,
      mc_pandeo_placas: false,
      mc_falla_soldadura: false,
      mc_ancho_max_grieta: 0,
      mc_separacion_estribos: 0,
      mc_seccion_espesor_muro: 0,
      mm_colapso: false,
      mm_grietas_cortante: false,
      mm_grietas_flexion: false,
      mm_aplastamiento: false,
      mm_pandeo_barras: false,
      mm_pandeo_placas: false,
      mm_falla_soldadura: false,
      mm_ancho_max_grieta: 0,
      mm_separacion_estribos: 0,
      mm_seccion_espesor_muro: 0,
      numero_columnas_dano_severo: 0,
      total_columnas_entrepiso: 0,
      de_colapso_total: false,
      de_dano_severo: false,
      de_dano_medio: false,
      de_dano_ligero: false,
      od_vidrios: false,
      od_acabados: false,
      od_plafones: false,
      od_fachadas: false,
      od_bardas: false,
      od_instalaciones: false,
      od_cubos: false,
      tipo_dano_general: ''
    );
  }
}