import 'package:eva_fic_umich2024/models/formato_general_model.dart';
import 'package:eva_fic_umich2024/models/levantamientos_model.dart';
import 'package:eva_fic_umich2024/providers/imagenes_fg_provider.dart';
import 'package:eva_fic_umich2024/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class ListaFormatosScreen extends StatelessWidget {
  const ListaFormatosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatosGeneralesProvider = Provider.of<FormatosProvider>(context);
    final imagenesProvider = Provider.of<ImagenesFGProvider>(context);
    final achoPantalla = MediaQuery.of(context).size.width;
    final LevantamientosModel levantamiento =
        ModalRoute.of(context)?.settings.arguments as LevantamientosModel;

    List<FormatoGeneralModel> generales =
        formatosGeneralesProvider.formatosGenerales;

    final FormatoGeneralModel formatoVacio = crearInstanciaVacia();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text('Formatos ${levantamiento.nombre}'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: achoPantalla,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'formato_general',
                                arguments: {
                                  'levantamiento': levantamiento,
                                  'formatoGeneral': formatoVacio,
                                  'tipo': 'nuevo'
                                });
                          },
                          child: const CardFormatos(
                              nombre: 'General', imagen: Icons.note)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'formato_escuela',
                              arguments: {
                                'levantamiento': levantamiento,
                                'formatoGeneral': formatoVacio,
                                'tipo': 'nuevo'
                              });
                        },
                        child: const CardFormatos(
                            nombre: 'Escuela',
                            imagen: Icons.add_business_rounded),
                      ),
                      /*const CardFormatos(
                          nombre: 'Hospital',
                          imagen: Icons.local_hospital_sharp),*/
                    ]),
              ),
            ),
            const Divider(
              height: 30,
              thickness: 2,
              color: Color.fromARGB(255, 17, 155, 235),
            ),
            const Text(
              'Lista de Formatos Creados',
              style:
                  TextStyle(color: Color.fromARGB(255, 5, 3, 36), fontSize: 20),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: generales.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Icon(
                      Icons.note,
                      color: (generales[index].tipo_dano_general == 'verde'
                          ? const Color.fromARGB(255, 11, 177, 75)
                          : generales[index].tipo_dano_general == 'amarillo'
                              ? const Color.fromARGB(255, 194, 194, 24)
                              : const Color.fromARGB(255, 193, 52, 16)),
                      size: 30,
                    ),
                    title: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        'formato_general',
                        arguments: {
                          'levantamiento': levantamiento,
                          'formatoGeneral': generales[index],
                          'tipo': 'editar'
                        },
                      ),
                      child: Text(
                          '${generales[index].consecutivo} -${generales[index].fecha?.substring(0, 18)} - ${generales[index].nombre_inmueble} '),
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        await imagenesProvider
                            .cargarFormatosGenerales(generales[index].id!);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(
                          context,
                          'imagenes_formato_general',
                          arguments: {
                            'levantamiento': levantamiento,
                            'formatoGeneral': generales[index],
                            'listaImagenes': imagenesProvider.imagenesFG,
                          },
                        );
                      },
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 17, 155, 235),
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

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
        no_se_sabe_sistema_piso: false,
        igual_al_del_piso: false,
        lamina: false,
        teja: false,
        otro_sistema_techo: '',
        zapatas_aisladas: false,
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
        tipo_dano_general: '');
  }
}
