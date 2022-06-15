<?php
header('Content-type: text/html; charset=utf-8');
require 'conexion.php';
//session_start();

$conexion = mysqli_connect($host, $usuario, $clave, $bd, $puerto);

$id = $_POST['id'];
$n = $_POST['n'];
$ProductName = $_POST['ProductName'];
$Description  = $_POST['Description'];
$value = $_POST['value'];
$Stock  = $_POST['Stock'];
$Classification_ID = $_POST['Classification_ID'];
$UserInfo_ID = $_POST['UserInfo_ID'];
$i=0;

mysqli_query($conexion, "set names 'utf8'");

if($id == 0){
  $consulta = mysqli_query($conexion, "SELECT * from Products");
  $i = mysqli_num_rows($consulta)+1;
  $sql= "INSERT INTO Products(UserInfo_ID, Photo, ProductName, Description, value, Stock, Classification_ID, estatus) VALUES 
  ('$UserInfo_ID', './img/Fotos/producto$i.jpeg', '$ProductName', '$Description', '$value', '$Stock', '$Classification_ID', 1);";
  $result = mysqli_query($conexion, $sql);
  rename ("../img/Fotos/producto.jpeg", "../img/Fotos/producto$i.jpeg");
}
else{
  $sql = "UPDATE Products SET ProductName='$ProductName', Description='$Description', value='$value', Stock='$Stock', Classification_ID='$Classification_ID' where Product_ID=$id";
  $result = mysqli_query($conexion, $sql);
  if($n == 1){
    rename ("../img/Fotos/producto$id.jpeg", "../img/Fotos/producto0.jpeg");
    rename ("../img/Fotos/producto.jpeg", "../img/Fotos/producto$id.jpeg");
}
}

//echo mysqli_errno($conexion) . ": " . mysqli_error($conexion);
if($result){
  echo "Correcto";
}
else{
  echo "Error";
}

/*$sql= "select Max(UserInfo_ID) as mayor from userinfo";
  $rs=mysqli_query($conexion, $sql);
  if(isset($rs) && mysqli_num_rows($rs)>0)
  {
      $row=mysqli_fetch_array($rs);
      $num=$row['mayor'];
      mysqli_free_result($rs);
    //echo $num;*/
?>
