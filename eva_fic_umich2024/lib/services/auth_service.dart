import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final storage = const FlutterSecureStorage();

  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "Password muy debil";
      } else if (e.code == 'email-already-in-use') {
        return "Email en uso";
      } else {
        return "Hubo un error con el correo o con tu conexión a internet";
      }
    }
    return null;
  }

  // Recuperar contraseña
  Future<String?> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Se ha enviado un enlace de recuperación a tu correo";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No existe una cuenta con este correo";
      } else {
        return "Hubo un error al intentar enviar el correo de recuperación";
      }
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final a = userCredential.user;
      if (a?.uid != null) {
        await storage.write(key: 'token', value: userCredential.user?.uid);
        await storage.write(key: 'usuario', value: userCredential.user?.email);
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Usuario no encontrado";
      } else {
        return "Error al iniciar sesion";
      }
    }
    return null;
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<String> readUsuario() async {
    return await storage.read(key: 'usuario') ?? '';
  }
}
