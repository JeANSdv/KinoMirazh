<?php
session_start();
require "connect.php";

$email = $_POST['email'];
$pass = $_POST['pass'];

$query = "SELECT customer_id, email, `password`, `rank` FROM customer WHERE email=?";
$stmt = mysqli_prepare($conn, $query);
if (!$stmt) die ('prepare_err');

mysqli_stmt_bind_param($stmt, 's', $email);
mysqli_stmt_execute($stmt);

$res = mysqli_stmt_get_result($stmt);

$numrows = mysqli_num_rows($res);
if ($numrows>0){
    $fetch = mysqli_fetch_array($res, MYSQLI_ASSOC);
    $hash = $fetch['password'];
    if (password_verify($pass, $hash)){
        $_SESSION['km_auth'] = $fetch['customer_id'];
        if ($fetch['rank'] == "admin"){
            $_SESSION['km_isadm'] = $fetch['customer_id'];
            header('Location: ../admin/index.php');
            exit;
        }
        else {
            header('Location: ../personal.php');
            exit;
        }
    }
    else {
        $_SESSION['cl_err_msg'] = 'Неверные логин или пароль';
        header('Location: ../auth.php');
        exit;
    }
}
else {
    $_SESSION['cl_err_msg'] = 'Неверные логин или пароль';
    header('Location: ../auth.php');
    exit;
}