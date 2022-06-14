window.onload = inicio;

var baseDatos;

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
    if(E_v!=0){
        mostrar(E_v);
    }
}
function mostrar(E_v){
    //alert(E_v);
    $.get("./php/infoUser.php?id="+E_v, function(datos){
        baseDatos = JSON.parse(datos);
        document.getElementById('fname').value = baseDatos["Vendedor"][0].Name;
        document.getElementById('lname').value = baseDatos["Vendedor"][0].LastName;
        document.getElementById('lname2').value = baseDatos["Vendedor"][0].LastName_2;
        document.getElementById('user').value = baseDatos["Vendedor"][0].Username;
        document.getElementById('phone').value = baseDatos["Vendedor"][0].PhoneNumber;
        document.getElementById('email').value = baseDatos["Vendedor"][0].Email;
        document.getElementById('pass').value = baseDatos["Vendedor"][0].Password;
        document.getElementById('birt').value = baseDatos["Vendedor"][0].Age;
    });
}

function guardar(){
    var v1 = $('#fname').val();
	var v2 = $('#lname').val();
    var v3 = $('#lname2').val();
    var v4 = $('#user').val();
	var v5 = $('#phone').val();
    var v6 = $('#email').val();
    var v7 = $('#pass').val();
    var v8 = $('#birt').val();

    if(v1.length !=0 && v2.length !=0 && v3.length !=0 && v4.length !=0 && v5.length !=0 && v6.length !=0 && v7.length !=0 && v8.length !=0){

    $.post("./php/guardarUsuario.php",{id:E_v, Name:v1, LastName:v2, LastName_2:v3, PhoneNumber:v5, Age:v8, Email:v6, Password:v7, Username:v4}, function(respuesta){
        //alert(respuesta);
	if(respuesta=="Error"){
            document.getElementById('mensaje').innerHTML="No se pudo guardar la información";
            $('#modal_falla').modal('show');
        }
        else{
            document.getElementById('mensaje').innerHTML="Información guardada correctamente";
            $('#modal_falla').modal('show');
            aceptar();
            
        }});
    }
    else{
        document.getElementById('mensaje').innerHTML="Llena todos los campos";
        $('#modal_falla').modal('show');
    }
}
function aceptar(){
    $("#modal_falla").on('hidden.bs.modal', function () {
        //alert("Esta accion se ejecuta al cerrar el modal")
        window.history.back();
    });

}
function cancelar(){
    window.history.back();
}
