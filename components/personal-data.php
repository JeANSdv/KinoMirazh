<?php
$query = "SELECT `name`, surname, email, phone_number, birth_date FROM customer WHERE customer_id = $cust_id";
$res = mysqli_query($conn, $query);
if (!$res) die ('You are no longer black, or brown, or yellow, or red. You are now Green! You are light green or dark green! Do you understand?');

$res = mysqli_fetch_array($res, MYSQLI_ASSOC);

$date = date_format(date_create($res['birth_date']), 'd.m.Y');
?>

<div class="pers-data">
    <div>
        <span><?= $res['name'] ?> <?= $res['surname'] ?></span>
        <span>Ваш E-Mail: <?= $res['email'] ?></span>
        <span>номер телефона: <?= $res['phone_number'] ?></span>
        <span>дата рождения: <?= $date ?></span>
    </div>
</div>