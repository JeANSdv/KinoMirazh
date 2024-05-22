<?php
include "components/header.php";

?>

<form class="session_add" method="POST"> 
	<input  type="datetime-local" name="date" placeholder="Дата и время сеанса">
	<select name="film">
		<option value="-1">--Выберите фильм--</option>
		<?php
		$filmq="SELECT film_id, title FROM `film`";
		$run_film=mysqli_query($conn, $filmq);			
		while ($film_f=mysqli_fetch_array($run_film)) {
			echo "<option value=$film_f[film_id]>$film_f[title]</option>";
		}
		?>	
	</select>
    <select name="hall">
		<option value="-1">--Выберите место--</option>
		<?php
		$locq="SELECT cl.city, cl.street, cl.building, ch.number, ch.hall_id FROM cinema_hall AS ch JOIN cinema_location AS cl ON ch.location_id=cl.location_id";
		$run_loc=mysqli_query($conn, $locq);			
		while ($loc_f=mysqli_fetch_array($run_loc)) {
			echo "<option value=$loc_f[hall_id]>$loc_f[city].$loc_f[street].$loc_f[nuilding].зал:$loc_f[number]</option>";
		}
		?>	
	</select>
    <input type="number" name="price" placeholder="Цена билета">
	<input class="submi" type="submit" name="add_session" value="Создать сеанс">
</form>

<?php

if(isset($_POST['add_session'])){
    $ss_date=$_POST['date'];
    $film_id=$_POST['film'];
    $hall_id=$_POST['hall'];
    $price=$_POST['price'];
    $add_ss=$_POST['add_session'];
    
    $add_ses_que="INSERT INTO `session` (`session_date`, `film_id`, `hall_id`) VALUES ('$ss_date', '$film_id', '$hall_id')";
    if ($add_ss) {
        if ($ss_date and $price and $film_id != -1 and $hall_id != -1){
            $run_ses=mysqli_query($conn, $add_ses_que);
            if ($run_ses) {
                $ss_id = mysqli_insert_id($conn);
                $add_prc_que="INSERT INTO `price` (`session_id`, `price`, `option_id`) VALUES ('$ss_id', '$price', '1')";
                echo "Сеанс создан";
                if (mysqli_query($conn, $add_prc_que)){
                    echo "Цена установлена";
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