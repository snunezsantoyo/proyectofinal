window.onload=inicio;

function inicio() {
    document.getElementById('b1').onclick = verificar;
    document.getElementById('b2').onclick = registro;

}
function registro() {
    //window.location="./formUser.html";
    var pagina ="formUser.html?";
    var E_v = 0;
    var nombre ="E_v";
    var nomVec= nombre.split(",");
    for (var i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+ escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
}
function verificar() {
    $.post('php/login.php', {
        "user": $('#inputEmail').val(),
        "password": $('#inputPassword').val()
      },function(data) {
        //alert(data);
        if(!data){
            //console.log("todo bien , " + data);

            $('#modal_falla').modal('show');
            $('#inputEmail').val("");
            $('#inputPassword').val("");
        }
        else{
            //enviarVariables(aux2);
            //console.log("todo bien , " + data);
            window.location = "./PagPrincipal.html";
        }
        //window.$("#modal_falla").modal("show");
    });
}
/*function enviarVariables(data){
    var user = data;
    var pagina ="PagPrincipal.html?";
    var valores = "user";
    var nomVec= valores.split(",");
    for (i=0; i<nomVec.length; i++)
        pagina+=nomVec[i]+"="+escape(eval(nomVec[i]))+"&";
    pagina = pagina.substring(0, pagina.length-1);
    location.href=pagina;
}*/
