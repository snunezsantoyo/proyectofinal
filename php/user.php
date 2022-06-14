<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
//session_start();
$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);
$id = $_GET['id'];
mysqli_query($conexion, "set names 'utf8'");
	$sql = "SELECT Product_ID, UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification.Classification_ID, Clasificacion FROM Products inner join Classification on Classification.Classification_ID= Products.Classification_ID WHERE Products.UserInfo_ID=$id and estatus=1 order by ProductName asc";
	$result = mysqli_query($conexion, $sql);
	if (mysqli_num_rows($result)>0) {
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