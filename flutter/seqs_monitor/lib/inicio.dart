import 'package:flutter/material.dart';
import 'elementos.dart';

//pantalla de inicio
class InicioScreen extends StatelessWidget {
  final List<String> listaDePendientes = [
    'F3D143',
    'F3S123',
    'F3D145',
    'F3D146',
  ];

  @override
  Widget build(BuildContext context) {
    // Tomamos solo los primeros 3 elementos de la lista
    final List<String> primerosTresItems = listaDePendientes.take(3).toList();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSequenceCard('Pendientes', primerosTresItems),
            _buildSequenceCard('En Curso',primerosTresItems),
            _buildSequenceCard('Finalizadas',primerosTresItems),

          ],
        ),
      ),
    );
  }
    Widget _buildSequenceCard(String cardTitle, List<String> itemsToShow) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MiniCard(
              title: cardTitle,
              items: itemsToShow.map((item) {
                return ExpandableItem(title: item, content: 'N° total de secuencias: 3178',);
              }).toList(),
            ),
            const SizedBox(height: 10),
          ],
        );
  }
}

