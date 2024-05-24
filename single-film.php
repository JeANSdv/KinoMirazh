<?php 

include "components/header.php";

$film_id = $_GET['film'];

$query = "SELECT DISTINCT f.film_id, f.title, f.actors, f.country, f.release_date, f.description, f.length, 
f.age_rating, f.img_path, fi.imgw_path, ft.trailer_link, GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categ FROM film AS f 
JOIN film_category AS fc ON f.film_id = fc.film_id JOIN category AS c ON fc.category_id = c.category_id 
JOIN film_imgw AS fi ON f.film_id = fi.film_id JOIN film_trailer AS ft ON f.film_id = ft.film_id WHERE f.film_id = $film_id GROUP BY f.film_id";

$res = mysqli_query($conn, $query);
if (!$res) die("Ошибка result");
?>

<div class="s-film">
<?php
$film_section = <<< _FILM
        <h2 style="text-align: center">Фильм не найден</h2>
        _FILM;

if ($film = mysqli_fetch_array($res, MYSQLI_ASSOC)){
    $filmlen = $film['length'];
    $filmh = floor($filmlen/60);
    $filmmi = $filmlen%60;
    $film_section = <<< _FILM
    <div class="s-film-info">
        <div class="s-film-info-main">
            <img src="assets/img/films/width/$film[imgw_path]" alt="">
            <div>
                <h1>$film[title]</h1>
                <p>Жанры: $film[categ]</p>
                <p>Главные актёры:</p>
                <p>$film[actors]</p>
                <p>Страна, дата производства: $film[country], $film[release_date]</p>
                <p>Длительность: $filmh ч $filmmi м</p>
                <p>Возрастные ограничения: $film[age_rating]</p>
            </div>
        </div>
        <p>Описание: $film[description]</p>
        <h2>Трейлер:</h2>
        <iframe width="100%" height="100%" 
        src="$film[trailer_link]" 
        title="YouTube video player" frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
        </iframe>
    </div>
    _FILM;
    }
    echo $film_section;
?>
    <div class="s-film-sessions">
        <h2>Выберите место и время сеанса:</h2>
        <?php
        
        $query = "SELECT ss.session_id, ss.session_date, f.title, cl.city, cl.street, cl.building, ch.number FROM `session` AS ss 
        JOIN film AS f ON ss.film_id=f.film_id JOIN cinema_hall AS ch ON ss.hall_id=ch.hall_id 
        JOIN cinema_location AS cl ON ch.location_id=cl.location_id WHERE (NOW() < ss.session_date) AND f.film_id = $film_id";
        $res = mysqli_query($conn, $query);
        if (!$res) die("Ошибка result2");
        $num_rows = mysqli_num_rows($res);
        if ($num_rows > 0){
            for ($i=0;$i<$num_rows;$i++){
                $fetch = mysqli_fetch_array($res, MYSQLI_ASSOC);
                $adress = "$fetch[city], $fetch[street] $fetch[building], Зал: $fetch[number]";
                $time = date_format(date_create($fetch['session_date']), "d.m H:i");
                $sean_but = <<<_ITEM
                    <a href="ticket-buy.php?id=$fetch[session_id]"><button>$adress | $time</button></a>
                _ITEM;
                echo $sean_but;
            }
        }
        else{
            echo '<h2 style="color: gray">Сеансов нет</h2>';
        }


        ?>
    </div>
</div>