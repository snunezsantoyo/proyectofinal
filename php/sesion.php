<?php
                session_start();
                //$t = $_POST['texto'];
                if(!isset($_SESSION['userID'])){
                        echo "Error";
                        //header("location: ../login.html");

                }
                else{
                        //header("location: ../PagPrincipal.html");
                        echo $_SESSION['userID'];
                }
?>
