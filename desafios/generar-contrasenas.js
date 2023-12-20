function genPass(longitud){
    let pass="";
    let auxiliar=1;
    longitud=document.getElementById("longitud");
    numFlag=document.getElementById("numero");
    minusFlag=document.getElementById("minus");
    mayusFlag=document.getElementById("mayus");
    simboloFlag=document.getElementById("simbolo");
    if(longitud.value<8||longitud.value>20){
        alert("Largo de la contraseña debe ser entre 8 y 20 caracteres");
        return(0)
    }
    /*
    for(i=0;i<longitud.value;i++){
        while(pass.length<=i){

            auxiliar=numero();
            if(auxiliar=1 && numFlag){
                pass.concat(numero());
            }
            if(auxiliar=2 && minusFlag.value=="on"){
                pass.concat(letra());
            }
            if(auxiliar=3 && mayusFlag.value=="on"){
                pass.concat((letra().toUpperCase()));
            }
            if(auxiliar=4 && simboloFlag){
                pass.concat(simbolo());
            }
        }
    }*/
    console.log(pass);

    return 1;
}
function letra(){
    return"a";
}
function numero(){
    return Math.floor(Math.random()*10);
}
function simbolo(){

    return "simbolo";
}