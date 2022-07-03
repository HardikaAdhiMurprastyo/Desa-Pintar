<?php 
include 'conn.php';
$nik = isset($_POST['NIK']) ? $_POST['NIK']:'';
$password = isset($_POST['password']) ? $_POST['password']: '';
$queryResult=$connect->query("SELECT * FROM warga WHERE NIK='".$nik."' and password='".$password."' ");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
 ?>