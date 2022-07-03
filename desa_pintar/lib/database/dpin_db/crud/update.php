<?php

    $connection = new mysqli("localhost", "root", "", "note_app");
    $title      = isset($_POST['title']) ? $_POST['title']:''; 
    $content    = isset($_POST['content']) ? $_POST['content']:'';
    $id         = isset($_POST['id']) ? $_POST['id']:'';
        
    $result = mysqli_query($connection, "update note set title='$title', content='$content' where id='$id'");
        
    if($result){
        echo json_encode([
            'message' => 'Data edit successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to update'
        ]);
    }