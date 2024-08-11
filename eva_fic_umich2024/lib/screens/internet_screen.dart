import 'package:flutter/material.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        'Por favor, conéctate a internet y reinicia la aplicación.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
    );
  }
}
