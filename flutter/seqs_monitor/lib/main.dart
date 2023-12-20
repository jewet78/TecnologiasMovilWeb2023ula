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
        // Assuming you're using Material3
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogScreen()
    );
  }
}

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

// Rest of your page classes remain the same as in the previous example.


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
      body:PendientesScreen() // Add your content for Resumen Pendientes here,
    );
  }
}



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
      body:EnCursoScreen() // Add your content for EnCurso here,
    );
  }
}
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
      body:FinalizadoScreen() // Add your content for EnCurso here,
    );
  }
}
