window.onload=inicio;
function inicio() {
    var ID=0;
		$.post("php/sesion.php",{},function(data){
            ID=data;
            //alert(data);
            if(!data){
                window.location="./login.html";
            }
		});
};
 