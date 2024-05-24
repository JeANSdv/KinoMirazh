<?php 
session_start();

if (!(isset($_SESSION['km_auth']))){
    header("Location: auth.php");
}

include "components/header.php";

$session_id = $_GET['id'];
$customer_id = $_SESSION['km_auth'];

$query = "SELECT f.title, f.age_rating, ss.session_date, cl.city, cl.street, cl.building, ch.number, pr.price_id, pr.price FROM `film` AS f 
JOIN `session` AS ss ON f.film_id = ss.film_id JOIN cinema_hall AS ch ON ss.hall_id=ch.hall_id 
JOIN cinema_location AS cl ON ch.location_id=cl.location_id JOIN price AS pr ON ss.session_id = pr.session_id WHERE ss.session_id = $session_id";
$res = mysqli_query($conn, $query);
if (!$res) die('wha are ya say about my ma? huh?');

$res = mysqli_fetch_array($res, MYSQLI_ASSOC);

$adress = "$res[city], $res[street] $res[building], Зал: $res[number]";
$time = date_format(date_create($res['session_date']), "d.m.Y H:i");
$title = "$res[title] $res[age_rating]";
$price = "$res[price]";
$price_id = "$res[price_id]";

?>

<form class="buy-ticket" method="POST">
    <span><?= $title ?></span>
    <span><?= $adress ?></span>
    <span><?= $time ?></span>
    <span><?= $price ?> рублей</span>
    <select name="seat">
		<option value="-1">--Выберите место в зале--</option>
		<?php
		$seatQuery = "SELECT hs.seat_id, hs.row, hs.seat FROM `hall_seats` AS hs 
        JOIN cinema_hall AS ch ON hs.hall_id = ch.hall_id JOIN `session` AS ss ON ch.hall_id = ss.hall_id 
        WHERE hs.seat_id NOT IN (SELECT seat_id FROM ticket WHERE session_id = $session_id) AND ss.session_id = $session_id";
		$s_res=mysqli_query($conn, $seatQuery);			
		while ($seat_f=mysqli_fetch_array($s_res, MYSQLI_ASSOC)) {
			echo "<option value=$seat_f[seat_id]>Место: $seat_f[seat] Ряд: $seat_f[row]</option>";
		}
		?>	
	</select>
    <select name="pay">
		<option value="-1">--Выберите способ оплаты--</option>
		<?php
		$payQuery = "SELECT pmethod_id, payment_method FROM `payment_method`";
		$p_res=mysqli_query($conn, $payQuery);			
		while ($pay_f=mysqli_fetch_array($p_res, MYSQLI_ASSOC)) {
			echo "<option value=$pay_f[pmethod_id]>$pay_f[payment_method]</option>";
		}
		?>	
	</select>
    <input type="submit" name="buytick" value="Оплатить">
</form>

<?php

if(isset($_POST['buytick'])){
    $seat_id = $_POST['seat'];
    $pay_id = $_POST['pay'];
    $buytick = $_POST['buytick'];
    
    $add_tick="INSERT INTO `ticket` (`option`, `customer_id`, `session_id`, `seat_id`) VALUES ('1', '$customer_id', '$session_id', '$seat_id')";
    if ($buytick) {
        if ($seat_id != -1 and $pay_id != -1){
            $run_tick=mysqli_query($conn, $add_tick);
            if ($run_tick) {
                $add_pay="INSERT INTO `payment` (`amount`, `payment_method`, `customer_id`, `payment_date`) VALUES ('$price', '$pay_id', '$customer_id', CURRENT_TIMESTAMP)";
                $run_pay = mysqli_query($conn, $add_pay);
                if ($run_pay){
                    $pay_id = mysqli_insert_id($conn);
                    $add_pay_p="INSERT INTO `payment_price` (`payment_id`, `price_id`) VALUES ('$pay_id', '$price_id')";
                    $run_pay_p = mysqli_query($conn, $add_pay_p);
                    if ($run_pay){
                        header("Location: personal.php?page=Билеты");
                    }  
                }
            }
            else {
                echo "Ошибка";
            }
        }
        else {
            echo "Заполните поля!";
        }
    }
}

?>