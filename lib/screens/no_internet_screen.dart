import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../providers/db_provider.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LevantamientosModel levantamiento =
        ModalRoute.of(context)?.settings.arguments as LevantamientosModel;
    String ruta = '';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Formas de exportación'),
      ),
      body: Container(
        width: double.infinity, // Ocupa todo el ancho disponible
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_sharp,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'SIN CONEXIÓN A INTERNET',
              style: TextStyle(fontSize: 33),
            ),
            const SizedBox(height: 120),
            const Divider(
              thickness: 1, // Grosor de la línea
              color: Colors.black, // Color de la línea
              indent: 20, // Espacio izquierdo de la línea
              endIndent: 20, // Espacio derecho de la línea
            ),
            const SizedBox(height: 20),
            const Text(
              'PUEDES EXPORTAR EL LEVANTAMIENTO',
              style: TextStyle(fontSize: 23),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => {
                await DBProvider.db.exportTableToTxt(
                    'inspecciones', levantamiento.id.toString(), 'id'),
                await DBProvider.db.exportTableToTxt('formatos_generales',
                    levantamiento.id.toString(), 'id_evaluacion'),
                await DBProvider.db.exportTableToTxt(
                    'imagenes_levantamiento_fg',
                    levantamiento.id.toString(),
                    'id_levantamiento'),
                await DBProvider.db
                    .copiaImagenesCarpeta(levantamiento.id.toString()),
                ruta = await DBProvider.db
                    .comprimirCarpeta(levantamiento.id.toString()),
                print(ruta),
                Share.shareFiles([ruta], text: 'Compartir archivo')
              },
              child: const Text('Exportar como un zip'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
