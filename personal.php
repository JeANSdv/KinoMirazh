<?php
include "components/header.php";

if (!(isset($_SESSION['km_auth']))){
    header("Location: auth.php");
}

$cust_id = $_SESSION['km_auth'];

$query = "SELECT customer_id, `name` FROM customer WHERE customer_id=$cust_id";
$res = mysqli_query($conn, $query);
if (!$res) die ('el Barto');
$res = mysqli_fetch_array($res, MYSQLI_ASSOC);

if (isset($_GET['page'])){
    $actual_page = $_GET['page'];
    $cls1 = $actual_page == "Билеты" ? 'active' : '';
    $cls2 = $actual_page == "История оплаты" ? 'active' : '';
    $cls3 = $actual_page == "Личные данные" ? 'active' : '';
}
else {
    $cls1 = 'active';
}


?>

<div class="personal-main">

    <h1>Здравствуйте, <?= $res['name']; ?>! </h1>

    <form class="block-buttons" method="GET">
        <input class="<?= $cls1 ?>" type="submit" name="page" value="Билеты">
        <input class="<?= $cls2 ?>" type="submit" name="page" value="История оплаты">
        <input class="<?= $cls3 ?>" type="submit" name="page" value="Личные данные">
        <a href="controllers/pers-exit.php"><input type="button" value="Выйти из аккаунта"></a>
    </form>  

    <?php
    if (isset($_GET['page'])){
        if ($_GET['page'] == "Билеты"){
            include "components/tickets.php";
        }
        elseif ($_GET['page'] == "История оплаты"){
            include "components/pay-history.php";
        }
        elseif ($_GET['page'] == "Личные данные"){
            include "components/personal-data.php";
        }
        else {
            include "components/tickets.php";
        }
    }
    else {
        include "components/tickets.php";
    }
    ?>

</div>