<?php
session_start();
require "connect.php";
if (isset($_GET['id'])){
    if ($_GET['id']){
        $ticket = $_GET['id'];
        $query = "DELETE FROM ticket WHERE ticket_id = $ticket";
        if (mysqli_query($conn, $query)){
            header("Location: ../personal.php?page=Билеты");
            exit;
        }
        else {
            header("Location: ../index.php");
            exit;
        }
    }
    else {
        header("Location: ../index.php");
        exit;
    }
}
else {
    header("Location: ../index.php");
    exit;
}