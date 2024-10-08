// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDySspaEEeKRrgRaufVU0SvydTToKezJZg',
    appId: '1:230540238592:web:0d7fbcc405ed820d5fdde5',
    messagingSenderId: '230540238592',
    projectId: 'evaficumich',
    authDomain: 'evaficumich.firebaseapp.com',
    databaseURL: 'https://evaficumich-default-rtdb.firebaseio.com',
    storageBucket: 'evaficumich.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuW2gIrphT8_MTjpD44xku6pcppNN3_Ho',
    appId: '1:230540238592:android:ad4ab1a9a81f90315fdde5',
    messagingSenderId: '230540238592',
    projectId: 'evaficumich',
    databaseURL: 'https://evaficumich-default-rtdb.firebaseio.com',
    storageBucket: 'evaficumich.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUE-C75vK-9usM3bOdbG9wZYmyJd7g2eg',
    appId: '1:230540238592:ios:4c5d7fc5c37b6c395fdde5',
    messagingSenderId: '230540238592',
    projectId: 'evaficumich',
    databaseURL: 'https://evaficumich-default-rtdb.firebaseio.com',
    storageBucket: 'evaficumich.appspot.com',
    iosBundleId: 'com.example.evaFiUmich',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUE-C75vK-9usM3bOdbG9wZYmyJd7g2eg',
    appId: '1:230540238592:ios:4c5d7fc5c37b6c395fdde5',
    messagingSenderId: '230540238592',
    projectId: 'evaficumich',
    databaseURL: 'https://evaficumich-default-rtdb.firebaseio.com',
    storageBucket: 'evaficumich.appspot.com',
    iosBundleId: 'com.example.evaFiUmich',
  );
}
