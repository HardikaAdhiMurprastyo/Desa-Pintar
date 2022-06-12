<?php

    $connection = new mysqli("localhost", "root", "", "desa_pintar");
    $pass      = isset($_POST['password']) ? $_POST['password']:''; 
    $nik      = isset($_POST['NIK']) ? $_POST['NIK']: '';
        
    $result = mysqli_query($connection, "update warga set password='$pass' where NIK='$nik'");
        
    if($result){
        echo json_encode([
            'message' => 'Data edit successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to update'
        ]);
    }