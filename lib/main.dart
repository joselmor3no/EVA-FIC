import 'package:eva_fi_umich/providers/connection_status_provider.dart';
import 'package:eva_fi_umich/providers/estados_municipios_provider.dart';
import 'package:eva_fi_umich/providers/imagenes_fg_provider.dart';
import 'package:eva_fi_umich/screens/check_auth_screen.dart';
import 'package:eva_fi_umich/utils/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eva_fi_umich/providers/providers.dart';
import 'package:eva_fi_umich/screens/screens.dart';
import 'package:eva_fi_umich/services/services.dart';

final internetChecker = CheckInternetConnection();
void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => FormLevantamietoProvider()),
        ChangeNotifierProvider(create: (_) => LevantamientosProvider()),
        ChangeNotifierProvider(create: (_) => FormFormatoGeneralProvider()),
        ChangeNotifierProvider(create: (_) => FormatosProvider()),
        ChangeNotifierProvider(create: (_) => ImagenesFGProvider()),
        ChangeNotifierProvider(create: (_) => ConnectionStatusChangeProvider()),
        ChangeNotifierProvider(create: (_) => EstadosMunicipiosProvider()),
        //ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'checking',
      routes: {
        'nuevo_levantamiento': (_) => NuevoLevantamientoScreen(),
        'checking': (_) => const CheckAuthScreen(),
        'home': (_) => const HomeScreen(),
        'levantamientos': (_) => const LevantamientosScreen(),
        'login': (_) => const LoginScreen(),
        'lista_formatos': (_) => const ListaFormatosScreen(),
        'formato_general': (_) => const FormatoGeneralScreen(),
        'imagenes_formato_general': (_) => const ImagenesFormatoGeneralScreen(),
        'no_internet': (_) => const NoInternetScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(
              elevation: 0, color: Color.fromRGBO(6, 38, 77, 0.934)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
