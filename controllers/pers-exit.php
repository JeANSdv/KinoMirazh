<?php 
session_start(); 
unset($_SESSION['km_auth']);
if (isset($_SESSION['km_isadm'])){
    unset($_SESSION['km_isadm']);
}
header("Location:../auth.php");
?>