<?php

$connection = new mysqli("localhost", "root", "", "db_dpin");
$data       = mysqli_query($connection, "select * from surat ORDER BY tanggal_surat DESC;");
$data       = mysqli_fetch_all($data, MYSQLI_ASSOC);

echo json_encode($data);