<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
//session_start();
$conexion = mysqli_connect($host, $usuario, $clave, $bd, 3307);
mysqli_query($conexion, "set names 'utf8'");

	$sql = "SELECT * from Products";

	$result = mysqli_query($conexion, $sql);
	if (mysqli_num_rows($result)>0) {
		while($row = $result->fetch_assoc()) {
            $datos["Productos"][] = $row;
		}
		echo json_encode($datos);
    }
    else{
        echo "No se obtuvieron datos";
	} 

	mysqli_close($conexion);
?>