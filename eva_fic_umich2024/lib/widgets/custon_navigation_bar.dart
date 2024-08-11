import 'package:eva_fic_umich2024/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../services/services.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final inicialesProvider = Provider.of<InicialesProvider>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    final currentIndex = inicialesProvider.selectMenu;
    List<String> informacion;
    return BottomNavigationBar(
      onTap: (int i) async => {
        inicialesProvider.selectMenu = i,
        if (inicialesProvider.usuarioSistema == '')
          {
            inicialesProvider.usuarioSistema = await authService.readUsuario(),
            informacion = await DBProvider.db.obtenerDatosInspector(),
            inicialesProvider.id = int.parse(informacion[0]),
            inicialesProvider.nombreInspector = informacion[1],
            inicialesProvider.claveInspector = informacion[2],
          },
      },
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: 'Inspector',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Nuevo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_chart_sharp),
          label: 'Levantamientos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Inspecciones', // Nuevo ítem añadido
        ),
      ],
      selectedItemColor: Colors.blue, // Color del ítem seleccionado
      unselectedItemColor: Colors.grey, // Color de los ítems no seleccionados
      backgroundColor: Colors.white, // Color de fondo del BottomNavigationBar
    );
  }
}
