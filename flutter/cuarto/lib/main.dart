import 'package:flutter/material.dart';
import 'carrusel.dart';
import 'perfil.dart';
/// Flutter code sample for [BottomNavigationBar].

//Leer
//No voy a modificar el texto para el nav bar porque no lo modifique mucho
//la mayoria de lo que yo hize esta en carrusel y el pefil
void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}
class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0; //selecciona en cual tab comenzamos
  static const List<Widget> _widgetOptions = <Widget>[ //aqui se declara el contenido de las tabs
                                                      //de seguro hay una forma mejor pero esto me funciono
    carrusel(),
    perfil()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Actividad 4'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent, // Set the background color here, le da el color a la barra
        selectedFontSize: 18, // Adjust the font size when selected
        unselectedFontSize: 14, // Adjust the font size when unselected
        iconSize: 30,
        items: const <BottomNavigationBarItem>[ //aqui se declaran las tabs y su nombre
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 184, 231, 251), //le cambia el color al seleccionar
        showUnselectedLabels: false, //le quita el texto si no esta seleccionado
        onTap: _onItemTapped,
      ),
    );
  }
}
