import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Widget Display',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('JSON Widget Display'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: _loadJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              List<dynamic> jsonData = snapshot.data!['pokemon'];
              return CarouselSlider.builder(
                itemCount: jsonData.length,
                itemBuilder: (context, index, _) {
                  return _buildItemWidget(jsonData[index]);
                },
                options: CarouselOptions(
                  // Customize your carousel options here
                  // Example: carouselHeight, aspectRatio, etc.
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildItemWidget(Map<String, dynamic> itemData) {
    return PokemonCards(name: itemData['nombre'], type: itemData['tipos'], id_nacional: itemData['id_nacional'], image: itemData['image_path']);
  }
}

Future<Map<String, dynamic>> _loadJsonData() async {
  String jsonString = await rootBundle.loadString('assets/json/pokemon.json');
  return json.decode(jsonString);
}

class PokemonCards extends StatelessWidget {
  final String name;
  List type;
  final int id_nacional;
  final String image;
  
  PokemonCards({
    required this.name,
    required this.type,
    required this.id_nacional,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage(image),
          height: 300,
          width: 300,
        ),
        // Using map function properly
        
        Row(mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(name, style: new TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 50),
            Text("Pokedex: $id_nacional"), // Ensure ID is properly converted to string
          ],
        ),
       SizedBox(height: 20),
      Row(mainAxisAlignment:MainAxisAlignment.center, children: [...type.map((item) => FilledCardExample(tipo: item['tipo'])).toList(),],)
      ],
    ),
    );
  }
}

class FilledCardExample extends StatelessWidget {
  final String tipo;

  FilledCardExample({Key? key, required this.tipo}) : super(key: key);

  Color _getColor() {
    switch (tipo) {
      case "Fuego":
        return Colors.red;
      case "Agua":
        return Colors.blue;
      case "Bicho":
        return Colors.yellowAccent; // Corrected color name
      case "Veneno":
        return Colors.purple;
      case "Planta":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color cardColor = _getColor();

    return Center(
      child: Card(
        elevation: 0,
        color: cardColor,
        child: SizedBox(
          width: 80,
          height: 20,
          child: Center(child: Text(tipo)),
        ),
      ),
    );
  }
}