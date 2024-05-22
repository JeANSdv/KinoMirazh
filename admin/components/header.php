<?php
session_start();
require_once "controllers/connect.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Панель управления</title>
    <link rel="stylesheet" href="assets/CSS/style.css">
</head>
<body>

<!-- HEADER -->
<header>
    <!-- navigation -->
    <nav class="navigation">
        <a href="index.php"><button class="nav-button">Дашборд</button></a>
        <a href="session-manage.php"><button class="nav-button">Сеансы</button></a>
        <a href="ticket-manage.php"><button class="nav-button">Билеты</button></a>
    </nav>
</header>
</body>
</html>