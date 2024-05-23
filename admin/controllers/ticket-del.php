<?php
session_start();
require "connect.php";
if (isset($_GET['id']) and isset($_GET['session'])){
    if ($_GET['id']){
        $ticket = $_GET['id'];
        $query = "DELETE FROM ticket WHERE ticket_id = $ticket";
        if (mysqli_query($conn, $query)){
            header("Location: ../ticket-manage.php?id=$_GET[session]");
            exit;
        }
        else {
            header("Location: ../index.php");
            exit;
        }
    }
    else {
        header("Location: ../ticket-manage.php");
        exit;
    }
}
else {
    header("Location: ../ticket-manage.php");
    exit;
}