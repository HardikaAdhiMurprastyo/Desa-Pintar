<?php
require "../config/conn.php";
if ($_SERVER['REQUEST_METHOD']=="POST"){
    $response = array();
    $nik = isset($_POST['NIK']) ? $_POST['NIK']: '';
    $password = isset($_POST['password']) ? $_POST['password']: '';
    $nama = isset($_POST['nama']) ? $_POST['nama']: '';
    $jenisKelamin = isset($_POST['jenis_kelamin'])? $_POST['jenis_kelamin']: '';
    $alamat = isset($_POST['alamat'] ) ? $_POST['alamat']: '';
    $rt = isset ($_POST['rt']) ? $_POST['rt']: '';
    $rw = isset ($_POST['rw']) ? $_POST['rw']: '';;
    $kelurahan = isset ($_POST['kelurahan']) ? $_POST['kelurahan']: '';
    $tempatLahir = isset ($_POST['tempat_lahir']) ? $_POST['tempat_lahir']: '';
    $tanggalLahir = isset($_POST['tanggal_lahir']) ? $_POST['tanggal_lahir']: '';
    $statusKawin = isset($_POST['status_perkawinan']) ? $_POST['status_perkawinan']: '';
    $kewarganegaraan = isset($_POST['kewarganegaraan']) ? $_POST['kewarganegaraan']: '';
    $agama = isset($_POST['agama']) ? $_POST['agama']: '';
    
    $cekNIK ="SELECT * FROM warga WHERE NIK =$nik";
    $result = mysqli_fetch_array(mysqli_query($connect, $cekNIK));

    if(isset($result)) {
        $response['value']= 2;
        $response['message']="NIK sudah terdaftar";
        echo json_encode($response);
    } else {
        $insert ="INSERT INTO  warga VALUE('','$nik','$password','$nama', '$jenisKelamin', '$alamat', '$rt', '$rw', '$kelurahan', '$tempatLahir','$tanggalLahir', '$statusKawin', '$kewarganegaraan', '$agama')";
        if (mysqli_query($connect, $insert)){
            $response['value']= 1;
            $response['message']="Berhasil didaftarkan";
            echo json_encode($response);
        }else {
    
            $response['value']= 0;
            $response['message']="Gagal didaftarkan";
            echo json_encode($response);
        }
    }
}

?>