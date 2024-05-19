<?php
include "components/header.php"
?>

<style>
    small {
        color: red;
    }
</style>

<form action="controllers/signup.php" class="reg-form" method="POST">
    <span>РЕГИСТРАЦИЯ</span>
    <input type="text" required name="name" placeholder="Имя">
    <input type="text" required name="surname" placeholder="Фамилия">
    <small>
    <?php
        $msg = $_SESSION['cl_err_msg']['email'] ?? '';
        echo $msg;
    ?>
    </small>
    <input type="email" required name="email" placeholder="Электронная почта">
    <small>
    <?php
        $msg = $_SESSION['cl_err_msg']['pass'] ?? '';
        echo $msg;
    ?>
    </small>
    <input type="password" required name="password" placeholder="Придумайте пароль">
    <small>
    <?php
        $msg = $_SESSION['cl_err_msg']['repass'] ?? '';
        echo $msg;
    ?>
    </small>
    <input type="password" required name="repass" placeholder="Повторите пароль">
    <input type="text" required name="phone" placeholder="Номер телефона">
    <label for="birth">Ваша дата рождения:</label>
    <small>
    <?php
        $msg = $_SESSION['cl_err_msg']['birth'] ?? '';
        echo $msg;
    ?>
    </small>
    <input type="date" required id="birth" name="birth">
    <input class="submi" type="submit" value="Зарегистрироваться">
    <?php
        unset($_SESSION['cl_err_msg']);
    ?>
</form>