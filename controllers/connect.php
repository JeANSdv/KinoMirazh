<?php
    $host = 'localhost';
    $db = 'kinomirage';
    $user = 'root';
    $pass = '';
    
    $conn = mysqli_connect($host, $user, $pass, $db);
    if ($conn->connect_error) die("sht");
?>