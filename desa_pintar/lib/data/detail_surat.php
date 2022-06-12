<?php 

    $connection = new mysqli("localhost","root","","desa_pintar");
    $data       = mysqli_query($connection, "select * from surat where no_surat=".$_GET['no_surat']);
    $data       = mysqli_fetch_array($data, MYSQLI_ASSOC);

    echo json_encode($data);