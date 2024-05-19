<?php
session_start();
require "connect.php";

$uname = $_POST['name'] ?? '';
$usname = $_POST['surname'] ?? '';
$email = $_POST['email'] ?? '';
$pass = $_POST['password'] ?? '';
$repass = $_POST['repass'] ?? '';
$phone = $_POST['phone'] ?? '';
$birth = $_POST['birth'] ?? '';

// Проверка пароля
if (strlen($pass) < 7){
    $_SESSION['cl_err_msg']['pass'] = "Пароль должен быть из 7 символов и больше!";
}
elseif (str_contains($pass, 'qwerty')){
    $_SESSION['cl_err_msg']['pass'] = "Пароль не должен содеражать 'qwerty'!";
}
elseif (!(str_contains($pass, '1') 
or str_contains($pass, '2') 
or str_contains($pass, '3') 
or str_contains($pass, '4') 
or str_contains($pass, '5') 
or str_contains($pass, '6') 
or str_contains($pass, '7') 
or str_contains($pass, '8') 
or str_contains($pass, '9') 
or str_contains($pass, '0'))){
    $_SESSION['cl_err_msg']['pass'] = "Пароль должен содержать хотя бы одну цифру!";
}
if ($pass != $repass){
    $_SESSION['cl_err_msg']['repass'] = "Пароли не совпадают!";
}

// проверка даты
$now = time();
$us_date = strtotime($birth);
$date_diff = floor(($now - $us_date)/(60*60*24));
if ($birth == 0){
    $_SESSION['cl_err_msg']['birth'] = "Укажите дату рождения!";
}
// 5110 days = 14 years
elseif ($date_diff < 5110){
    $_SESSION['cl_err_msg']['birth'] = "Вы должны быть старше 14 лет";
}


$query = "SELECT email FROM customer WHERE email = ?";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "s", $email);
mysqli_stmt_execute($stmt);
mysqli_stmt_store_result($stmt);
$num_rows = mysqli_stmt_num_rows($stmt);
if ($num_rows > 0){
    $_SESSION['cl_err_msg']['email'] = "Пользователь с такой почтой уже существует.";
}

if (isset($_SESSION['cl_err_msg'])){
    if ($_SESSION['cl_err_msg']){
        header("Location: ../registration.php");
        die ('Sometimes, i dream about cheese...');
    }
}

$pass = password_hash($pass, PASSWORD_DEFAULT);

$query = "INSERT INTO `customer` (`name`, `surname`, `email`, `password`, `phone_number`, `birth_date`) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "ssssss", $uname, $usname, $email, $pass, $phone, $birth);
if(mysqli_stmt_execute($stmt)){
    $_SESSION['cl_reg'] = "Вы зарегистрированы, теперь можете войти!";
    header("Location:../auth.php");
}
