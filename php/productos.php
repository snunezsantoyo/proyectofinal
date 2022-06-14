<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
//session_start();

$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);
//$buscar = 0;
//$op =  0;
$buscar = addslashes($_POST['buscar']);
$op = addslashes($_POST['op']);

mysqli_query($conexion, "set names 'utf8'");
if($op == "x"){
        $sql = "SELECT Product_ID, Products.UserInfo_ID, Photo, ProductName, Description, value, Stock, Clasificacion, Name, LastName, LastName_2, PhoneNumber, Email FROM ((Products inner join  Classification on Classification.Classification_ID= Products.Classification_ID ) inner join UserInfo on Products.UserInfo_ID=UserInfo.UserInfo_ID)inner join UserLog on UserInfo.UserInfo_ID=UserLog.UserInfo_ID WHERE ProductName Like '%".$buscar."%' and estatus=1 order by ProductName asc;";
        }
else{
        if($buscar == "Todos"){
                $sql = "SELECT Product_ID, Products.UserInfo_ID, Photo, ProductName, Description, value, Stock, Clasificacion, Name, LastName, LastName_2, PhoneNumber, Email FROM ((Products inner join Classification on Classification.Classification_ID= Products.Classification_ID ) inner join UserInfo on Products.UserInfo_ID=UserInfo.UserInfo_ID)inner join UserLog on UserInfo.UserInfo_ID=UserLog.UserInfo_ID where estatus=1 order by ProductName asc;";
        }
        else{
                $sql = "SELECT Product_ID, Products.UserInfo_ID, Photo, ProductName, Description, value, Stock, Clasificacion, Name, LastName, LastName_2, PhoneNumber, Email FROM ((Products inner join Classification on Classification.Classification_ID= Products.Classification_ID ) inner join UserInfo on Products.UserInfo_ID=UserInfo.UserInfo_ID)inner join UserLog on UserInfo.UserInfo_ID=UserLog.UserInfo_ID WHERE Clasificacion Like '%".$buscar."%' and estatus=1 order by ProductName asc;";
        }
}

        $result = mysqli_query($conexion, $sql);
        if ($result->num_rows>0) {
                while($row = mysqli_fetch_assoc($result)) {
            $datos["Productos"][] = $row;
                }
                echo json_encode($datos);
    }
    else{
        echo "No se obtuvieron datos";
        }

        mysqli_close($conexion);
?>
