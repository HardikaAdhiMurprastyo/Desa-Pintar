<?php 

    $connection = new mysqli("localhost","root","","desa_pintar");
    $data       = mysqli_query($connection, "select * from surat");
    $data       = mysqli_fetch_all($data, MYSQLI_ASSOC);

    echo json_encode($data);