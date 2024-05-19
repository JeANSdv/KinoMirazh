<?php 
session_start(); 
unset($_SESSION['km_auth']);
header("Location:../auth.php");
?>