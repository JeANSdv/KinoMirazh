<?php
include "components/header.php";
$session_id = $_GET['id'] ?? '';
?>

<div>
    <div class="dashboard">
        <form class="ticket" method="GET">
            <input type="number" name="id" placeholder="Введите ID сеанса">
            <input class="submi" type="submit" value="Показать">
        </form>
        <table>
            <caption>Билеты</caption>
            <thead>
                <tr>
                    <th>ID Билета</th>
                    <th>ID Пользователя</th>
                    <th>ФИ пользователя</th>
                    <th>ряд/место</th>
                    <th>Действие</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if(isset($_GET['id'])){
                    if ($_GET['id']){
                        $query = "SELECT t.ticket_id, ss.session_date, hs.row, hs.seat, c.customer_id, c.name, c.surname  
                        FROM ticket AS t JOIN `session` AS ss ON t.session_id=ss.session_id  
                        JOIN hall_seats AS hs ON t.seat_id=hs.seat_id 
                        JOIN customer AS c ON t.customer_id=c.customer_id
                        WHERE ss.session_id=$session_id AND (NOW() < ss.session_date)";
                        $res = mysqli_query($conn, $query);
                        if((mysqli_num_rows($res)) > 0){
                            while ($fetch = mysqli_fetch_array($res, MYSQLI_ASSOC)){
                                $tinf_html = <<<_TICK
                                    <tr>
                                        <td>$fetch[ticket_id]</td>
                                        <td>$fetch[customer_id]</td>
                                        <td>$fetch[surname] $fetch[name]</td>
                                        <td>$fetch[row]/$fetch[seat]</td>
                                        <td><a href="controllers/ticket-del.php?id=$fetch[ticket_id]&session=$session_id"><button>Отменить билет</button></a></td>
                                    </tr>
                                _TICK;
                                echo $tinf_html;
                            }
                        }
                        else {
                            echo "<span>нет купленных билетов, либо нет сеанса или он уже прошёл</span>";
                        }
                    }
                }
                ?>
            </tbody>
        </table>
    </div>
</div>