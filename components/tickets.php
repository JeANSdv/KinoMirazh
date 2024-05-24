<?php

$query = "SELECT t.ticket_id, f.title, f.age_rating, ss.session_date, po.option_name, ch.number, 
hs.row, hs.seat, cl.city, cl.street, cl.building 
FROM ticket AS t JOIN `session` AS ss ON t.session_id=ss.session_id 
JOIN film AS f ON ss.film_id=f.film_id 
JOIN hall_seats AS hs ON t.seat_id=hs.seat_id 
JOIN cinema_hall AS ch ON hs.hall_id=ch.hall_id 
JOIN cinema_location AS cl ON ch.location_id=cl.location_id 
JOIN price_option AS po ON t.option=po.option_id WHERE customer_id=$cust_id AND (NOW() < ss.session_date)";

$res = mysqli_query($conn, $query);
if (!$res) die('half-life');


?>


<div class="ticket-main">
    <div class="tickets">
        <?php
        $num_rows = mysqli_num_rows($res);
        if ($num_rows > 0){
            for ($i=0; $i<$num_rows; $i++){
                $ticket = mysqli_fetch_array($res, MYSQLI_ASSOC);
                $ticket_time = date_format(date_create($ticket['session_date']), 'G:i j.m.y');
                $ticket_html = <<<_TICKET
                <div class="ticket">
                    <h2>$ticket[title] $ticket[age_rating]</h2>
                    <span>$ticket_time</span>
                    <span>$ticket[option_name]</span>
                    <span>Зал: $ticket[number], Ряд: $ticket[row], Место: $ticket[seat]</span>
                    <span class="adress">$ticket[city], Улица $ticket[street], $ticket[building]</span>
                    <a href="ticket-qr.php">QR для проверки</a>
                    <a href="controllers/ticket-del.php?id=$ticket[ticket_id]">Отменить билет</a>
                </div>
                _TICKET;
                echo $ticket_html;
            }
        }
        else {
            $ticket_html = <<<_TICKET
                <div style="display:flex; flex-direction:column; align-items:center;">
                    <span>У Вас нет билетов</span>
                    <a href='session.php'><button>Приобрести билет</button></a>
                </div>
            _TICKET;
            echo $ticket_html;
        }
        ?>
    </div>
</div>