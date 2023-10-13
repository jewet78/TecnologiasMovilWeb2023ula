function calcularIMC(peso,altura){
    peso=parseFloat(peso);
    altura=parseFloat(altura);
    let imc=peso/((altura/100)**2);
    return imc;
};
function catIMC(imc){
    if(imc<18.5){
        return "Bajo Peso";
    }
    else if(imc>24.9){
        return "Sobre Peso";
    }
    else if(imc){
        return "Peso Normal";
    }
    else{
        return "Indeterminada";
    }
};
function gastoED(peso,actividad){
    return peso*actividad;
};

function obtenerResultados(){
    let nombre=document.getElementById("nombre").value;
    let peso=document.getElementById("peso").value;
    let altura=document.getElementById("altura").value;
    let genero=document.getElementById("genero").value;
    let actividad=document.getElementById("actividad").value;
    let imc=calcularIMC(parseFloat(peso),parseFloat(altura));
    let categoriaIMC=catIMC(imc);
    let gastoEnergetico=gastoED(parseFloat(peso),parseFloat(actividad));
    document.getElementById("resultados").innerHTML=("Resultados de "+nombre);
    document.getElementById("imc").innerHTML=(imc);
    document.getElementById("clasificacion").innerHTML=categoriaIMC;
    document.getElementById("gastoEnergetico").innerHTML=(gastoEnergetico+" kcal");
    if(actividad=="Peso Normal"){
        document.getElementById("nutricion").innerHTML="Adecuado"; 
    }
    else if(actividad=="Indeterminada"){
        document.getElementById("nutricion").innerHTML="Indeterminada";
        
    }
    else{
        document.getElementById("nutricion").innerHTML="Necesita atención especializada";
    }
};