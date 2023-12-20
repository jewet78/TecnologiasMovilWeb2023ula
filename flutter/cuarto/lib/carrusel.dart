import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: camel_case_types
// widget del carrusel, es mas complejo porque saca la info del json infoCarrusel.json
class carrusel extends StatelessWidget {
  const carrusel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //este widget se encarga de manejar los datos del json
    return FutureBuilder<Map<String, dynamic>>( 
          future: _loadJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              List<dynamic> jsonData = snapshot.data!['datos'];
              return CarouselSlider.builder( //<============= aqui es donde usamos el carrusel
                itemCount: jsonData.length, //tantos items como "datos" en el json
                itemBuilder: (context, index, _) {
                  return _buildItemWidget(jsonData[index]); //aqui llama al widget que llama al widget que nos sirve
                },
                options: CarouselOptions( //<================== opciones del carrusel
                  viewportFraction: 1, // esto le dice que ocupe todo el ancho, al menos eso entendi
                  enableInfiniteScroll: true, // Set to true if infinite scrolling is needed
                                              //necesito scroll infinito

                ),
              );
            }
          },
    );
  }

  //este widget llama al otro widget
  //no estendi bien pero parece necesario para el paso de dinamic a dato normal
  Widget _buildItemWidget(Map<String, dynamic> itemData) {
    return datosCards(name: itemData['nombre'], subText: itemData['subTexto'],image: itemData['image_path']);
  }
}

//este widget lee el json, el embodrio de arrriba es para el manejo de los datos
Future<Map<String, dynamic>> _loadJsonData() async {
  String jsonString = await rootBundle.loadString('assets/json/infoCarrusel.json');
  return json.decode(jsonString);
}

// ignore: camel_case_types
//widget que devuelve el un center
// este center es el item mostrado en el carrusel
class datosCards extends StatelessWidget {
  final String name;
  final String subText;
  final String image;
  
  const datosCards({
    required this.name,
    required this.subText,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    //aqui se decalra el tamaño en base al alto de la pantalla
    double altoPantalla = MediaQuery.of(context).size.height; 
    double altoCarrusel= altoPantalla * 0.5; //el carrusel tiene un alto del 50% de la pantalla             
    return Center(
      child: Stack( //se declara stack para que los container se pongan encima del otro
                    //el de mas abajo recibe prioridad al de arriba y se pone al frente
                    //asi se logra el efecto de texto sobre imagen
      children: <Widget>[
        Container( //este container es para la imagen
                  // de alguna forma logre que maantenga el ratio al cambiar de tamaño la imagen
            margin: const EdgeInsets.all(30.0), //le da un margen de 30px en todos los lados
            height: altoCarrusel,                   //alto del 50%, declarado arriba
            width: MediaQuery.of(context).size.width,//tiene el ancho de la pantalla
            child: ClipRRect( //es para redondear los bordes
              borderRadius: BorderRadius.circular(8.0), //parametros del borde
              child: Image( //se declara la imagen
                image: AssetImage(image),
                fit: BoxFit.cover, //con esto se asegura que la imagen se adapte al tamaño del container
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        Container( //container titulo
        alignment: Alignment.bottomLeft, //se dice donde va a estar, abajo izquierda

        child: LayoutBuilder(           //esta es para ajustar el tamanno de fuente y paddig
                                        //segun el ancho de pantalla  
          builder: (BuildContext context, BoxConstraints constraints) {  //aqui se detalla el tamaño de padding y fuente 
            double anchoPantalla = MediaQuery.of(context).size.width;
            double porcerajePadding = 0.1; 
            double valorPadding = anchoPantalla * porcerajePadding; //tamanno padding
            double porcentajeTamannoFuente=0.07;
            double fontSize = anchoPantalla * porcentajeTamannoFuente; //tamanno fuente
            return Padding(
              padding: EdgeInsets.only(left: valorPadding, bottom: valorPadding),
                child: Text(
                  name,
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize, // Your fixed font size
                    color: Colors.white,
                    shadows: const [  //esto es para darle sombra y ver el texto blanco sobre la imagen
                      Shadow(
                        blurRadius: 30,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )

      ],
    ),
    );
  }
}
