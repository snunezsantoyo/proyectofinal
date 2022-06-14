window.onload=inicio;
var E_p; //id_producto
var E_v; //id_vendedor
var baseDatos;
var vendedor;
//var buscar="";
//var op=1;
var pagina;
var valores;

function inicio() {
		$.post("php/sesion.php",{},function(data){
            //alert(data);
            //console.log(data);
            if(data=="Error"){
                window.location="./index.html";
            }
            else{
                E_v=data;
                //alert(E_v);
                cargar();
            }
        });
        var cadVariables = location.search.substring(1,location.search.length);
    var arrVariables = cadVariables.split("&");
    for (i=0; i<arrVariables.length; i++) {
      var arrVariableActual = arrVariables[i].split("=");
      if (isNaN(parseFloat(arrVariableActual[1])))
        eval(arrVariableActual[0]+"='"+unescape(arrVariableActual[1])+"';");
      else
        eval(arrVariableActual[0]+"="+arrVariableActual[1]+";");
    } 
    E_v = user;
    //alert(E_v);
    cargar();
        
};
function cargar(){
    //document.getElementById('crear').onclick = pasarVariables(0);
    //document.getElementById('modificar').onclick = modificarUsuario();
    $('#table-products tbody').empty();
    $.get("./php/infoUser.php?id="+E_v, function(datos){
        //alert(datos);
        vendedor = JSON.parse(datos);
        document.getElementById('usuario').innerHTML = vendedor["Vendedor"][0].Username;
        document.getElementById('nombre').innerHTML = vendedor["Vendedor"][0].Name;
        document.getElementById('apellidos').innerHTML = vendedor["Vendedor"][0].LastName+" "+vendedor["Vendedor"][0].LastName_2;
        document.getElementById('fecha').innerHTML = vendedor["Vendedor"][0].Age;
        document.getElementById('correo').innerHTML = vendedor["Vendedor"][0].Email;
        document.getElementById('tel').innerHTML = vendedor["Vendedor"][0].PhoneNumber;
    });
    $.get("./php/user.php?id="+E_v, function(datos){
       	//alert(datos);
        if(datos!="No se obtuvieron datos"){
        baseDatos = JSON.parse(datos);
        var total = baseDatos["Productos"].length;
        for(var i=0;i<total;i++){
            $('#table-products > tbody:last-child').append(' '
            +'<tr class="table-info"><td>'+(i+1)+'</td><td>'+baseDatos["Productos"][i].ProductName+'</td>'
            +'<td><img src="'+baseDatos["Productos"][i].Photo+'" width="150" weight="150"></td>'
            +'<td>'+baseDatos["Productos"][i].Description+'</td><td>$'+baseDatos["Productos"][i].value+'</td>'
            +'<td>'+baseDatos["Productos"][i].Stock+'</td><td>'+baseDatos["Productos"][i].Clasificacion+'</td>'
            +'<td><button class="btn btn-warning" onclick="producto('+baseDatos["Productos"][i].Product_ID+')"><i class="fas fa-edit"></i></button> '
            +'<button class="btn btn-danger" onclick="borrar('+baseDatos["Productos"][i].Product_ID+')"><i class="fas fa-trash-alt"></i></button></td></tr>');
        }}
    });
}

function producto(aux) {
    E_p = aux;
    pagina ="formProd.html?";
    valores = "E_p,E_v";
    enviarVariables();
}
function usuario(){
    pagina ="formUser.html?";
    valores = "E_v";
    enviarVariables();
}
function enviarVariables(){
    nomVec= valores.split(",");
    for (i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
}

function borrar(id_producto) {
    $.get("./php/borrarProducto.php?id="+id_producto, function(datos){
        if(datos=="Error"){
            document.getElementById('mensaje').innerHTML = "El producto no pudo ser eliminado";
            $('#myModal').modal('show');
        }
        else{
            document.getElementById('mensaje').innerHTML = "Se eliminó correctamente el producto";
            $('#myModal').modal('show');
            cargar();
        }
    });
}