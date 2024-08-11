import 'dart:async';



import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/check_internet_connection.dart';


class ConnectionStatusChangeProvider extends ChangeNotifier {
  late StreamSubscription _connectionSubscription;

  ConnectionStatus status = ConnectionStatus.online;

  ConnectionStatusChangeProvider() {
    _connectionSubscription = internetChecker
        .internetStatus()
        .listen((newStatus) {
      status = newStatus;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}