<?php
require "../config/conn.php";
if ($_SERVER['REQUEST_METHOD']=="POST"){
    $response = array();
    $nik = isset($_POST['NIK']) ? $_POST['NIK']: '';
    $password = isset($_POST['password']) ? $_POST['password']: '';
    
    
    $cekNIK ="SELECT * FROM warga WHERE NIK ='$nik' and password='$password'";
    $result = mysqli_fetch_array(mysqli_query($connect, $cekNIK));

    if(isset($result)) {
        $response['value']= 1;
        $response['message']="login berhasil";
        echo json_encode($response);
    } else {
        $response['value']= 0;
        $response['message']="login gagal";
        echo json_encode($response);
    }
}

?>