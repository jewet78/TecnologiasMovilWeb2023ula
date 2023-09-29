
function contarPalabras(oracion){
    const regexpPalabras = /[^\s]+/g;
    console.log(oracion.match(regexpPalabras));
    return (oracion.match(regexpPalabras)).length;
}


console.log(contarPalabras("oracione con un numero de palabras que no conósco, vamos a ver cuantas hay ñ. eññ. ç"))