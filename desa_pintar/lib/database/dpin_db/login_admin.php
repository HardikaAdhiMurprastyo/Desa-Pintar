<?php 
include 'conn.php';
$username = isset($_POST['username']) ? $_POST['username']:'';
$password = isset($_POST['password']) ? $_POST['password']: '';
$queryResult=$connect->query("SELECT * FROM admin WHERE username='".$username."' and password='".$password."' ");

$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
 ?>