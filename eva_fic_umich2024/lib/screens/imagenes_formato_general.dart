import 'package:eva_fic_umich2024/models/formato_general_model.dart';
import 'package:eva_fic_umich2024/models/imagen_fg_model.dart';
import 'package:eva_fic_umich2024/models/levantamientos_model.dart';
import 'package:eva_fic_umich2024/providers/imagenes_fg_provider.dart';
import 'package:eva_fic_umich2024/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/db_provider.dart';

class ImagenesFormatoGeneralScreen extends StatelessWidget {
  const ImagenesFormatoGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagenesFGProvider = Provider.of<ImagenesFGProvider>(context);

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final FormatoGeneralModel formatoGeneral =
        arguments['formatoGeneral'] as FormatoGeneralModel;
    final LevantamientosModel levantamiento =
        arguments['levantamiento'] as LevantamientosModel;
    imagenesFGProvider.cargarFormatosGenerales(formatoGeneral.id!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Imagenes Formato ${formatoGeneral.nombre_inmueble}'),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
          child: Column(
            children: [
              CardSwiperImagenesfg(
                  listaImagenes: imagenesFGProvider.imagenesFG),
              const SizedBox(height: 10),
              const Divider(
                height: 10,
                thickness: 2,
                color: Color.fromARGB(255, 17, 155, 235),
              ),
              //---------Icono tomar foto
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 100,
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          color: const Color.fromARGB(255, 245, 247, 246),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color.fromARGB(255, 17, 155, 235),
                                  ),
                                  iconSize: 40,
                                  onPressed: () async {
                                    final picker = ImagePicker();
                                    final XFile? pickedFile =
                                        await picker.pickImage(
                                      source: ImageSource.camera,
                                      imageQuality: 100,
                                    );

                                    if (pickedFile == null) {
                                      return;
                                    }

                                    final tempInsert = ImagenesFGModel(
                                        idLevantamiento: levantamiento.id!,
                                        idFormatoGeneral: formatoGeneral.id!,
                                        rutaDispositivo: pickedFile.path);
                                    imagenesFGProvider
                                        .nuevaImagenFGP(tempInsert);
                                  },
                                ),
                                const Text('Tomar una foto'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      //-----------Icono galeria
                      SizedBox(
                        width: 130,
                        height: 100,
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          color: const Color.fromARGB(255, 245, 247, 246),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.image_outlined,
                                    color: Color.fromARGB(255, 17, 155, 235),
                                  ),
                                  iconSize: 40,
                                  onPressed: () async {
                                    final picker = ImagePicker();
                                    final XFile? pickedFile =
                                        await picker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 100,
                                    );

                                    if (pickedFile == null) {
                                      return;
                                    }

                                    final tempInsert = ImagenesFGModel(
                                        idLevantamiento: levantamiento.id!,
                                        idFormatoGeneral: formatoGeneral.id!,
                                        rutaDispositivo: pickedFile.path);
                                    imagenesFGProvider
                                        .nuevaImagenFGP(tempInsert);
                                  },
                                ),
                                const Text('Galeria de Fotos'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
