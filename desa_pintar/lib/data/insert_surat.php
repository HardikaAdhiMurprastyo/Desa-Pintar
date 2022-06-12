<?php

    $connection = new mysqli("localhost", "root", "", "desa_pintar");
    $no_surat = isset($_POST['no_surat']) ? $_POST['no_surat']: ''; 
    $level    = 1;
    $status   = "Diajukan";
    $date     = date('Y-m-d');
    $time     = time();
    $jenis    = isset($_POST['jenis_surat']) ? $_POST['jenis_surat']: '';
    $nik      = isset($_POST['NIK']) ? $_POST['NIK']: '';

    $result = mysqli_query($connection, "insert into surat set no_surat='$no_surat', level_surat='$level', status_surat='$status', tanggal_surat='$date', waktu_pengajuan = CURTIME(), jenis_surat='$jenis', NIK='$nik'");
    
    if($result){
        echo json_encode([
            'message' => 'Data input successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to input'
        ]);
    }