import 'package:eva_fic_umich2024/providers/connection_status_provider.dart';
import 'package:eva_fic_umich2024/providers/formato_escuela_provider.dart';
import 'package:eva_fic_umich2024/providers/imagenes_fg_provider.dart';
import 'package:eva_fic_umich2024/screens/check_auth_screen.dart';
import 'package:eva_fic_umich2024/screens/informacion_inspector.dart';
import 'package:eva_fic_umich2024/screens/internet_screen.dart';
import 'package:eva_fic_umich2024/utils/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'package:eva_fic_umich2024/providers/providers.dart';
import 'package:eva_fic_umich2024/screens/screens.dart';
import 'package:eva_fic_umich2024/services/services.dart';

//importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final internetChecker = CheckInternetConnection();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firebaseInitialized = true;

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    firebaseInitialized = false;
  }

  runApp(AppState(firebaseInitialized: firebaseInitialized));
}

class AppState extends StatelessWidget {
  final bool firebaseInitialized;

  const AppState({super.key, required this.firebaseInitialized});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InicialesProvider()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => FormLevantamietoProvider()),
        ChangeNotifierProvider(create: (_) => LevantamientosProvider()),
        ChangeNotifierProvider(create: (_) => FormFormatoGeneralProvider()),
        ChangeNotifierProvider(create: (_) => FormFormatoEscuelaProvider()),
        ChangeNotifierProvider(create: (_) => FormatosProvider()),
        ChangeNotifierProvider(create: (_) => ImagenesFGProvider()),
        ChangeNotifierProvider(create: (_) => ConnectionStatusChangeProvider()),
        ChangeNotifierProvider(create: (_) => EstadosMunicipiosProvider()),
        ChangeNotifierProvider(
            create: (_) => FormInformacionInspectorProvider()),
        ChangeNotifierProvider(create: (_) => ConexionEstatusProvider()),

      ],
      child: MyApp(firebaseInitialized: firebaseInitialized),
    );
  }
}

class MyApp extends StatelessWidget {
  final bool firebaseInitialized;

  const MyApp({super.key, required this.firebaseInitialized});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EVAFIC App',
      initialRoute: 'checking',
      routes: {
        'about': (_) => const AboutScreen(),
        'nuevo_levantamiento': (_) => NuevoLevantamientoScreen(),
        'checking': (_) => const CheckAuthScreen(),
        'home': (_) => const HomeScreen(),
        'levantamientos': (_) => const LevantamientosScreen(),
        'login': (_) => const LoginScreen(),
        'registro': (_) => const RegistroScreen(),
        'lista_formatos': (_) => const ListaFormatosScreen(),
        'informacion_inspector': (_) => const InformacionInspectorScreen(),
        'formato_general': (_) => const FormatoGeneralScreen(),
        'formato_escuela': (_) => const FormatoEscuelaScreen(),
        'imagenes_formato_general': (_) => const ImagenesFormatoGeneralScreen(),
        'no_internet': (_) => const NoInternetScreen(),
        'sin_conexion': (_) => const InternetScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color.fromRGBO(6, 38, 77, 0.934),
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(
              elevation: 0, color: Color.fromRGBO(6, 38, 77, 0.934)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            if (!firebaseInitialized)
              ScaffoldMessenger(
                child: Builder(
                  builder: (context) {
                    Future.microtask(() =>
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Trabajando sin conexión a Internet')),
                        ));
                    return const SizedBox.shrink();
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
