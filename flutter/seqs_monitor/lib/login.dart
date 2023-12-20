import 'package:flutter/material.dart';

import 'main.dart';


class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image( //se declara la imagen
                image: AssetImage('assets/logo/logodna2.png'),
                fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 10),
            const Text("MonSeq",style: TextStyle(color:Color.fromARGB(255, 233, 248, 255),fontSize:50,fontWeight: FontWeight.bold )),
          const Text("login",style: TextStyle(color: Color.fromARGB(255, 233, 248, 255),fontSize: 30)),
           Padding(padding:EdgeInsets.all(20),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Color.fromARGB(255, 233, 248, 255),
              labelStyle: TextStyle(color: Color.fromARGB(255, 233, 248, 255)),
              labelText: 'Email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa un correo';
              }
              if(value.contains('@')==false){
                return"Ingresa un correo valido";
              }
              return null;
            },
          ),
          ),
          
          Padding(padding:EdgeInsets.only(right: 20,left: 20),
          child:TextFormField(
            decoration: const InputDecoration(
    
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
              labelStyle:TextStyle(color: Color.fromARGB(255, 233, 248, 255)),
            ),
            validator: (String? valuePass) {
              if (valuePass == null || valuePass.isEmpty) {
                return 'Ingresa una contraseña';
              }
              if(valuePass.length<8 ||valuePass.length>20){
                return"Tu contraseña debe tener un largo entre 8 y 20 caracteres!";
              }
              return null;
            },
          ),),
          
          const Padding(padding:EdgeInsets.all(5),child:
           Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Padding(padding: EdgeInsets.only(right: 20,left: 20),
                child:
                Row(
                  children: [

                    CheckRecordar(),
                    Text("Recordar datos"),
                  ],
                ),),

              Text("¿Olvidaste tu contraseña")
            ],
          ),),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ),
          
        ],
      ),
    );
  }
}

// zona check box
class CheckRecordar extends StatefulWidget {
  const CheckRecordar({super.key});

  @override
  State<CheckRecordar> createState() => _CheckRecordarState();
}

class _CheckRecordarState extends State<CheckRecordar> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromARGB(255, 233, 248, 255);
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
