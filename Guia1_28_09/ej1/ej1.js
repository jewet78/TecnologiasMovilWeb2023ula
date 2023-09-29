function sumatoriaCiclo(numero ){
    var r=0
    console.log(numero);
    for(i=1;i<numero+1;i++){
        if(i%2==0){
            r=r+i;
        }
    }
    return r;
}
function sumatoriaFormula(numero){
    let s=parseInt(numero/2);
    r=s*(s+1);
    console.log(r+1);
}
let resultado;
var numero = document.getElementById("input1");
sumatoriaFormula(10);
console.log("===");
resultado=sumatoriaCiclo(10);
console.log(resultado);