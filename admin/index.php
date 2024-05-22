<?php
include "components/header.php";

$query = "SELECT COUNT(customer_id) AS user_count FROM `customer`";
$query2 = "SELECT COUNT(film_id) AS film_count FROM `film`";
$query3 = "SELECT COUNT(category_id) AS category_count FROM `category`";
$query4 = "SELECT COUNT(film_id) AS film_count FROM `film`";
$query5 = "SELECT COUNT(ticket_id) AS ticket_count FROM `ticket`";

$res = mysqli_query($conn, $query);
$res2 = mysqli_query($conn, $query2);
$res3 = mysqli_query($conn, $query3);
$res4 = mysqli_query($conn, $query4);
$res5 = mysqli_query($conn, $query5);
if (!$res or !$res2 or !$res3 or !$res4 or !$res5) die ('sp1t 1n my face');

$res = mysqli_fetch_array($res, MYSQLI_ASSOC);
$res2 = mysqli_fetch_array($res2, MYSQLI_ASSOC);
$res3 = mysqli_fetch_array($res3, MYSQLI_ASSOC);
$res4 = mysqli_fetch_array($res4, MYSQLI_ASSOC);
$res5 = mysqli_fetch_array($res5, MYSQLI_ASSOC);

?>

<div class="dashboard">
    <span>Добро пожаловать, <b>Админ</b></span>
    <table>
        <caption>Данные сайта</caption>
        <thead>
            <tr>
                <th></th>
                <th>пользователи</th>
                <th>фильмы</th>
                <th>категории</th>
                <th>сеансы</th>
                <th>записи</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Количество</th>
                <td><?= $res['user_count'] ?></th>
                <td><?= $res2['film_count'] ?></td>
                <td><?= $res3['category_count'] ?></td>
                <td><?= $res4['film_count'] ?></td>
                <td><?= $res5['ticket_count'] ?></td>
            </tr>
        </tbody>
    </table>
</div>
