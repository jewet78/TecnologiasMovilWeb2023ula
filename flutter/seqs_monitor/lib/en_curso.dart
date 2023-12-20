import 'package:flutter/material.dart';
import 'elementos.dart'; // Importa el widget de la Card1 que hemos creado anteriormente // Importa el widget de la Card2 que hemos creado anteriormente
import 'carrusel.dart'; // Importa el widget Carrusel
import 'detalles.dart';

class CustomExpansionTileCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomExpansionTileCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: children,
      ),
    );
  }
}

class EnCursoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final card1Data = {
      'name': 'F3D9',
      'NUseqs': '2543',
      'TN': '117746',
      'completedSteps':'1',
      'totalSteps':'8'
    };

    final card2Title = 'Sumario contigs';
    final card2TableData = [
                [' ','Start', 'End', 'N° Bases', 'Ambigs', 'Polimeros', 'N° Secs'],
                ['Minimo:', '1', '107', '107', '0', '3', '1'],
                ['Maximo:', '1', '502', '502', '249', '243', '150840'],
                ['Media:', '1', '252', '252', '0', '4', ''],
    ];

    final card1 = Card1(
      itemName: card1Data['name'] ?? 'No name',
      completedSteps: int.parse(card1Data['completados'] ?? '0'),
      totalSteps: int.parse(card1Data['pasos'] ?? '0'),
    );

    final card2 = Card2(
      title: card2Title,
      tableData: card2TableData,
    );

    final List<Widget> cardsList = [card1, card2];

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Usamos el widget separado para la tarjeta con ExpansionTile
          CustomExpansionTileCard(
            title: card1Data['name'] ?? 'No name',
            children: [
              SizedBox( // Altura del Carrusel (ajustar según sea necesario)
              height: 400,
                child: Carrusel(cards: cardsList),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the details screen for the specific item
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesScreen(itemName:  card1Data['name'] ?? 'No name'),
                    ),
                  );
                },
                child: Text('Ver Detalles'),
              ),
            ],
            
          ),
          // Otras tarjetas en una lista desplazab
        ],
      ),
    );
  }
}
