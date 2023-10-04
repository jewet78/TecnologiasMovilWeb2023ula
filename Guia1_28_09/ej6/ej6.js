let producto =
    {
    "nombre":String,
    "precio":Number,
    "stock":Number
    }
function getRandomInt(min, max){
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
    }
function hacerStock(){
    let nombres = ["chocolate","galletas", "limon", "cajas"];
let color = ["rojo","verde", "amarillo"];
let productos=[];
let aux1;
for (let i in nombres){
    for(let j in color){
        aux1=Object.create(producto);
        aux1.nombre=nombres[i]+" "+color[j];
        aux1.precio=(getRandomInt(1,50)*1000);
        aux1.stock=getRandomInt(0,1500);
        productos.push(aux1);
    }
}
return productos;
}

function revisarStock(listaProductos){
    pocoStock=[];
    for(let i in listaProductos){
        if(listaProductos[i].stock<1000){
            pocoStock.push(i);
        }
    }
    return pocoStock;
}
