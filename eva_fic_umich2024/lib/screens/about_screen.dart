import 'package:eva_fic_umich2024/screens/pdf_viewer_screen.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acerca de',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 38, 56, 88),
      ),
      backgroundColor: Colors.white, // Fondo blanco
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Universidad Michoacana de San Nicolás de Hidalgo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Facultad de Ingeniería Civil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text(
              'Desarrollado por:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Dr. Hugo Hernández Barrios\nIng. José Luis Moreno',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'En la administración del M.C. Amir Ramiro Guzmán\nPeriodo 2023-2027',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Para más información, contáctenos en:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Facultad de Ingeniería Civil\nUMSNH\nCorreo: jose.luis.moreno@umich.mx',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aviso:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Esta aplicación fue desarrollada por la Facultad de Ingeniería Civil de la Universidad Michoacana de San Nicolás de Hidalgo (UMSNH). '
              'No representa a ninguna entidad gubernamental y su uso está enfocado únicamente a fines educativos y operativos dentro del ámbito académico y profesional.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify, // Alineación justificada
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PDFViewerScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 38, 56, 88),
              ),
              child: const Text(
                'Ver Guía de la App',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}