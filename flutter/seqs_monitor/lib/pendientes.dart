import 'package:flutter/material.dart';
import 'detalles.dart';

class PendientesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildExpandableCard('Elemento 1', 'Tamaño: 100', 'Número de secuencias: 50',context),
            _buildExpandableCard('Elemento 2', 'Tamaño: 75', 'Número de secuencias: 30',context),
            // Add more expandable cards as needed
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableCard(String itemName, String size, String numSequences,BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text(itemName),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(size),
                const SizedBox(height: 8.0),
                Text(numSequences),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the details screen for the specific item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesScreen(itemName: itemName),
                ),
              );
            },
            child: Text('Ver Detalles'),
          ),
        ],
      ),
    );
  }
}
