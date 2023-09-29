function comprobar(pass){
    const regexpMayus = /[A-Z]/;
    const regexpNum =/[0-9]/;
    const regexpSign=/[\u0021\u0023-\u0026\u0028-\u002F\u003A-\u0040\u007B-\u007E]/; /// !@#$%^&*()_+{}\[\]:;<>,.?~\\-/;
    console.log(pass.length);
    console.log(regexpMayus.test(pass));
    console.log(regexpNum.test(pass));
    console.log(regexpSign.test(pass));
    if(pass.length<8){
        return false;
    }
    else if(!regexpMayus.test(pass)){
        return false;
    }
    else if(!regexpNum.test(pass)){
        return false;
    }
    else if(!regexpSign.test(pass)){
        return false;
    }
    return true

}
console.log(comprobar("palabraA7+"));