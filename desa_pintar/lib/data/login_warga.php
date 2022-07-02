<?php 
include 'conn.php';
$nik = isset($_POST['NIK']) ? $_POST['NIK'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';;
$queryResult=$connect->query("SELECT * FROM warga WHERE NIK='".$nik."' && password='".$password."' ");

$result=array();
while($fetchData= mysqli_fetch_array($queryResult)){
	$result[]=$fetchData;
}
echo json_encode($result);
 ?>