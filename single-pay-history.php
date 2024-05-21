<?php
session_start();

if (!(isset($_SESSION['km_auth']))){
    header("Location: auth.php");
}

$cust_id = $_SESSION['km_auth'];

if (!(isset($_GET['id'])) or !($_GET['id'])){
    header("Location: personal.php?page=История+оплаты");
}


include "components/header.php";

$query1 = "SELECT p.payment_id, c.name, c.surname, p.payment_date, pm.payment_method, p.amount FROM `payment` AS p 
JOIN payment_method AS pm ON p.payment_method = pm.pmethod_id 
JOIN customer AS c ON p.customer_id = c.customer_id 
WHERE p.customer_id=$cust_id AND payment_id=$_GET[id]";
$res1 = mysqli_query($conn, $query1);
if (!$res1) die('i ill have two number nine...');



?>

<div class="s-pay-hist-main">
    <a href="personal.php?page=История+оплаты"><button>Вернуться назад</button></a>
    <div>
    <?php
    $num_rows = mysqli_num_rows($res1);
    if ($num_rows > 0){
        $check = mysqli_fetch_array($res1, MYSQLI_ASSOC);
        $date = date_format(date_create($check['payment_date']), 'H:i:s d.m.Y');
        $check_html = <<<_CHK
            <span>Номер оплаты: $check[payment_id]</span>
            <span>Дата и время: $date</span>
            <span>Заказчик: $check[name] $check[surname]</span>
            <span>Способ оплаты: $check[payment_method]</span>
            <span>Сумма: $check[amount]</span>
            <span>Услуги:</span>
        _CHK;
        echo $check_html;
        $query2 = "SELECT pr.price, op.option_name, ss.session_date, f.title, f.age_rating 
        FROM payment_price AS pp 
        JOIN payment AS p ON pp.payment_id=p.payment_id 
        JOIN price AS pr ON pr.price_id=pp.payment_id 
        JOIN `price_option` AS op ON pr.option_id = op.option_id 
        JOIN `session` AS ss ON pr.session_id = ss.session_id 
        JOIN film AS f ON ss.film_id = f.film_id 
        WHERE pp.payment_id = $check[payment_id]";
        $res2 = mysqli_query($conn, $query2);
        if (!$res2) die('number nine large, two numbers fourty five');
        $num_rows = mysqli_num_rows($res2);
        for ($i=0; $i<$num_rows; $i++){
            $service = mysqli_fetch_array($res2, MYSQLI_ASSOC);
            $service_time = date_format(date_create($service['session_date']), 'G:i j.m.y');
            $service_html = <<<_TICKET
                <div class="service">
                    <span>Билет на: $service[title] $service[age_rating]</span>
                    <span>$service_time</span>
                    <span>$service[option_name]</span>
                    <span>Цена: $service[price]</span>
                </div>
            _TICKET;
            echo $service_html;
        }
    }
    else {
        echo "<span>Ошибка!</span>";
    }
    ?>
    </div>
</div>



