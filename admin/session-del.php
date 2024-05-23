<?php

include "components/header.php";

if (isset($_GET['id'])){
    if ($_GET['id']){
        $session_id = $_GET['id'];
        $query = "SELECT session_id FROM `ticket` WHERE session_id = $session_id";
        $res = mysqli_query($conn, $query);
        $disabled = mysqli_num_rows($res) > 0 ? 'disabled' : '';
        $msg = mysqli_num_rows($res) > 0 ? 'Вы не можете отменить сеанс, так как на него есть записи!' : '';
    }
    else {
        header("Location: session-manage.php");
        exit;
    }
}
else {
    header("Location: session-manage.php");
    exit;
}

?>

<div class="del">
    <span>Вы уверены, что хотите отменить сеанс?</span>

    <form method="POST">
        <input <?= $disabled ?> type="submit" name="delete_y" value="ДА">
        <a href="session-manage.php"><input type="button" value="Вернуться назад"></a>
    </form>

    <p><?= $msg ?></p>

</div>

<?php

if(isset($_POST['delete_y'])){
    $query = "DELETE FROM price WHERE session_id = $session_id";
    if (mysqli_query($conn, $query)){
        $query = "DELETE FROM `session` WHERE session_id = $session_id";
        if(mysqli_query($conn, $query)){
            header("Location: session-manage.php");
        }
        else {
            echo "Ошибка на delete session";
        }
    }
    else {
        echo "Ошибка на delete price";
    }

}

?>