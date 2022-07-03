<?php 
$connect = mysqli_connect("localhost","root","","db_dpin");
if($connect){
}else{
	echo "Connection Failed";
	exit();
}