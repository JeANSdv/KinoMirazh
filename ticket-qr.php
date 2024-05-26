<?php
session_start();

$cust_id = $_SESSION['km_auth'];
$ticket_id = $_GET['id'];
    
require_once  'lib/phpqrcode/qrlib.php';
require_once  'controllers/connect.php';

$query = "SELECT t.ticket_id, f.title, f.age_rating, ss.session_date, po.option_name, ch.number, 
hs.row, hs.seat, cl.city, cl.street, cl.building 
FROM ticket AS t JOIN `session` AS ss ON t.session_id=ss.session_id 
JOIN film AS f ON ss.film_id=f.film_id 
JOIN hall_seats AS hs ON t.seat_id=hs.seat_id 
JOIN cinema_hall AS ch ON hs.hall_id=ch.hall_id 
JOIN cinema_location AS cl ON ch.location_id=cl.location_id 
JOIN price_option AS po ON t.option=po.option_id WHERE customer_id=$cust_id AND ticket_id = $ticket_id";

$res = mysqli_query($conn, $query);
$ticket = mysqli_fetch_array($res, MYSQLI_ASSOC);

$text = "ticket_id: $ticket[ticket_id] | film_title: $ticket[title] | session_date : $ticket[session_date] | $ticket[row]/$ticket[seat]";

$qr = QRcode::png("$text"); 

?>