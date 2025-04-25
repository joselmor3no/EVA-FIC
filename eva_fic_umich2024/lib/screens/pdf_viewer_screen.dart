import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFViewerScreen extends StatefulWidget {
  const PDFViewerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  String? filePath;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // Obtén el directorio temporal del dispositivo
      final tempDir = await getTemporaryDirectory();

      // Define la ruta del archivo PDF en el directorio temporal
      final file = File('${tempDir.path}/guia.pdf');

      // Copia el archivo PDF desde los assets al sistema de archivos
      final data = await rootBundle.load('assets/guia.pdf');
      await file.writeAsBytes(data.buffer.asUint8List());

      // Actualiza la ruta del archivo
      setState(() {
        filePath = file.path;
      });
    } catch (e) {
      // Maneja errores
      debugPrint('Error al cargar el PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guía de la App'),
      ),
      body: filePath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: filePath!,
            ),
    );
  }
}
