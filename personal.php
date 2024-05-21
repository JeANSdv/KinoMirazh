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

?>

<div class="personal-main">

    <h1>Здравствуйте, <?= $res['name']; ?>! </h1>

    <form class="block-buttons" method="GET">
        <input type="submit" name="page" value="Билеты">
        <input type="submit" name="page" value="История оплаты">
        <input type="submit" name="page" value="Личные данные">
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
            // 
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