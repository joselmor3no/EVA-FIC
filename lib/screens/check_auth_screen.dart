import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:eva_fi_umich/screens/screens.dart';
import 'package:eva_fi_umich/services/services.dart';

import '../providers/providers.dart';


class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>( context, listen: false );
    final levantamientosProvider = Provider.of<LevantamientosProvider>(context);
    levantamientosProvider.cargarLevantamientos();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            
            if ( !snapshot.hasData ) {
              return const Text('');
            }

            if ( snapshot.data == '' ) {
              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __ , ___ ) => const LoginScreen(),
                  transitionDuration: const Duration( seconds: 0)
                  )
                );

              });

            } else {

              Future.microtask(() {

                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: ( _, __ , ___ ) => const LevantamientosScreen(),
                  transitionDuration: const Duration( seconds: 0)
                  )
                );

              });
            }

            return Container();

          },
        ),
     ),
   );
  }
}