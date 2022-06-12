<?php

    $connection = new mysqli("localhost", "root", "", "desa_pintar");
    $no_surat = isset($_POST['no_surat']) ? $_POST['no_surat']: ''; 
    $level    = isset($_POST['level']) ? $_POST['level']: '';
    $status   = isset($_POST['status']) ? $_POST['status']: '';
    $date     = date('Y-m-d');
    $jenis    = isset($_POST['jenis_surat']) ? $_POST['jenis_surat']: '';
    $nik      = isset($_GET['NIK']) ? $_GET['NIK']: '';

    $result = mysqli_query($connection, "insert into surat set no_surat='$no_surat', level='$level', status='$status', tanggal_surat='$date', jenis_surat='$jenis', NIK='$nik'");
    
    if($result){
        echo json_encode([
            'message' => 'Data input successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to input'
        ]);
    }