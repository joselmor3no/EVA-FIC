import 'package:eva_fic_umich2024/models/formato_general_model.dart';
import 'package:flutter/material.dart';
import 'package:eva_fic_umich2024/providers/db_provider.dart';
import 'package:eva_fic_umich2024/providers/providers.dart';
import 'package:provider/provider.dart';

class FormatoGeneralScreen extends StatelessWidget {
  const FormatoGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    FormatoGeneralModel formatoGeneral =
        arguments['formatoGeneral'] as FormatoGeneralModel;
    final LevantamientosModel levantamiento =
        arguments['levantamiento'] as LevantamientosModel;
    final String tipo = arguments['tipo'] as String;
    final formFormatoGeneral = Provider.of<FormFormatoGeneralProvider>(context);
    final formatosGeneralesProvider = Provider.of<FormatosProvider>(context);

    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formato General'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(2, 40, 2, 0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formFormatoGeneral.formFormatoGeneralKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Información General',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'N'),
                    keyboardType: TextInputType.number,
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.n.toString()
                        : formFormatoGeneral.n.toString(),
                    validator: (value) {
                      return (value != null && value != '')
                          ? null
                          : 'Debe escribir un numero';
                    },
                    onChanged: (value) {
                      if (value != '') {
                        if (tipo == 'editar') {
                          formatoGeneral.n = double.parse(value);
                        }
                        formFormatoGeneral.n = double.parse(value);
                      }
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'O'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.o.toString()
                        : formFormatoGeneral.o.toString(),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return (value != null && value != '')
                          ? null
                          : 'Debe escribir un numero';
                    },
                    onChanged: (value) {
                      if (value != '') {
                        if (tipo == 'editar') {
                          formatoGeneral.o = double.parse(value);
                        }
                        formFormatoGeneral.o = double.parse(value);
                      }
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'msnm'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.msnm.toString()
                        : formFormatoGeneral.msnm.toString(),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return (value != null && value != '')
                          ? null
                          : 'Debe escribir un numero';
                    },
                    onChanged: (value) {
                      if (value != '') {
                        if (tipo == 'editar') {
                          formatoGeneral.msnm = double.parse(value);
                        }
                        formFormatoGeneral.msnm = double.parse(value);
                      }
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: '*Nombre del inmueble'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.nombre_inmueble
                        : formFormatoGeneral.nombre_inmueble,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.nombre_inmueble = value;
                      }
                      formFormatoGeneral.nombre_inmueble = value;
                    },
                    validator: (value) {
                      return (value != null && value != '')
                          ? null
                          : 'Nombre obligatorio';
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Calle y Numero'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.calle_numero
                        : formFormatoGeneral.calle_numero,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.calle_numero = value;
                      }
                      formFormatoGeneral.calle_numero = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Colonia'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.colonia
                        : formFormatoGeneral.colonia,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.colonia = value;
                      }
                      formFormatoGeneral.colonia = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Codigo Postal'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.codigo_postal
                        : formFormatoGeneral.codigo_postal,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.codigo_postal = value;
                      }
                      formFormatoGeneral.codigo_postal = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Pueblo o Ciudad'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.pueblo_ciudad
                        : formFormatoGeneral.pueblo_ciudad,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.pueblo_ciudad = value;
                      }
                      formFormatoGeneral.pueblo_ciudad = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Referencias'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.referencias
                        : formFormatoGeneral.referencias,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.referencias = value;
                      }
                      formFormatoGeneral.referencias = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Telefono'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.telefono
                        : formFormatoGeneral.telefono,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.telefono = value;
                      }
                      formFormatoGeneral.telefono = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Contacto o Propietario'),
                    initialValue: tipo == 'editar'
                        ? formatoGeneral.propietario
                        : formFormatoGeneral.propietario,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.propietario = value;
                      }
                      formFormatoGeneral.propietario = value;
                    },
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Uso',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                          title: const Text('Vivienda'),
                          value: tipo == 'editar'
                              ? formatoGeneral.vivienda
                              : formFormatoGeneral.vivienda,
                          onChanged: (value) {
                            if (tipo == 'editar') {
                              formatoGeneral.vivienda = value;
                            }
                            formFormatoGeneral.vivienda = value;
                          }),
                      SwitchListTile(
                        title: const Text('Hospital'),
                        value: tipo == 'editar'
                            ? formatoGeneral.hospital
                            : formFormatoGeneral.hospital,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.hospital = value;
                          }
                          formFormatoGeneral.hospital = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Oficinas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.oficinas
                            : formFormatoGeneral.oficinas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.oficinas = value;
                          }
                          formFormatoGeneral.oficinas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Iglesia'),
                        value: tipo == 'editar'
                            ? formatoGeneral.iglesia
                            : formFormatoGeneral.iglesia,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.iglesia = value;
                          }
                          formFormatoGeneral.iglesia = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Comercio'),
                        value: tipo == 'editar'
                            ? formatoGeneral.comercio
                            : formFormatoGeneral.comercio,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.comercio = value;
                          }
                          formFormatoGeneral.comercio = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Escuela'),
                        value: tipo == 'editar'
                            ? formatoGeneral.escuela
                            : formFormatoGeneral.escuela,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.escuela = value;
                          }
                          formFormatoGeneral.escuela = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Reunion "cine/estadio"'),
                        value: tipo == 'editar'
                            ? formatoGeneral.reunion_cine_estadio
                            : formFormatoGeneral.reunion_cine_estadio,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.reunion_cine_estadio = value;
                          }
                          formFormatoGeneral.reunion_cine_estadio = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Desocupada'),
                        value: tipo == 'editar'
                            ? formatoGeneral.desocupada
                            : formFormatoGeneral.desocupada,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.desocupada = value;
                          }
                          formFormatoGeneral.desocupada = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Niveles'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.niveles.toString()
                            : formFormatoGeneral.niveles.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.niveles = int.parse(value);
                            }
                            formFormatoGeneral.niveles = int.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Sotanos'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.sotanos.toString()
                            : formFormatoGeneral.sotanos.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.sotanos = int.parse(value);
                            }
                            formFormatoGeneral.sotanos = int.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Ocupantes'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.ocupantes.toString()
                            : formFormatoGeneral.ocupantes.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.ocupantes = int.parse(value);
                            }
                            formFormatoGeneral.ocupantes = int.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Topografía',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Frente X "mts"'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.frente_x.toString()
                            : formFormatoGeneral.frente_x.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.frente_x = double.parse(value);
                            }
                            formFormatoGeneral.frente_x = double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Frente Y "mts"'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.frente_y.toString()
                            : formFormatoGeneral.frente_y.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.frente_y = double.parse(value);
                            }
                            formFormatoGeneral.frente_y = double.parse(value);
                          }
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Planicie'),
                        value: tipo == 'editar'
                            ? formatoGeneral.planicie
                            : formFormatoGeneral.planicie,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.planicie = value;
                          }
                          formFormatoGeneral.planicie = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Ladera de Cerro'),
                        value: tipo == 'editar'
                            ? formatoGeneral.ladera_cerro
                            : formFormatoGeneral.ladera_cerro,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.ladera_cerro = value;
                          }
                          formFormatoGeneral.ladera_cerro = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Rivera rio/lago'),
                        value: tipo == 'editar'
                            ? formatoGeneral.rivera_rio_lago
                            : formFormatoGeneral.rivera_rio_lago,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.rivera_rio_lago = value;
                          }
                          formFormatoGeneral.rivera_rio_lago = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Fondo de valle'),
                        value: tipo == 'editar'
                            ? formatoGeneral.fondo_valle
                            : formFormatoGeneral.fondo_valle,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.fondo_valle = value;
                          }
                          formFormatoGeneral.fondo_valle = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Costa'),
                        value: tipo == 'editar'
                            ? formatoGeneral.costa
                            : formFormatoGeneral.costa,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.costa = value;
                          }
                          formFormatoGeneral.costa = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Depositos lacustres'),
                        value: tipo == 'editar'
                            ? formatoGeneral.depositos_lacustres
                            : formFormatoGeneral.depositos_lacustres,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.depositos_lacustres = value;
                          }
                          formFormatoGeneral.depositos_lacustres = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Dirección X',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Marcos de acero'),
                        value: tipo == 'editar'
                            ? formatoGeneral.marcos_acero_1
                            : formFormatoGeneral.marcos_acero_1,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.marcos_acero_1 = value;
                          }
                          formFormatoGeneral.marcos_acero_1 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Marcos de concreto'),
                        value: tipo == 'editar'
                            ? formatoGeneral.marcos_concreto_1
                            : formFormatoGeneral.marcos_concreto_1,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.marcos_concreto_1 = value;
                          }
                          formFormatoGeneral.marcos_concreto_1 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Columnas y losa plana (sin vigas)'),
                        value: tipo == 'editar'
                            ? formatoGeneral.columnas_losa_plana_1
                            : formFormatoGeneral.columnas_losa_plana_1,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.columnas_losa_plana_1 = value;
                          }
                          formFormatoGeneral.columnas_losa_plana_1 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros de carga de mamposteria'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_carga_mamposteria_1
                            : formFormatoGeneral.muros_carga_mamposteria_1,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_carga_mamposteria_1 = value;
                          }
                          formFormatoGeneral.muros_carga_mamposteria_1 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Marcos y muros diafragma'),
                        value: tipo == 'editar'
                            ? formatoGeneral.marcos_muros_diafragma_1
                            : formFormatoGeneral.marcos_muros_diafragma_1,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.marcos_muros_diafragma_1 = value;
                          }
                          formFormatoGeneral.marcos_muros_diafragma_1 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Uso contravientos'),
                        value: tipo == 'editar'
                            ? formatoGeneral.uso_contravientos_1
                            : formFormatoGeneral.uso_contravientos_1,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.uso_contravientos_1 = value;
                          }
                          formFormatoGeneral.uso_contravientos_1 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros de adobe y bahareque'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_adobe_bahareque
                            : formFormatoGeneral.muros_adobe_bahareque,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_adobe_bahareque = value;
                          }
                          formFormatoGeneral.muros_adobe_bahareque = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros de madera, lamina, otros'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_madera_lamina_otros
                            : formFormatoGeneral.muros_madera_lamina_otros,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_madera_lamina_otros = value;
                          }
                          formFormatoGeneral.muros_madera_lamina_otros = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Dirección Y',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Marcos de acero'),
                        value: tipo == 'editar'
                            ? formatoGeneral.marcos_acero_2
                            : formFormatoGeneral.marcos_acero_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.marcos_acero_2 = value;
                          }
                          formFormatoGeneral.marcos_acero_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Marcos de concreto'),
                        value: tipo == 'editar'
                            ? formatoGeneral.marcos_concreto_2
                            : formFormatoGeneral.marcos_concreto_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.marcos_concreto_2 = value;
                          }
                          formFormatoGeneral.marcos_concreto_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Columnas y losa plana (sin vigas)'),
                        value: tipo == 'editar'
                            ? formatoGeneral.columnas_losa_plana_2
                            : formFormatoGeneral.columnas_losa_plana_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.columnas_losa_plana_2 = value;
                          }
                          formFormatoGeneral.columnas_losa_plana_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros de carga de mamposteria'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_carga_mamposteria_2
                            : formFormatoGeneral.muros_carga_mamposteria_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_carga_mamposteria_2 = value;
                          }
                          formFormatoGeneral.muros_carga_mamposteria_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Marcos y muros diafragma'),
                        value: tipo == 'editar'
                            ? formatoGeneral.marcos_muros_diafragma_2
                            : formFormatoGeneral.marcos_muros_diafragma_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.marcos_muros_diafragma_2 = value;
                          }
                          formFormatoGeneral.marcos_muros_diafragma_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Uso contravientos'),
                        value: tipo == 'editar'
                            ? formatoGeneral.uso_contravientos_2
                            : formFormatoGeneral.uso_contravientos_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.uso_contravientos_2 = value;
                          }
                          formFormatoGeneral.uso_contravientos_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros de adobe y bahareque'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_adobe_bahareque_2
                            : formFormatoGeneral.muros_adobe_bahareque_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_adobe_bahareque_2 = value;
                          }
                          formFormatoGeneral.muros_adobe_bahareque_2 = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros de madera, lamina, otros'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_madera_lamina_otros_2
                            : formFormatoGeneral.muros_madera_lamina_otros_2,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_madera_lamina_otros_2 = value;
                          }
                          formFormatoGeneral.muros_madera_lamina_otros_2 =
                              value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Muros de Mamposteria',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Confinada'),
                        value: tipo == 'editar'
                            ? formatoGeneral.confinada
                            : formFormatoGeneral.confinada,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.confinada = value;
                          }
                          formFormatoGeneral.confinada = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Simple'),
                        value: tipo == 'editar'
                            ? formatoGeneral.simple
                            : formFormatoGeneral.simple,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.simple = value;
                          }
                          formFormatoGeneral.simple = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Refuerzo Interior'),
                        value: tipo == 'editar'
                            ? formatoGeneral.refuerzo_interior
                            : formFormatoGeneral.refuerzo_interior,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.refuerzo_interior = value;
                          }
                          formFormatoGeneral.refuerzo_interior = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Bloque concreto 20x40'),
                        value: tipo == 'editar'
                            ? formatoGeneral.bloque_concreto
                            : formFormatoGeneral.bloque_concreto,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.bloque_concreto = value;
                          }
                          formFormatoGeneral.bloque_concreto = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Tabique hueco de arcilla'),
                        value: tipo == 'editar'
                            ? formatoGeneral.tabique_hueco_arcilla
                            : formFormatoGeneral.tabique_hueco_arcilla,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.tabique_hueco_arcilla = value;
                          }
                          formFormatoGeneral.tabique_hueco_arcilla = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Tabicon de concreto'),
                        value: tipo == 'editar'
                            ? formatoGeneral.tabicon_concreto
                            : formFormatoGeneral.tabicon_concreto,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.tabicon_concreto = value;
                          }
                          formFormatoGeneral.tabicon_concreto = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Sistema de piso',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Losa maciza'),
                        value: tipo == 'editar'
                            ? formatoGeneral.losa_maciza
                            : formFormatoGeneral.losa_maciza,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.losa_maciza = value;
                          }
                          formFormatoGeneral.losa_maciza = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Losa reticular'),
                        value: tipo == 'editar'
                            ? formatoGeneral.losa_reticular
                            : formFormatoGeneral.losa_reticular,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.losa_reticular = value;
                          }
                          formFormatoGeneral.losa_reticular = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Vigueta y bovedilla'),
                        value: tipo == 'editar'
                            ? formatoGeneral.vigueta_bovedilla
                            : formFormatoGeneral.vigueta_bovedilla,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.vigueta_bovedilla = value;
                          }
                          formFormatoGeneral.vigueta_bovedilla = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('No se sabe'),
                        value: tipo == 'editar'
                            ? formatoGeneral.no_se_sabe_sistema_piso
                            : formFormatoGeneral.no_se_sabe_sistema_piso,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.no_se_sabe_sistema_piso = value;
                          }
                          formFormatoGeneral.no_se_sabe_sistema_piso = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Sistema de techo',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Igual al del piso'),
                        value: tipo == 'editar'
                            ? formatoGeneral.igual_al_del_piso
                            : formFormatoGeneral.igual_al_del_piso,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.igual_al_del_piso = value;
                          }
                          formFormatoGeneral.igual_al_del_piso = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Lámina'),
                        value: tipo == 'editar'
                            ? formatoGeneral.lamina
                            : formFormatoGeneral.lamina,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.lamina = value;
                          }
                          formFormatoGeneral.lamina = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Teja'),
                        value: tipo == 'editar'
                            ? formatoGeneral.teja
                            : formFormatoGeneral.teja,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.teja = value;
                          }
                          formFormatoGeneral.teja = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Otro'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.otro_sistema_techo
                            : formFormatoGeneral.otro_sistema_techo,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.otro_sistema_techo = value;
                          }
                          formFormatoGeneral.otro_sistema_techo = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Cimentación',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Zapatas aisladas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.zapatas_aisladas
                            : formFormatoGeneral.zapatas_aisladas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.zapatas_aisladas = value;
                          }
                          formFormatoGeneral.zapatas_aisladas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Zapatas corridas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.zapatas_corridas
                            : formFormatoGeneral.zapatas_corridas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.zapatas_corridas = value;
                          }
                          formFormatoGeneral.zapatas_corridas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Cimiento de piedra'),
                        value: tipo == 'editar'
                            ? formatoGeneral.cimiento_piedra
                            : formFormatoGeneral.cimiento_piedra,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.cimiento_piedra = value;
                          }
                          formFormatoGeneral.cimiento_piedra = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Losa de cimentación'),
                        value: tipo == 'editar'
                            ? formatoGeneral.losa_cimentacion
                            : formFormatoGeneral.losa_cimentacion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.losa_cimentacion = value;
                          }
                          formFormatoGeneral.losa_cimentacion = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pilotes/Pilas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.pilotes_pilas
                            : formFormatoGeneral.pilotes_pilas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.pilotes_pilas = value;
                          }
                          formFormatoGeneral.pilotes_pilas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Cajón'),
                        value: tipo == 'editar'
                            ? formatoGeneral.cajon
                            : formFormatoGeneral.cajon,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.cajon = value;
                          }
                          formFormatoGeneral.cajon = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('No se sabe'),
                        value: tipo == 'editar'
                            ? formatoGeneral.no_se_sabe_cimentacion
                            : formFormatoGeneral.no_se_sabe_cimentacion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.no_se_sabe_cimentacion = value;
                          }
                          formFormatoGeneral.no_se_sabe_cimentacion = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Cimentación',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Esquina'),
                        value: tipo == 'editar'
                            ? formatoGeneral.esquina
                            : formFormatoGeneral.esquina,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.esquina = value;
                          }
                          formFormatoGeneral.esquina = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Medio'),
                        value: tipo == 'editar'
                            ? formatoGeneral.medio
                            : formFormatoGeneral.medio,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.medio = value;
                          }
                          formFormatoGeneral.medio = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Aislado'),
                        value: tipo == 'editar'
                            ? formatoGeneral.aislado
                            : formFormatoGeneral.aislado,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.aislado = value;
                          }
                          formFormatoGeneral.aislado = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Frente a calle'),
                        value: tipo == 'editar'
                            ? formatoGeneral.frente_calle
                            : formFormatoGeneral.frente_calle,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.frente_calle = value;
                          }
                          formFormatoGeneral.frente_calle = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Frente a predio baldío'),
                        value: tipo == 'editar'
                            ? formatoGeneral.frente_predio
                            : formFormatoGeneral.frente_predio,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.frente_predio = value;
                          }
                          formFormatoGeneral.frente_predio = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Frente a parque'),
                        value: tipo == 'editar'
                            ? formatoGeneral.frente_parque
                            : formFormatoGeneral.frente_parque,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.frente_parque = value;
                          }
                          formFormatoGeneral.frente_parque = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Frente a corriente agua'),
                        value: tipo == 'editar'
                            ? formatoGeneral.frente_corriente
                            : formFormatoGeneral.frente_corriente,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.frente_corriente = value;
                          }
                          formFormatoGeneral.frente_corriente = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Frente a barranca'),
                        value: tipo == 'editar'
                            ? formatoGeneral.frente_barranca
                            : formFormatoGeneral.frente_barranca,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.frente_barranca = value;
                          }
                          formFormatoGeneral.frente_barranca = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Irregular en planta',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Asimetría por muro,cubos,cargas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.asimetria_muro_cubos_cargas
                            : formFormatoGeneral.asimetria_muro_cubos_cargas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.asimetria_muro_cubos_cargas = value;
                          }
                          formFormatoGeneral.asimetria_muro_cubos_cargas =
                              value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text(
                            'Grandes aberturas, entrantes/salientes'),
                        value: tipo == 'editar'
                            ? formatoGeneral.grandes_aberturas
                            : formFormatoGeneral.grandes_aberturas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.grandes_aberturas = value;
                          }
                          formFormatoGeneral.grandes_aberturas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text(
                            'Geometría irregular en planta "L","T","H" '),
                        value: tipo == 'editar'
                            ? formatoGeneral.geometria_irregular_planta
                            : formFormatoGeneral.geometria_irregular_planta,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.geometria_irregular_planta = value;
                          }
                          formFormatoGeneral.geometria_irregular_planta = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Irregular en eleavación',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Planta baja de doble altura'),
                        value: tipo == 'editar'
                            ? formatoGeneral.planta_baja_doble_altura
                            : formFormatoGeneral.planta_baja_doble_altura,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.planta_baja_doble_altura = value;
                          }
                          formFormatoGeneral.planta_baja_doble_altura = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Muros no llegan a cimentación'),
                        value: tipo == 'editar'
                            ? formatoGeneral.muros_no_llegan_cimentacion
                            : formFormatoGeneral.muros_no_llegan_cimentacion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.muros_no_llegan_cimentacion = value;
                          }
                          formFormatoGeneral.muros_no_llegan_cimentacion =
                              value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Planta baja flexible'),
                        value: tipo == 'editar'
                            ? formatoGeneral.planta_baja_flexible
                            : formFormatoGeneral.planta_baja_flexible,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.planta_baja_flexible = value;
                          }
                          formFormatoGeneral.planta_baja_flexible = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Columna corta'),
                        value: tipo == 'editar'
                            ? formatoGeneral.columna_corta
                            : formFormatoGeneral.columna_corta,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.columna_corta = value;
                          }
                          formFormatoGeneral.columna_corta = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grandes masas en pisos superiores'),
                        value: tipo == 'editar'
                            ? formatoGeneral.grandes_masas_pisos_superiores
                            : formFormatoGeneral.grandes_masas_pisos_superiores,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.grandes_masas_pisos_superiores =
                                value;
                          }
                          formFormatoGeneral.grandes_masas_pisos_superiores =
                              value;
                        },
                      ),
                      SwitchListTile(
                        title:
                            const Text('Reducción brusca de pisos superiores'),
                        value: tipo == 'editar'
                            ? formatoGeneral.reduccion_brusca_pisos_superiores
                            : formFormatoGeneral
                                .reduccion_brusca_pisos_superiores,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.reduccion_brusca_pisos_superiores =
                                value;
                          }
                          formFormatoGeneral.reduccion_brusca_pisos_superiores =
                              value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Separación edif vecino (cm)'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.separacion_edif_vecino.toString()
                            : formFormatoGeneral.separacion_edif_vecino
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.separacion_edif_vecino =
                                  double.parse(value);
                            }
                            formFormatoGeneral.separacion_edif_vecino =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Geotécnicos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Grietas en el terreno'),
                        value: tipo == 'editar'
                            ? formatoGeneral.grietas_terreno
                            : formFormatoGeneral.grietas_terreno,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.grietas_terreno = value;
                          }
                          formFormatoGeneral.grietas_terreno = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Hundimientos'),
                        value: tipo == 'editar'
                            ? formatoGeneral.hundimientos
                            : formFormatoGeneral.hundimientos,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.hundimientos = value;
                          }
                          formFormatoGeneral.hundimientos = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Inclinación del edificio (%)'),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.inclinacion_edificio.toString()
                            : formFormatoGeneral.inclinacion_edificio
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.inclinacion_edificio =
                                  double.parse(value);
                            }
                            formFormatoGeneral.inclinacion_edificio =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Losas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Colapso'),
                        value: tipo == 'editar'
                            ? formatoGeneral.colapso_losas
                            : formFormatoGeneral.colapso_losas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.colapso_losas = value;
                          }
                          formFormatoGeneral.colapso_losas = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Grietas max (mm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.grietas_max.toString()
                            : formFormatoGeneral.grietas_max.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.grietas_max = double.parse(value);
                            }
                            formFormatoGeneral.grietas_max =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Flechas max (cm)  '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.flechas_max.toString()
                            : formFormatoGeneral.flechas_max.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.flechas_max = double.parse(value);
                            }
                            formFormatoGeneral.flechas_max =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Conexiones',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Falla'),
                        value: tipo == 'editar'
                            ? formatoGeneral.falla_conexiones
                            : formFormatoGeneral.falla_conexiones,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.falla_conexiones = value;
                          }
                          formFormatoGeneral.falla_conexiones = value;
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Columnas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Colapso'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_colapso
                            : formFormatoGeneral.col_colapso,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_colapso = value;
                          }
                          formFormatoGeneral.col_colapso = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas cortante'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_grietas_cortante
                            : formFormatoGeneral.col_grietas_cortante,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_grietas_cortante = value;
                          }
                          formFormatoGeneral.mc_grietas_cortante = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas flexion'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_grietas_flexion
                            : formFormatoGeneral.col_grietas_flexion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_grietas_flexion = value;
                          }
                          formFormatoGeneral.mc_grietas_flexion = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Aplastamiento'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_aplastamiento
                            : formFormatoGeneral.col_aplastamiento,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_aplastamiento = value;
                          }
                          formFormatoGeneral.col_aplastamiento = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo barras'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_pandeo_barras
                            : formFormatoGeneral.col_pandeo_barras,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_pandeo_barras = value;
                          }
                          formFormatoGeneral.col_pandeo_barras = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo placas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_pandeo_placas
                            : formFormatoGeneral.col_pandeo_placas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_pandeo_placas = value;
                          }
                          formFormatoGeneral.col_pandeo_placas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Falla soldadura'),
                        value: tipo == 'editar'
                            ? formatoGeneral.col_falla_soldadura
                            : formFormatoGeneral.col_falla_soldadura,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.col_falla_soldadura = value;
                          }
                          formFormatoGeneral.col_falla_soldadura = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Ancho Máximo de grieta (mm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.col_ancho_max_grieta.toString()
                            : formFormatoGeneral.col_ancho_max_grieta
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.col_ancho_max_grieta =
                                  double.parse(value);
                            }
                            formFormatoGeneral.col_ancho_max_grieta =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Separación de estribos (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.col_separacion_estribos.toString()
                            : formFormatoGeneral.col_separacion_estribos
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.col_separacion_estribos =
                                  double.parse(value);
                            }
                            formFormatoGeneral.col_separacion_estribos =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Sección o espesor de muro (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.col_separacion_estribos.toString()
                            : formFormatoGeneral.col_separacion_estribos
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.col_separacion_estribos =
                                  double.parse(value);
                            }
                            formFormatoGeneral.col_seccion_espesor_muro =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Trabes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Colapso'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_colapso
                            : formFormatoGeneral.trabes_colapso,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_colapso = value;
                          }
                          formFormatoGeneral.trabes_colapso = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas cortante'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_grietas_cortante
                            : formFormatoGeneral.trabes_grietas_cortante,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_grietas_cortante = value;
                          }
                          formFormatoGeneral.trabes_grietas_cortante = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas flexion'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_grietas_flexion
                            : formFormatoGeneral.trabes_grietas_flexion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_grietas_flexion = value;
                          }
                          formFormatoGeneral.trabes_grietas_flexion = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Aplastamiento'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_aplastamiento
                            : formFormatoGeneral.trabes_aplastamiento,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_aplastamiento = value;
                          }
                          formFormatoGeneral.trabes_aplastamiento = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo barras'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_pandeo_barras
                            : formFormatoGeneral.trabes_pandeo_barras,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_pandeo_barras = value;
                          }
                          formFormatoGeneral.trabes_pandeo_barras = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo placas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_pandeo_placas
                            : formFormatoGeneral.trabes_pandeo_placas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_pandeo_placas = value;
                          }
                          formFormatoGeneral.trabes_pandeo_placas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Falla soldadura'),
                        value: tipo == 'editar'
                            ? formatoGeneral.trabes_falla_soldadura
                            : formFormatoGeneral.trabes_falla_soldadura,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.trabes_falla_soldadura = value;
                          }
                          formFormatoGeneral.trabes_falla_soldadura = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Ancho Máximo de grieta (mm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.trabes_ancho_max_grieta.toString()
                            : formFormatoGeneral.trabes_ancho_max_grieta
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.trabes_ancho_max_grieta =
                                  double.parse(value);
                            }
                            formFormatoGeneral.trabes_ancho_max_grieta =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Separación de estribos (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.trabes_separacion_estribos
                                .toString()
                            : formFormatoGeneral.trabes_separacion_estribos
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.trabes_separacion_estribos =
                                  double.parse(value);
                            }
                            formFormatoGeneral.trabes_separacion_estribos =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Sección o espesor de muro (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.trabes_seccion_espesor_muro
                                .toString()
                            : formFormatoGeneral.trabes_seccion_espesor_muro
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.trabes_seccion_espesor_muro =
                                  double.parse(value);
                            }
                            formFormatoGeneral.trabes_seccion_espesor_muro =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Muro Concreto',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Colapso'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_colapso
                            : formFormatoGeneral.mc_colapso,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_colapso = value;
                          }
                          formFormatoGeneral.mc_colapso = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas cortante'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_grietas_cortante
                            : formFormatoGeneral.mc_grietas_cortante,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_grietas_cortante = value;
                          }
                          formFormatoGeneral.mc_grietas_cortante = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas flexion'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_grietas_flexion
                            : formFormatoGeneral.mc_grietas_flexion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_grietas_flexion = value;
                          }
                          formFormatoGeneral.mc_grietas_flexion = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Aplastamiento'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_aplastamiento
                            : formFormatoGeneral.mc_aplastamiento,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_aplastamiento = value;
                          }
                          formFormatoGeneral.mc_aplastamiento = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo barras'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_pandeo_barras
                            : formFormatoGeneral.mc_pandeo_barras,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_pandeo_barras = value;
                          }
                          formFormatoGeneral.mc_pandeo_barras = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo placas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_pandeo_placas
                            : formFormatoGeneral.mc_pandeo_placas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_pandeo_placas = value;
                          }
                          formFormatoGeneral.mc_pandeo_placas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Falla soldadura'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mc_falla_soldadura
                            : formFormatoGeneral.mc_falla_soldadura,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mc_falla_soldadura = value;
                          }
                          formFormatoGeneral.mc_falla_soldadura = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Ancho Máximo de grieta (mm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.mc_ancho_max_grieta.toString()
                            : formFormatoGeneral.mc_ancho_max_grieta.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.mc_ancho_max_grieta =
                                  double.parse(value);
                            }
                            formFormatoGeneral.mc_ancho_max_grieta =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Separación de estribos (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.mc_separacion_estribos.toString()
                            : formFormatoGeneral.mc_separacion_estribos
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.mc_separacion_estribos =
                                  double.parse(value);
                            }
                            formFormatoGeneral.mc_separacion_estribos =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Sección o espesor de muro (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.mc_seccion_espesor_muro.toString()
                            : formFormatoGeneral.mc_seccion_espesor_muro
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.mc_seccion_espesor_muro =
                                  double.parse(value);
                            }
                            formFormatoGeneral.mc_seccion_espesor_muro =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Daños Muro Mamposteria',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Colapso'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_colapso
                            : formFormatoGeneral.mm_colapso,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_colapso = value;
                          }
                          formFormatoGeneral.mm_colapso = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas cortante'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_grietas_cortante
                            : formFormatoGeneral.mm_grietas_cortante,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_grietas_cortante = value;
                          }
                          formFormatoGeneral.mm_grietas_cortante = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Grietas flexion'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_grietas_flexion
                            : formFormatoGeneral.mm_grietas_flexion,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_grietas_flexion = value;
                          }
                          formFormatoGeneral.mm_grietas_flexion = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Aplastamiento'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_aplastamiento
                            : formFormatoGeneral.mm_aplastamiento,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_aplastamiento = value;
                          }
                          formFormatoGeneral.mm_aplastamiento = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo barras'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_pandeo_barras
                            : formFormatoGeneral.mm_pandeo_barras,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_pandeo_barras = value;
                          }
                          formFormatoGeneral.mm_pandeo_barras = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Pandeo placas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_pandeo_placas
                            : formFormatoGeneral.mm_pandeo_placas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_pandeo_placas = value;
                          }
                          formFormatoGeneral.mm_pandeo_placas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Falla soldadura'),
                        value: tipo == 'editar'
                            ? formatoGeneral.mm_falla_soldadura
                            : formFormatoGeneral.mm_falla_soldadura,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.mm_falla_soldadura = value;
                          }
                          formFormatoGeneral.mm_falla_soldadura = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Ancho Máximo de grieta (mm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.mm_ancho_max_grieta.toString()
                            : formFormatoGeneral.mm_ancho_max_grieta.toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.mm_ancho_max_grieta =
                                  double.parse(value);
                            }
                            formFormatoGeneral.mm_ancho_max_grieta =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Separación de estribos (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.mm_separacion_estribos.toString()
                            : formFormatoGeneral.mm_separacion_estribos
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.mm_separacion_estribos =
                                  double.parse(value);
                            }
                            formFormatoGeneral.mm_separacion_estribos =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Sección o espesor de muro (cm) '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.mm_seccion_espesor_muro.toString()
                            : formFormatoGeneral.mm_seccion_espesor_muro
                                .toString(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.mm_seccion_espesor_muro =
                                  double.parse(value);
                            }
                            formFormatoGeneral.mm_seccion_espesor_muro =
                                double.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Entrepiso crítico (mas débil y/o más dañado)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText:
                                'Número de columnas (o muros) daño severo (colapso,aplastamiento,pandeo,grietas> 3 mm) '),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return (value != null && value != '')
                              ? null
                              : 'Debe escribir un numero';
                        },
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.numero_columnas_dano_severo
                                .toString()
                            : formFormatoGeneral.numero_columnas_dano_severo
                                .toString(),
                        onChanged: (value) {
                          if (value != '') {
                            if (tipo == 'editar') {
                              formatoGeneral.numero_columnas_dano_severo =
                                  double.parse(value);
                            }
                            formFormatoGeneral.numero_columnas_dano_severo =
                                double.parse(value);
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText:
                                'Total de columnas (muros) en el entrepiso '),
                        initialValue: tipo == 'editar'
                            ? formatoGeneral.total_columnas_entrepiso.toString()
                            : formFormatoGeneral.total_columnas_entrepiso
                                .toString(),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.total_columnas_entrepiso =
                                double.parse(value);
                          }
                          formFormatoGeneral.total_columnas_entrepiso =
                              double.parse(value);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Otros daños',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      SwitchListTile(
                        title: const Text('Vidrios'),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_vidrios
                            : formFormatoGeneral.od_vidrios,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_vidrios = value;
                          }
                          formFormatoGeneral.od_vidrios = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Acabados'),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_acabados
                            : formFormatoGeneral.od_acabados,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_acabados = value;
                          }
                          formFormatoGeneral.od_acabados = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Plafones'),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_plafones
                            : formFormatoGeneral.od_plafones,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_plafones = value;
                          }
                          formFormatoGeneral.od_plafones = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Fachadas'),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_fachadas
                            : formFormatoGeneral.od_fachadas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_fachadas = value;
                          }
                          formFormatoGeneral.od_fachadas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Bardas|Pretiles'),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_bardas
                            : formFormatoGeneral.od_Bardas,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_bardas = value;
                          }
                          formFormatoGeneral.od_Bardas = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Instalaciones'),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_instalaciones
                            : formFormatoGeneral.od_instalaciones,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_instalaciones = value;
                          }
                          formFormatoGeneral.od_instalaciones = value;
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Cubos(escalera/elevador) '),
                        value: tipo == 'editar'
                            ? formatoGeneral.od_cubos
                            : formFormatoGeneral.od_cubos,
                        onChanged: (value) {
                          if (tipo == 'editar') {
                            formatoGeneral.od_cubos = value;
                          }
                          formFormatoGeneral.od_cubos = value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'NIVEL DE DAÑO DE LA ESTRUCTURA:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SwitchListTile(
                    title: const Text('Colapso total'),
                    value: tipo == 'editar'
                        ? formatoGeneral.de_colapso_total
                        : formFormatoGeneral.de_colapso_total,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.de_colapso_total = value;
                      }
                      formFormatoGeneral.de_colapso_total = value;
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Daño severo'),
                    value: tipo == 'editar'
                        ? formatoGeneral.de_dano_severo
                        : formFormatoGeneral.de_dano_severo,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.de_dano_severo = value;
                      }
                      formFormatoGeneral.de_dano_severo = value;
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Daño medio'),
                    value: tipo == 'editar'
                        ? formatoGeneral.de_dano_medio
                        : formFormatoGeneral.de_dano_medio,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.de_dano_medio = value;
                      }
                      formFormatoGeneral.de_dano_medio = value;
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Daño ligero'),
                    value: tipo == 'editar'
                        ? formatoGeneral.de_dano_ligero
                        : formFormatoGeneral.de_dano_ligero,
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.de_dano_ligero = value;
                      }
                      formFormatoGeneral.de_dano_ligero = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'CATALOGAR LA PROPIEDAD:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField<String>(
                    value: tipo == 'editar'
                        ? formatoGeneral.tipo_dano_general
                        : 'verde',
                    items: const [
                      DropdownMenuItem(
                        value: 'verde',
                        child: Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green),
                            SizedBox(width: 10),
                            Text('Propiedad habitable'),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'amarillo',
                        child: Row(
                          children:  [
                            Icon(Icons.circle, color: Colors.yellow),
                            SizedBox(width: 10),
                            Text('Propiedad en riezgo'),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'rojo',
                        child: Row(
                          children: [
                            Icon(Icons.circle, color: Colors.red),
                            SizedBox(width: 10),
                            Text('Propiedad no habitable'),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (tipo == 'editar') {
                        formatoGeneral.tipo_dano_general = value!;
                      }
                      formFormatoGeneral.tipo_dano_general = value!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Select an option',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (formFormatoGeneral.isValidForm()) {
                        if (tipo == 'nuevo') {
                          int consecutivoActual =
                              await DBProvider.db.obtenerUltimoConsecutivo();
                          final tempInsert = FormatoGeneralModel(
                              id_evaluacion: levantamiento.id!,
                              consecutivo: consecutivoActual,
                              fecha: now.toString(),
                              n: formFormatoGeneral.n,
                              o: formFormatoGeneral.o,
                              msnm: formFormatoGeneral.msnm,
                              nombre_inmueble:
                                  formFormatoGeneral.nombre_inmueble,
                              calle_numero: formFormatoGeneral.calle_numero,
                              colonia: formFormatoGeneral.colonia,
                              codigo_postal: formFormatoGeneral.codigo_postal,
                              pueblo_ciudad: formFormatoGeneral.pueblo_ciudad,
                              referencias: formFormatoGeneral.referencias,
                              propietario: formFormatoGeneral.propietario,
                              telefono: formFormatoGeneral.telefono,
                              vivienda: formFormatoGeneral.vivienda,
                              hospital: formFormatoGeneral.hospital,
                              oficinas: formFormatoGeneral.oficinas,
                              iglesia: formFormatoGeneral.iglesia,
                              comercio: formFormatoGeneral.comercio,
                              escuela: formFormatoGeneral.escuela,
                              reunion_cine_estadio:
                                  formFormatoGeneral.reunion_cine_estadio,
                              desocupada: formFormatoGeneral.desocupada,
                              niveles: formFormatoGeneral.niveles,
                              sotanos: formFormatoGeneral.sotanos,
                              ocupantes: formFormatoGeneral.ocupantes,
                              frente_x: formFormatoGeneral.frente_x,
                              frente_y: formFormatoGeneral.frente_y,
                              planicie: formFormatoGeneral.planicie,
                              ladera_cerro: formFormatoGeneral.ladera_cerro,
                              rivera_rio_lago:
                                  formFormatoGeneral.rivera_rio_lago,
                              fondo_valle: formFormatoGeneral.fondo_valle,
                              costa: formFormatoGeneral.costa,
                              depositos_lacustres:
                                  formFormatoGeneral.depositos_lacustres,
                              marcos_acero_1: formFormatoGeneral.marcos_acero_1,
                              marcos_concreto_1:
                                  formFormatoGeneral.marcos_concreto_1,
                              columnas_losa_plana_1:
                                  formFormatoGeneral.columnas_losa_plana_1,
                              muros_carga_mamposteria_1:
                                  formFormatoGeneral.muros_carga_mamposteria_1,
                              marcos_muros_diafragma_1:
                                  formFormatoGeneral.marcos_muros_diafragma_1,
                              uso_contravientos_1:
                                  formFormatoGeneral.uso_contravientos_1,
                              muros_adobe_bahareque:
                                  formFormatoGeneral.muros_adobe_bahareque,
                              muros_madera_lamina_otros:
                                  formFormatoGeneral.muros_madera_lamina_otros,
                              marcos_acero_2: formFormatoGeneral.marcos_acero_2,
                              marcos_concreto_2:
                                  formFormatoGeneral.marcos_concreto_2,
                              columnas_losa_plana_2:
                                  formFormatoGeneral.columnas_losa_plana_2,
                              muros_carga_mamposteria_2:
                                  formFormatoGeneral.muros_carga_mamposteria_2,
                              marcos_muros_diafragma_2:
                                  formFormatoGeneral.marcos_muros_diafragma_2,
                              uso_contravientos_2:
                                  formFormatoGeneral.uso_contravientos_2,
                              muros_adobe_bahareque_2:
                                  formFormatoGeneral.muros_adobe_bahareque_2,
                              muros_madera_lamina_otros_2: formFormatoGeneral
                                  .muros_madera_lamina_otros_2,
                              confinada: formFormatoGeneral.confinada,
                              refuerzo_interior:
                                  formFormatoGeneral.refuerzo_interior,
                              bloque_concreto:
                                  formFormatoGeneral.bloque_concreto,
                              tabique_hueco_arcilla:
                                  formFormatoGeneral.tabique_hueco_arcilla,
                              tabicon_concreto:
                                  formFormatoGeneral.tabicon_concreto,
                              simple: formFormatoGeneral.simple,
                              losa_maciza: formFormatoGeneral.losa_maciza,
                              losa_reticular: formFormatoGeneral.losa_reticular,
                              vigueta_bovedilla:
                                  formFormatoGeneral.vigueta_bovedilla,
                              no_se_sabe_sistema_piso:
                                  formFormatoGeneral.no_se_sabe_sistema_piso,
                              igual_al_del_piso:
                                  formFormatoGeneral.igual_al_del_piso,
                              lamina: formFormatoGeneral.lamina,
                              teja: formFormatoGeneral.teja,
                              otro_sistema_techo:
                                  formFormatoGeneral.otro_sistema_techo,
                              zapatas_aisladas:
                                  formFormatoGeneral.zapatas_aisladas,
                              zapatas_corridas:
                                  formFormatoGeneral.zapatas_corridas,
                              cimiento_piedra:
                                  formFormatoGeneral.cimiento_piedra,
                              losa_cimentacion:
                                  formFormatoGeneral.losa_cimentacion,
                              pilotes_pilas: formFormatoGeneral.pilotes_pilas,
                              cajon: formFormatoGeneral.cajon,
                              no_se_sabe_cimentacion:
                                  formFormatoGeneral.no_se_sabe_cimentacion,
                              esquina: formFormatoGeneral.esquina,
                              medio: formFormatoGeneral.medio,
                              aislado: formFormatoGeneral.aislado,
                              frente_calle: formFormatoGeneral.frente_calle,
                              frente_predio: formFormatoGeneral.frente_predio,
                              frente_parque: formFormatoGeneral.frente_parque,
                              frente_corriente:
                                  formFormatoGeneral.frente_corriente,
                              frente_barranca:
                                  formFormatoGeneral.frente_barranca,
                              asimetria_muro_cubos_cargas: formFormatoGeneral
                                  .asimetria_muro_cubos_cargas,
                              grandes_aberturas:
                                  formFormatoGeneral.grandes_aberturas,
                              geometria_irregular_planta:
                                  formFormatoGeneral.geometria_irregular_planta,
                              planta_baja_doble_altura:
                                  formFormatoGeneral.planta_baja_doble_altura,
                              muros_no_llegan_cimentacion: formFormatoGeneral
                                  .muros_no_llegan_cimentacion,
                              planta_baja_flexible:
                                  formFormatoGeneral.planta_baja_flexible,
                              columna_corta: formFormatoGeneral.columna_corta,
                              grandes_masas_pisos_superiores: formFormatoGeneral
                                  .grandes_masas_pisos_superiores,
                              reduccion_brusca_pisos_superiores:
                                  formFormatoGeneral
                                      .reduccion_brusca_pisos_superiores,
                              separacion_edif_vecino:
                                  formFormatoGeneral.separacion_edif_vecino,
                              grietas_terreno:
                                  formFormatoGeneral.grietas_terreno,
                              hundimientos: formFormatoGeneral.hundimientos,
                              inclinacion_edificio:
                                  formFormatoGeneral.inclinacion_edificio,
                              colapso_losas: formFormatoGeneral.colapso_losas,
                              grietas_max: formFormatoGeneral.grietas_max,
                              flechas_max: formFormatoGeneral.flechas_max,
                              falla_conexiones:
                                  formFormatoGeneral.falla_conexiones,
                              col_colapso: formFormatoGeneral.col_colapso,
                              col_grietas_cortante:
                                  formFormatoGeneral.col_grietas_cortante,
                              col_grietas_flexion:
                                  formFormatoGeneral.col_grietas_flexion,
                              col_aplastamiento:
                                  formFormatoGeneral.col_aplastamiento,
                              col_pandeo_barras:
                                  formFormatoGeneral.col_pandeo_barras,
                              col_pandeo_placas:
                                  formFormatoGeneral.col_pandeo_placas,
                              col_falla_soldadura:
                                  formFormatoGeneral.col_falla_soldadura,
                              col_ancho_max_grieta:
                                  formFormatoGeneral.col_ancho_max_grieta,
                              col_separacion_estribos: formFormatoGeneral.col_separacion_estribos,
                              col_seccion_espesor_muro: formFormatoGeneral.col_seccion_espesor_muro,
                              trabes_colapso: formFormatoGeneral.trabes_colapso,
                              trabes_grietas_cortante: formFormatoGeneral.trabes_grietas_cortante,
                              trabes_grietas_flexion: formFormatoGeneral.trabes_grietas_flexion,
                              trabes_aplastamiento: formFormatoGeneral.trabes_aplastamiento,
                              trabes_pandeo_barras: formFormatoGeneral.trabes_pandeo_barras,
                              trabes_pandeo_placas: formFormatoGeneral.trabes_pandeo_placas,
                              trabes_falla_soldadura: formFormatoGeneral.trabes_falla_soldadura,
                              trabes_ancho_max_grieta: formFormatoGeneral.trabes_ancho_max_grieta,
                              trabes_separacion_estribos: formFormatoGeneral.trabes_separacion_estribos,
                              trabes_seccion_espesor_muro: formFormatoGeneral.trabes_seccion_espesor_muro,
                              mc_colapso: formFormatoGeneral.mc_colapso,
                              mc_grietas_cortante: formFormatoGeneral.mc_grietas_cortante,
                              mc_grietas_flexion: formFormatoGeneral.mc_grietas_flexion,
                              mc_aplastamiento: formFormatoGeneral.mc_aplastamiento,
                              mc_pandeo_barras: formFormatoGeneral.mc_pandeo_barras,
                              mc_pandeo_placas: formFormatoGeneral.mc_pandeo_placas,
                              mc_falla_soldadura: formFormatoGeneral.mc_falla_soldadura,
                              mc_ancho_max_grieta: formFormatoGeneral.mc_ancho_max_grieta,
                              mc_separacion_estribos: formFormatoGeneral.mc_separacion_estribos,
                              mc_seccion_espesor_muro: formFormatoGeneral.mc_seccion_espesor_muro,
                              mm_colapso: formFormatoGeneral.mm_colapso,
                              mm_grietas_cortante: formFormatoGeneral.mm_grietas_cortante,
                              mm_grietas_flexion: formFormatoGeneral.mm_grietas_flexion,
                              mm_aplastamiento: formFormatoGeneral.mm_aplastamiento,
                              mm_pandeo_barras: formFormatoGeneral.mm_pandeo_barras,
                              mm_pandeo_placas: formFormatoGeneral.mm_pandeo_placas,
                              mm_falla_soldadura: formFormatoGeneral.mm_falla_soldadura,
                              mm_ancho_max_grieta: formFormatoGeneral.mm_ancho_max_grieta,
                              mm_separacion_estribos: formFormatoGeneral.mm_separacion_estribos,
                              mm_seccion_espesor_muro: formFormatoGeneral.mm_seccion_espesor_muro,
                              numero_columnas_dano_severo: formFormatoGeneral.numero_columnas_dano_severo,
                              total_columnas_entrepiso: formFormatoGeneral.total_columnas_entrepiso,
                              de_colapso_total: formFormatoGeneral.de_colapso_total,
                              de_dano_severo: formFormatoGeneral.de_dano_severo,
                              de_dano_medio: formFormatoGeneral.de_dano_medio,
                              de_dano_ligero: formFormatoGeneral.de_dano_ligero,
                              od_vidrios: formFormatoGeneral.od_vidrios,
                              od_acabados: formFormatoGeneral.od_acabados,
                              od_plafones: formFormatoGeneral.od_plafones,
                              od_fachadas: formFormatoGeneral.od_fachadas,
                              od_bardas: formFormatoGeneral.od_Bardas,
                              od_instalaciones: formFormatoGeneral.od_instalaciones,
                              od_cubos: formFormatoGeneral.od_cubos,
                              tipo_dano_general: formFormatoGeneral.tipo_dano_general == '' ? 'verde' : formFormatoGeneral.tipo_dano_general);
                          formFormatoGeneral.guardaFormatoGeneral(tempInsert);
                        } else {
                          DBProvider.db
                              .actualizarFormatoGeneral(formatoGeneral);
                        }
                        formFormatoGeneral.resetea();
                        formatosGeneralesProvider
                            .cargarFormatosGenerales(levantamiento.id!);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(
                            context, 'lista_formatos',
                            arguments: levantamiento);
                      } else {
                        // Mostrar un mensaje de error si el formulario no es válido
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Por favor, complete todos los campos obligatorios')),
                        );
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
