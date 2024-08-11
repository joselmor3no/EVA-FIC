import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:eva_fic_umich2024/models/imagen_fg_model.dart';
import 'package:flutter/material.dart';

class CardSwiperImagenesfg extends StatelessWidget {
  const CardSwiperImagenesfg({
    super.key,
    required this.listaImagenes,
  });

  final List<ImagenesFGModel> listaImagenes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.6,
      child: Swiper(
        itemCount: listaImagenes.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * .8,
        itemBuilder: (_, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(File(listaImagenes[index].rutaDispositivo)),
          );
        },
      ),
    );
  }
}
