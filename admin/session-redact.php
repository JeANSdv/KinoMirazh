<?php
include "components/header.php";
if (isset($_GET['id'])){
    if ($_GET['id']){
        $session_id = $_GET['id'];
        $query = "SELECT session_id, session_date, hall_id FROM `session` WHERE session_id = $session_id";
        $sd = mysqli_query($conn, $query);
        $sd = mysqli_fetch_array($sd, MYSQLI_ASSOC);
    }
    else {
        header("Location: ../session-manage.php");
        exit;
    }
}
else {
    header("Location: ../session-manage.php");
    exit;
}

?>

<form class="session_add" method="POST"> 
	<input  type="datetime-local" name="date" value="<?= $sd['session_date'] ?>">
    <select name="hall">
		<?php
		$locq="SELECT cl.city, cl.street, cl.building, ch.number, ch.hall_id FROM cinema_hall AS ch JOIN cinema_location AS cl ON ch.location_id=cl.location_id";
		$run_loc=mysqli_query($conn, $locq);			
		while ($loc_f=mysqli_fetch_array($run_loc)) {
            $selected = $loc_f['hall_id'] == $sd['hall_id'] ? 'selected' : '';
			echo "<option $selected value=$loc_f[hall_id]>$loc_f[city].$loc_f[street].$loc_f[nuilding].зал:$loc_f[number]</option>";
		}
		?>	
	</select>
	<input class="submi" type="submit" name="add_session" value="Изменить">
</form>

<?php

if(isset($_POST['add_session'])){
    $ss_date=$_POST['date'];
    $hall_id=$_POST['hall'];
    $add_ss=$_POST['add_session'];
    
    $add_ses_que="UPDATE `session` SET `session_date` = '$ss_date', `hall_id` = '$hall_id' WHERE `session_id` = $session_id";
    if ($add_ss) {
        if ($ss_date){
            $run_ses=mysqli_query($conn, $add_ses_que);
            if ($run_ses) {
                header("Location: session-manage.php");
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


