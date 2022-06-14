<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
//session_start();

$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);
$id = $_GET['id'];
mysqli_query($conexion, "set names 'utf8'");

	$sql = "UPDATE Products set estatus=0 where Product_ID='".$id."';";
	$result = mysqli_query($conexion, $sql);
	if($result){
        echo "Correcto";
    }
    else{
        echo "Error";
    }

	mysqli_close($conexion);
?>
