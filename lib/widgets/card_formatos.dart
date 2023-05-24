import 'package:flutter/material.dart';

class CardFormatos extends StatelessWidget {
  final String nombre;
  final IconData imagen;
  const CardFormatos({super.key, required this.nombre, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: const Color.fromARGB(255, 245, 247, 246),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Icon(
              imagen,
              size: 40,
              color:const  Color.fromARGB(255, 17, 155, 235),
            ),
            const Text('Crear'),
            Text(nombre),
          ],
        ),
      ),
    );
  }
}
