<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
//session_start();

$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);

$id = $_POST['id'];
$Name = $_POST['Name'];
$LastName = $_POST['LastName'];
$LastName_2 = $_POST['LastName_2'];
$PhoneNumber = $_POST['PhoneNumber'];
$Age = $_POST['Age'];
$Email = $_POST['Email'];
$Password = $_POST['Password'];
$Username = $_POST['Username'];

mysqli_query($conexion, "set names 'utf8'");

    if($id == 0){
        $sql= "INSERT INTO UserInfo (Name, LastName, LastName_2, PhoneNumber, Age) VALUES ('".$Name."', '".$LastName."', '".$LastName_2."', '".$PhoneNumber."', '".$Age."')";
        $result1 = mysqli_query($conexion, $sql);
        $consulta = mysqli_query($conexion, "SELECT * from UserInfo");
        $i = mysqli_num_rows($consulta);
        $sql = "INSERT INTO UserLog (UserInfo_ID, Email, Password, Username) VALUES ('".$i."', '".$Email."', '".$Password."', '".$Username."')";
        $result2 = mysqli_query($conexion, $sql);
    }
    else{
        $sql = "UPDATE UserInfo SET Name='$Name', LastName='$LastName', LastName_2='$LastName_2', PhoneNumber='$PhoneNumber', Age='$Age'  WHERE UserInfo_ID='".$id."';";
        $result1 = mysqli_query($conexion, $sql);
        $sql = "UPDATE UserLog SET Email='".$Email."', Password='".$Password."', Username='".$Username."'  WHERE  UserInfo_ID='".$id."';";
        $result2 = mysqli_query($conexion, $sql);
    }
    
	//echo mysqli_errno($conexion) . ": " . mysqli_error($conexion);
    if($result1&&$result2){
        echo "Correcto";
    }
    else{
        echo "Error";
    }
?>
