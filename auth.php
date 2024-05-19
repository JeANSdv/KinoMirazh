<?php
include "components/header.php";

if (isset($_SESSION['km_auth'])){
    if($_SESSION['km_auth']){
        header("Location: personal.php");
    }
}
?>

<div class="signin-main">

    <?php
    $pmsg = $_SESSION['cl_reg'] ?? '';
    echo "<span>$pmsg</span>";
    unset($_SESSION['cl_reg']);
    ?>

    <span>ВХОД В ЛИЧНЫЙ КАБИНЕТ</span>

    <form action="controllers/signin.php" method="POST">
        <input type="email" required name="email" placeholder="Логин/Электронная почта">
        <input type="password" required name="pass" placeholder="Пароль">
        <?php 
			$msg = $_SESSION['cl_err_msg'] ?? '';
			echo "<p style='color: red'>$msg</p>";
			unset($_SESSION['cl_err_msg']);
		?>
        <input class="submi" type="submit" value="Войти">
    </form>

    <div class="gotoreg"> 
        <span>Нет аккаунта? Вы можете зарегистрироваться</span>
        <a href="registration.php"><button>РЕГИСТРАЦИЯ</button></a>
    </div>
</div>

