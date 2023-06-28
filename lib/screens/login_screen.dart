import 'package:flutter/material.dart';
import 'package:eva_fi_umich/providers/login_form_provider.dart';
import 'package:eva_fi_umich/services/services.dart';
import 'package:provider/provider.dart';

import 'package:eva_fi_umich/ui/input_decorations.dart';
import 'package:eva_fi_umich/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 300),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Text('EVA_FI_UMICH',
                  style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
          const SizedBox(height: 50),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
              child: const Text('')),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no es un correo';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: const Color.fromARGB(255, 3, 31, 81),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      final String? errorMessage = await authService.login(
                          loginForm.email, loginForm.password);

                      if (errorMessage == null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(
                            context, 'levantamientos');
                      } else {
                        // print( errorMessage );
                        if (errorMessage.contains("MAIL_NOT")) {
                          NotificationsService.showSnackbar("Correo no registrado");
                        }
                        else if (errorMessage.contains("INVALID_PAS")) {
                          NotificationsService.showSnackbar("Contraseña incorrecta");
                        }
                        else{
                          NotificationsService.showSnackbar(errorMessage);
                        }
                        
                        loginForm.isLoading = false;
                      }
                    },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
