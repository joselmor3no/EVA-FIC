

import 'package:eva_fi_umich/screens/check_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eva_fi_umich/providers/providers.dart';
import 'package:eva_fi_umich/screens/screens.dart';
import 'package:eva_fi_umich/services/services.dart';

 
void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: ( _ ) => FormLevantamietoProvider() ),
        ChangeNotifierProvider(create: ( _ ) => LevantamientosProvider() ),
        
        //ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: MyApp(),
    );
  }
}

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'checking',
      routes: {
        'nuevo_levantamiento':( _ ) => NuevoLevantamientoScreen(),
        'checking'          : ( _ ) => CheckAuthScreen(),
        'home'              : ( _ ) => HomeScreen(),
        'levantamientos'    : ( _ ) => LevantamientosScreen(),
        'login'             : ( _ ) => LoginScreen(),
        'lista_formatos'    : ( _ ) => ListaFormatosScreen(),

      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme:const AppBarTheme(
          elevation: 0,
          color: Color.fromRGBO(6, 38, 77, 0.934)
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}