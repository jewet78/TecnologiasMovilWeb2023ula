
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
//widget del carrusel, recibe una lista de widgets a mostrar
class Carrusel extends StatelessWidget {
  final List<Widget> cards; // Lista de widgets que representan las tarjetas

  const Carrusel({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CarouselSlider.builder(
          itemCount: cards.length,
          itemBuilder: (context, index, _) {
            return cards[index];
          },
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: true,
            height: constraints.maxHeight.toDouble(), // Ajusta la altura al contexto
          ),
        );
      },
    );
  }
}

// En algún otro lugar donde quieras usar el carrusel:
/*
// Creas tus widgets de tarjeta
final card1 = datosCards(
  name: 'Nombre 1',
  subText: 'Subtexto 1',
  image: 'assets/images/imagen1.jpg',
);

final card2 = datosCards(
  name: 'Nombre 2',
  subText: 'Subtexto 2',
  image: 'assets/images/imagen2.jpg',
);

// Luego los pasas al carrusel
final carrusel = Carrusel(
  cards: [card1, card2], // Puedes agregar más tarjetas aquí
);
*/