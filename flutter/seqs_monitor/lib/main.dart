import 'package:flutter/material.dart';

import 'login.dart';
import 'inicio.dart';
import 'menu.dart';
import 'pendientes.dart';
import 'en_curso.dart';
import 'finalizado.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith( primary: Color.fromARGB(255, 105, 187, 225), secondary: Color.fromARGB(255, 46, 120, 247 )),

        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

//dirige a pantalla de login
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogScreen()
    );
  }
}
//dirige a pantalla de inicio
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 233, 248, 255)
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: CustomDrawer(context: context),
      body: InicioScreen()
    );
  }
}

//dirige a pantalla de pendientes

class Pendientes extends StatelessWidget {
  const Pendientes({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Pendientes',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 233, 248, 255)
          ),),
      ),
      drawer: CustomDrawer(context: context),
      body:PendientesScreen() 
    );
  }
}


//dirige a pantalla de en curso
class EnCurso extends StatelessWidget {
  const EnCurso({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('En Curso',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 233, 248, 255)
          ),),
      ),
      drawer: CustomDrawer(context: context),
      body:EnCursoScreen() 
    );
  }
}

//dirige a pantalla de finalizado
class Finalizado extends StatelessWidget {
  const Finalizado({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Finalizado',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 233, 248, 255)
          ),),
      ),
      drawer: CustomDrawer(context: context),
      body:FinalizadoScreen()
    );
  }
}
