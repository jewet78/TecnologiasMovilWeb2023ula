function calcularIVA(precio,impuesto){
    let iva=0.19;
    precio=parseFloat(precio);
    impuesto=parseFloat(impuesto);
    if(impuesto){
        if(impuesto<0 || impuesto>99){
            alert("Valor de impuesto invalido, ingresar un numero entre 0 y 99");
            return 0;
        }
        else if(impuesto>1){
            iva=impuesto/100;
        }
        else{
            iva=impuesto;
        }
    }


    let factura=precio+(precio*iva);
    alert("El valor de la factura es de: $"+factura);
    console.log("El valor de la factura es de: $"+factura)
    return factura;
}
function verResultado(){
    let valor=document.getElementById("valor").value;
    let iva=document.getElementById("iva").value;
    calcularIVA(valor,iva);
}