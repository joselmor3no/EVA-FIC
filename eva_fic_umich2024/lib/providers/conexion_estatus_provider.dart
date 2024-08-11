import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConexionEstatusProvider extends ChangeNotifier {
  bool _hasInternet = true;

  bool get hasInternet => _hasInternet;

  Future<void> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    _hasInternet = connectivityResult != ConnectivityResult.none;
    notifyListeners();
  }

  void updateConnectionStatus(ConnectivityResult result) {
    _hasInternet = result != ConnectivityResult.none;
    notifyListeners();
  }

  void startMonitoring() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      updateConnectionStatus(result);
    });
  }
}
