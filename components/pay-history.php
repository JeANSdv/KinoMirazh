<?php

$query = "SELECT p.payment_id, p.payment_date, pm.payment_method, p.amount FROM `payment` AS p 
JOIN payment_method AS pm ON p.payment_method = pm.pmethod_id WHERE customer_id=$cust_id";
$res = mysqli_query($conn, $query);
if (!$res) die('Carl Jonsohn')
?>


<div class="pay-hist-main">
    <?php
    $num_rows = mysqli_num_rows($res);
    if ($num_rows > 0){
        for ($i=0; $i<$num_rows; $i++){
            $fetch = mysqli_fetch_array($res, MYSQLI_ASSOC);
            $date = date_format(date_create($fetch['payment_date']), 'd.m.Y H:i');
            $hist_html = <<<_HISTORY
                <a href="single-pay-history.php?id=$fetch[payment_id]"><div class="pay-h-elem">
                    <span>$date</span>
                    <span>$fetch[payment_method]</span>
                    <span>$fetch[amount]</span>
                </div></a>
            _HISTORY;
            echo $hist_html;
        }
    }
    else{
        echo "<h1 style='color:gray'>Пусто</h1>";
    }
    ?>
</div>