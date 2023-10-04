function numMayor(numero){
    const regexpNum =/[0-9]+/g;
    let soloNum=numero.match(regexpNum);
    for(i=0;i<soloNum.length;i++){
        if(numMayor<parseInt(soloNum[i])){
            numMayor=parseInt(soloNum[i]);
        }
    }
    return numMayor;
}
let lista="1,3,6,22,77,2,44,11,22,34,3,5,78,";
console.log(numMayor(lista));