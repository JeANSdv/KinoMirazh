<?php
include "components/header.php";
?>

<div>
    <div class="dashboard">
        <a href="session-add.php"><button>Добавить сеанс</button></a>
        <table>
            <caption>Сеансы</caption>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Дата</th>
                    <th>Фильм</th>
                    <th>Место</th>
                    <th colspan="2">Действия</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $query = "SELECT ss.session_id, ss.session_date, f.title, cl.city, cl.street, cl.building, ch.number 
                FROM `session` AS ss 
                JOIN film AS f ON ss.film_id=f.film_id 
                JOIN cinema_hall AS ch ON ss.hall_id=ch.hall_id 
                JOIN cinema_location AS cl ON ch.location_id=cl.location_id 
                WHERE (NOW() < ss.session_date) 
                ORDER BY ss.session_date ASC LIMIT 20";
                $res = mysqli_query($conn, $query);
                while ($fetch = mysqli_fetch_array($res, MYSQLI_ASSOC)){
                    $adress = "$fetch[city], $fetch[street] $fetch[building], Зал: $fetch[number]";
                    $ses_html = <<<_SESSION
                        <tr>
                            <td>$fetch[session_id]</td>
                            <td>$fetch[session_date]</td>
                            <td>$fetch[title]</td>
                            <td>$adress</td>
                            <td><a href="session-redact.php?id=$fetch[session_id]"><button>Редактировать</button></a></td>
                            <td><a href="session-del.php?id=$fetch[session_id]"><button>Отменить</button></a></td>
                        </tr>
                    _SESSION;
                    echo $ses_html;
                }
                ?>		
            </tbody>
        </table>
    </div>
</div>