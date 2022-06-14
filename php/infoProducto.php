<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
session_start();

$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);

$id = $_GET['id'];
mysqli_query($conexion, "set names 'utf8'");
	$sql = "SELECT ProductName, Description, value, Stock, Classification_ID, estatus FROM Products WHERE Product_ID=$id";
	$result = mysqli_query($conexion, $sql);
	if (mysqli_num_rows($result)>0) {
		while($row = mysqli_fetch_assoc($result)) {
            $datos["Producto"][] = $row;
		}
		echo json_encode($datos);
    }
    else{
        echo "No se obtuvieron datos";
	} 

	mysqli_close($conexion);
?>