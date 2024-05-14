<?php
session_start();
require_once "controllers/connect.php"

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Сеть кинотеатров КИНОМИРАЖ</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/slider.css">
</head>
<body>

<!-- HEADER -->
<header>
    <!-- logo -->
    <div class="header-logo"><img class="header-logo" src="assets/img/kinotextlogo.png" alt=""></div>
    <!-- navigation -->
    <div class="nav">
        <nav>
            <ul class="nav_ul">
                <li><a href=""><button class="nav-button">Главная</button></a></li>
                <li><a href=""><button class="nav-button">Сеансы</button></a></li>
                <li><a href=""><button class="nav-button">Кафетерий</button></a></li>
            </ul>
        </nav>
    </div>
    <!-- socialnet -->
    <div class="socialnet">
        <a href=""><img class="social" src="assets/img/ico/ico-vk.png"></a>
        <a href=""><img class="social" src="assets/img/ico/ico-tg.png"></a>
    </div>
    <!-- personal -->
    <div class="personal">
        <a href=""><button class="personal-button"><div><img src="assets/img/ico/personal-ico.png">Войти</div></button></a>
    </div>
</header>
</body>
</html>