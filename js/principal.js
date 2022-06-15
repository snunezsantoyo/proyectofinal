window.onload=inicio;
var ID=0;
var baseDatos;
var buscar="";
var op="x";
var total;

function inicio() {
                $.post("php/sesion.php",{},function(data){
            ID=data;
            //alert(data);

            if(data == "Error"){
            window.location="./index.html";
            }
            else{
                cargar();
            }
    });
        /*var cadVariables = location.search.substring(1,location.search.length);
    var arrVariables = cadVariables.split("&");
    for (i=0; i<arrVariables.length; i++) {
      var arrVariableActual = arrVariables[i].split("=");
      if (isNaN(parseFloat(arrVariableActual[1])))
        eval(arrVariableActual[0]+"='"+unescape(arrVariableActual[1])+"';");
      else
        eval(arrVariableActual[0]+"="+arrVariableActual[1]+";");
    }
    //user = parseInt(user);
    ID = user;
    cargar();
    /*if(E_p!='x'){
        mostrar(E_p);
    }*/
};
function cargar(){
    document.getElementById('btn-buscar').onclick = b1;
    busqueda(op, buscar);
}
function b1(){
    op="x";
    buscar = $("#label-buscar").val();
    busqueda(op, buscar);
}
function b2(buscar){
    op="y";
    busqueda(op, buscar);
}
function busqueda(op, buscar) {
    $('#section-productos').empty();
    $.post('php/productos.php', {
        "buscar": buscar,
        "op": op
      }, function(datos){
        //alert(datos);
        baseDatos = JSON.parse(datos);
        total = baseDatos["Productos"].length;
        document.getElementById('articulos').innerHTML = total;
        for(var i=0;i<total;i++){
            $('#section-productos').append(' '
            +'<div class="card" style="width: 18rem; height: 29rem">'
            +'<figure><img src="'+baseDatos["Productos"][i].Photo+'" style="width: 16rem; height: 16rem"></figure>'
            +'<div class="card-body"><h5 class="card-title" align="center" style="height: 4rem">'+baseDatos["Productos"][i].ProductName+'</h5>'
            +'<div class="row"><div class="col-sm-6"><a id="price">$'+baseDatos["Productos"][i].value+'</a></div><div class="col-sm-6"><button align="center" type="button" class="btn btn-info b-info" onclick="modalinfo('+i+')" data-toggle="modal" data-target="#myModal">'
            +'Información</button></div></div></div></div>');
        }
    });
    }
function modalinfo(id) {
    document.getElementById('titulo-modal').innerHTML = baseDatos["Productos"][id].ProductName;
    document.getElementById('descripcion').innerHTML = baseDatos["Productos"][id].Description;
    document.getElementById('precio').innerHTML = baseDatos["Productos"][id].value;
    document.getElementById('categoria').innerHTML = baseDatos["Productos"][id].Clasificacion;
    //document.getElementById('vendedor').innerHTML = baseDatos["Productos"][id].Name+" "+baseDatos["Productos"][id].LastName+" "+baseDatos["Productos"][id].LastName_2;
    //document.getElementById('tel').innerHTML = baseDatos["Productos"][id].PhoneNumber;
    //document.getElementById('correo').innerHTML = baseDatos["Productos"][id].Email;
    //document.getElementById('comprar').onclick = comprar;
    document.getElementById('modalfoto').src = baseDatos["Productos"][id].Photo;
}
function comprar(){
    $('#modal_compra').modal('show');
}

function enviarVariables(){
    var user = ID;
    var pagina ="PlUser.html?";
    var valores = "user";
    var nomVec= valores.split(",");
    for (i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
}
function actualizar(){
    location.reload();
}

