import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Image(image: AssetImage('assets/logo_facultad_ing_civil.png'),
          height: 220,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 0, left: 0),
          Positioned(child: _Bubble(), bottom: 0, right: 0),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(6, 38, 77, 0.934),
        Color.fromRGBO(10, 40, 80, 1)
      ]));
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
