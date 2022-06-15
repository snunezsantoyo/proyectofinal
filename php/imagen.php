<?php
    $coded = file_get_contents("php:input");
    $image = base64_decode($coded);
    file_put_contents("../img/Fotos/producto.jpeg", $image);
    ?>
