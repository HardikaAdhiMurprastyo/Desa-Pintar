<?php

    $connection = new mysqli("localhost", "root", "", "note_app");
    $title      = isset($_POST['title']) ? $_POST['title']: ''; 
    $content    = isset($_POST['content']) ? $_POST['content']: '';
    $date       = date('Y-m-d');
    
    $result = mysqli_query($connection, "insert into note set title='$title', content='$content', date='$date'");
    
    if($result){
        echo json_encode([
            'message' => 'Data input successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to input'
        ]);
    }