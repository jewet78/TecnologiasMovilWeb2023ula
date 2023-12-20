//Matias Soto
import 'dart:io';
import 'dart:math';

void main() {
  // Solicitando una cadena de texto por teclado
  print('Ingresa un numero ');
  int numero = int.parse(stdin.readLineSync()!);
  if(parCheck(numero)){
    print("El numero $numero es par!!");
  }
  else{
    print("El numero $numero es impar!!");
  }
  if(primoCheck(numero)){
    print("el numero $numero es primo!!");
  }
  else{
    print("El numero $numero no es primo!!");
  }
   //for (var i = 0; i < numSaludos; i++) {
  
}

bool parCheck(int a) {
  if((a%2)==0){
    return true;
  }
  return false;
}

bool primoCheck(int a){
  
  num raiz=sqrt(a);
  num aux=2;

  while(aux<=raiz){
    if(a%aux==0){
      return false;
    }
    aux++;
  }
  return true;
}