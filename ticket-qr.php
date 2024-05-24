<?php
session_start();

$cust_id = $_SESSION['km_auth'];
    
require_once  'lib/phpqrcode/qrlib.php';
require_once  'controllers/connect.php';

include "components/tickets.php";

$text = "ticket_id: $ticket[ticket_id] | film_title: $ticket[title] | session_date : $ticket[session_date] | $fetch[hs_row]";

$qr = QRcode::png("$text"); 

?>