<?php

$connection = new mysqli("localhost", "root", "", "db_dpin");

$no_surat = isset($_POST['no_surat']) ? $_POST['no_surat'] : '';

$result = mysqli_query($connection, "delete from surat where no_surat=" . $no_surat);

if ($result) {
    echo json_encode([
        'message' => 'Data delete successfully'
    ]);
} else {
    echo json_encode([
        'message' => 'Data Failed to delete'
    ]);
}