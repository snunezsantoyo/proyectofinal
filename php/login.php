<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
session_start();
//$conexion = mysqli_connect($host, $usuario, $clave, $bd, 3307);

$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);

$Email = addslashes($_POST['user']);
$Password = addslashes($_POST['password']);
mysqli_query($conexion, "set names 'utf8'");

//$q = "SELECT COUNT(*) as contar FROM userlog where Email='$Email' and Password='$Password'";
$q = "SELECT UserInfo_ID FROM UserLog WHERE Email='".$Email."' AND Password='".$Password."';";
$consulta = mysqli_query($conexion, $q);



if (!$consulta || mysqli_num_rows($consulta)==0){
    echo 0;
    //header("location: ../login.html");
}
else{
        /*while($row = $consulta->fetch_assoc()){
                $datos["Login"][] = $row;

        }
        echo json_encode($datos);*/

    $row = mysqli_fetch_assoc($consulta);
    $userID = $row['UserInfo_ID'];
    //$pre_has = $row['pre_has'];
    $_SESSION['userID'] = $userID;
    //header("location: ../PagPrincipal.html");
    echo $userID;
}
mysqli_close($conexion);

?>

