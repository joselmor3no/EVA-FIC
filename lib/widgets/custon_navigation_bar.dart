import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
            label: 'Local'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'En Linea'
          )
          ]
      );
  }
}
