import 'package:flutter/material.dart';

//Aqui esta la pantalla de detalles
class DetallesScreen extends StatelessWidget {
  final String itemName;

  const DetallesScreen({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $itemName'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), //tiene una flecha para regresar a la pantalla anterior
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDetailCard('Sumario contigs'),
            _buildDetailCard('Sumario Alineacion de secuencias'),
            _buildDetailCard('Sumario Post filtrado de secuencias'),
          ],
        ),
      ),
    );
  }
  //aqui se declara la card que contiene la tabla
  Widget _buildDetailCard(String cardTitle) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(),
              children: [
                _buildTableRow(' ','Start', 'End', 'N° Bases', 'Ambigs', 'Polimeros', 'N° Secuencias'),
                _buildTableRow('Minimo:', '1', '107', '107', '0', '3', '1'),
                _buildTableRow('2.5%:', '1', '252', '252', '0', '3', '3772'),
                _buildTableRow('25%:', '1', '252', '252', '0', '4', '37711'),
                _buildTableRow('Mediana:', '1', '252', '252', '0', '4', '75421'),
                _buildTableRow('75%:', '1', '253', '253', '0', '5', '113131'),
                _buildTableRow('97.5%:', '1', '253', '253', '5', '6', '147070'),
                _buildTableRow('Maximo:', '1', '502', '502', '249', '243', '150840'),
                _buildTableRow('Media:', '1', '252', '252', '0', '4', ''),

              ],
            ),
          ],
        ),
      ),
    );
  }
  //aqui se declara la forma de la tabla
  TableRow _buildTableRow(String first,String start, String end, String nBases, String ambigs, String polymer, String numSeqs) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(first),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(start),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(end),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(nBases),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ambigs),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(polymer),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(numSeqs),
          ),
        ),
      ],
    );
  }
}
