function resultadoRendimiento(puntos){
    let frase;
    if(0>=puntos || puntos>=1){
        frase="puntuación invalida!. "+puntos+" fuera de los parametros";
        alert(frase);
        console.log("puntuacion invalida: ",puntos);
        return 0;
    }
    else if((puntos*10)%2!=0){
        frase="puntuación invalida!. "+puntos+" fuera de los parametros";
        alert(frase);
        console.log("puntuacion invalida: ",puntos);
        return 0;
    }
    let montoBase=350000;
    let niveles=["Insuficiente","Aceptable","Meritorio","Excelente"];
    let puntuaciones=[0.2,0.4,0.6,0.8];
    for(i=0;i<4;i++){
        if(puntos==puntuaciones[i]){
            console.log("El nivel de rendimiento es", niveles[i],".El bono es de :",montoBase*puntos);
            frase=("El nivel de rendimiento es "+niveles[i]+". El bono es de : $"+montoBase*puntos);
            alert(frase);

        }
    }
    return 1;
}
function calcularRendimiento(){
    let puntos=document.getElementById("input1").value;
    console.log(document.getElementById("input1").value);
    console.log(puntos);
    resultadoRendimiento(puntos);
}
