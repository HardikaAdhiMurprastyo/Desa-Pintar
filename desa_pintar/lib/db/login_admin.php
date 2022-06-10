<?php 
include 'conn.php';
$username = isset($_POST['username']) ? $_POST['username'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';;
$queryResult=$connect->query("SELECT * FROM admin_account WHERE username='".$username."' && password='".$password."' ");

$result=array();
while($fetchData= mysqli_fetch_array($queryResult)){
	$result[]=$fetchData;
}
echo json_encode($result);
 ?>