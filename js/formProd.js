window.onload = inicio;

var prod;
var nueva=0; 

function inicio() {
    var cadVariables = location.search.substring(1,location.search.length);
    var arrVariables = cadVariables.split("&");
    for (i=0; i<arrVariables.length; i++) {
      var arrVariableActual = arrVariables[i].split("=");
      if (isNaN(parseFloat(arrVariableActual[1])))
        eval(arrVariableActual[0]+"='"+unescape(arrVariableActual[1])+"';");
      else
        eval(arrVariableActual[0]+"="+arrVariableActual[1]+";");
    } 
    E_v = parseInt(E_v);
    E_p = parseInt(E_p);
    if(E_p!='x'){
        mostrar(E_p);
    }
   
}

function mostrar(E_p){
    $.get("./php/infoProducto.php?id="+E_p, function(datos){
        prod = JSON.parse(datos);
        document.getElementById('nombre').value = prod["Producto"][0].ProductName;
        document.getElementById('cantidad').value = prod["Producto"][0].Stock;
        document.getElementById('precio').value = prod["Producto"][0].value;
        document.getElementById('descripcion').value = prod["Producto"][0].Description;
        $("#opciones").val(prod["Producto"][0].Classification_ID);
    });
}

function send_file(){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
    var read = new FileReader();
    read.onload =  function(){
    var datos = read.result;
    var encoded = btoa(datos);
    nueva = 1;
        $.post("./php/imagen.php", encoded, function(){});
    
                        }
        read.readAsBinaryString(event.target.files[0]);
                        
    }
function guardar() {
    var v1 = $('#nombre').val();
	var v2 = $('#descripcion').val();
    var v3 = $('#precio').val();
    var v4 = $('#cantidad').val();
    var v5 = $('#opciones').val();
    if(v1.length !=0 && v2.length !=0 && v3.length !=0 && v4.length !=0){

    $.post("./php/guardarProducto.php",{id:E_p, n:nueva, UserInfo_ID:E_v, 
        ProductName:v1, Description:v2, value:v3, Stock:v4, Classification_ID:v5}, function(respuesta){
        //alert(respuesta);
            if(respuesta=="Error"){
                document.getElementById('mensaje').innerHTML="No se pudo guardar la información";
                $('#modal_falla').modal('show');
    }
    else{
        document.getElementById('mensaje').innerHTML="Información guardada correctamente";
            $('#modal_falla').modal('show');
            aceptar();}
    });
    }else{
        document.getElementById('mensaje').innerHTML="Llena todos los campos";
        $('#modal_falla').modal('show');
    }
    nueva = 0;
}
function aceptar(){
    $("#modal_falla").on('hidden.bs.modal', function () {
        //alert("Esta accion se ejecuta al cerrar el modal")
        window.history.back();
    });

}
function cancelar(){
    //window.location="./PlUser.html";
    window.history.back();
}