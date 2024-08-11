import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../providers/db_provider.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LevantamientosModel levantamiento =
        ModalRoute.of(context)?.settings.arguments as LevantamientosModel;
    String ruta = '';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
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
              Icons.folder_zip_outlined,
              size: 100,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Exportar el levantamiento:\n ${levantamiento.nombre}',
                style: const TextStyle(
                  fontSize: 23,
                ), 
                textAlign: TextAlign.center,
              ),
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
                //print(ruta),
                Share.shareFiles([ruta], text: 'Compartir archivo')
              },
              child: const Text('Exportar zip'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
