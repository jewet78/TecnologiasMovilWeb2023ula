function vecesLetra(oracion,letra){
    let repeticiones=0;
    for(let i in oracion){
        if(letra==oracion[i]){
            repeticiones=repeticiones+1;
            console.log(oracion[i],"...",repeticiones);
        }
    }
    alert("Tu letra "+letra+" aparece "+repeticiones+" veces en tu frase");
    console.log(repeticiones);
}
function verRepeticionesLetra(){
    let frase=document.getElementById("frase").value;
    let letra=document.getElementById("letra").value;
    vecesLetra(frase,letra);

}