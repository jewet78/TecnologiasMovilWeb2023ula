// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: camel_case_types

//el componente en main llama a pefil que retorna un componente tipo center
class perfil extends StatefulWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  _perfilState createState() => _perfilState();
}

class _perfilState extends State<perfil> {
  String fotoPerfil = "assets/img/perfil1.webp"; // Aqui va la direccion de la imagen
  String nombrePerfil = "Juanito alcachofa"; // y en nombre a mostrar
    // lo pondria en un json pero quedaria mucho texto como en el otro widget (carrusel)

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          perfilCard(imagen: fotoPerfil, nombre: nombrePerfil), //aqui llama al wiget de la foto + nombre
          
          ElevatedButton( //este es solo un boto con una funcion simple de placeholder
                          //solo cambia el nombre por otro
            onPressed: () {
              setState(() {
                nombrePerfil = "Casimiro (test boton)"; // Change to the desired new name
              });
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Editar perfil"),
                Icon(Icons.edit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//este widget es la "card" de foto + nombre
//devuelve una columna con los elementos
class perfilCard extends StatelessWidget { 
  final String imagen;                      
  final String nombre;

  const perfilCard({
    Key? key,
    required this.imagen,
    required this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imagenPerfil(img: imagen), //aqui llamamos el widget de la foto
                                  // es para el estilo redondo y con bordes
        const SizedBox(height: 8), 
        Text(
          nombre,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

//esta widget es para que la imagen sea redonda y con bordes
class imagenPerfil extends StatelessWidget {
  final String img;
  const imagenPerfil({super.key,required this.img});


  @override
  Widget build(BuildContext context) {
    return Container( //aqui se declara la caracteristica del container
      width: 150,     //el tamaño esta en pixeles por que es mas simple
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle, //le da la forma
        border: Border.all(width: 3, color: Colors.black), //el borde
      ),
      child: ClipOval( //le dice que tome forma circular
                      //me gustaria explicar como funciona pero no entiendo mucho de flutter
        child: Image(
          image: AssetImage(img),
          width: 140,
          height: 140,
          fit: BoxFit.cover, //puede que cover sea repetir, por el alto y ancho definidos
                              //es mejor asegurarse
        ),
      ),
    );
  }
}
