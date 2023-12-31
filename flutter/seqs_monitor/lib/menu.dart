import 'package:flutter/material.dart';
import 'package:seqs_monitor/finalizado.dart';
import 'main.dart';

//el menu esta por separado aqui, para usarlo donde se  necesite
class CustomDrawer extends StatelessWidget {
  final BuildContext context;

  const CustomDrawer({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top:40,left: 5),
        children: <Widget>[
          const Text("Menu",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
          
          //cada opcion del menu va aqui en una listTile

          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          
          ListTile(
            title: const Text('Tareas Pendientes'),
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pendientes()),
              );
            },
          ),
          ListTile(
            title: const Text('En Curso'),
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EnCurso()),
              );
            },
            
          ),
          ListTile(
            title: const Text('Finalizado'),
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Finalizado()),
              );
            },
            
          )
          
        ],
      ),
    );
  }
}
