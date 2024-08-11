import 'package:eva_fic_umich2024/screens/informacion_inspector.dart';
import 'package:eva_fic_umich2024/screens/internet_screen.dart';
import 'package:eva_fic_umich2024/screens/levantamientos_screen.dart';
import 'package:eva_fic_umich2024/screens/nuevo_levantamiento_screen.dart';
import 'package:eva_fic_umich2024/screens/inspecciones_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('EVA-FIC'), actions: [
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () async {
            await authService.logout();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, 'login');
          },
          tooltip: 'Salir',
        ),
      ]),
      body: _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  Future<bool> _isFirebaseInitialized() async {
    // Verifica si Firebase está inicializado
    try {
      await Firebase.initializeApp();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> _checkConnectivityAndFirebase() async {
    final isFirebaseInitialized = await _isFirebaseInitialized();
    final isConnected = await _isConnected();
    return isFirebaseInitialized && isConnected;
  }

  @override
  Widget build(BuildContext context) {
    final inicialesProvider = Provider.of<InicialesProvider>(context);
    final currentIndex = inicialesProvider.selectMenu;

    switch (currentIndex) {
      case 0:
        return const InformacionInspectorScreen();
      case 1:
        return NuevoLevantamientoScreen();
      case 2:
        return const LevantamientosScreen();
      case 3:
        return FutureBuilder<bool>(
          future: _checkConnectivityAndFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || !snapshot.data!) {
              return const InternetScreen();
            } else {
              return const InspeccionesScreen();
            }
          },
        );
      default:
        return const LevantamientosScreen();
    }
  }
}
