import 'package:flutter/material.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("login",style: TextStyle(color: Colors.white,fontSize: 50)),
           Padding(padding:EdgeInsets.all(20),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white),
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
              labelStyle:TextStyle(color: Colors.white),
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
          
          const Padding(padding:EdgeInsets.all(10)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CheckRecordar(),
                Text("Recordar datos"),
                ],
              ),
              Text("¿Olvidaste tu contraseña",
              textAlign: TextAlign.right,)
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Login'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {

                }, 
                icon: const Icon(Icons.facebook)
              ),
              IconButton(
                onPressed: () {

                }, 
                icon: const Icon(Icons.g_translate)
              )
            ],
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
      return Colors.white;
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
