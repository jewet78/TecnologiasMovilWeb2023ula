function calcularIMC(){
    const peso=parseFloat(document.getElementById("peso").value);
    const altura=parseFloat(document.getElementById("altura").value);
    let imc=peso/(altura**2);
    document.getElementById('imc').innerHTML= imc.toString();
    if(imc<18.5){
        document.getElementById('categoria').innerHTML="Bajo Peso";
    }
    else if(imc>24.9){
        document.getElementById('categoria').innerHTML="Sobre Peso";
    }
    else if(imc){
        document.getElementById('categoria').innerHTML="Peso Normal";
    }
    else{
        document.getElementById('categoria').innerHTML="Indeterminada";
    }
}