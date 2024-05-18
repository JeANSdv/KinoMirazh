<?php 

include "components/header.php";

$query = "SELECT DISTINCT g.film_id, g.title, g.actors, g.age_rating, g.country, g.release_date, g.length, g.img_path, g.categories, g.session_id, g.session_date
FROM (SELECT ss.session_id, ss.session_date, f.film_id, f.title, f.actors, f.age_rating, 
f.country, f.release_date, f.length, f.img_path, GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categories 
FROM `session` AS ss 
JOIN film AS f ON ss.film_id=f.film_id 
JOIN film_category AS fc ON f.film_id = fc.film_id 
JOIN category AS c ON fc.category_id = c.category_id 
GROUP BY ss.session_id) AS g WHERE g.film_id = $_GET[film]";

$res = mysqli_query($conn, $query);
if (!$res) echo("Ошибка result");

$film_section = <<< _FILM
        <h2 style="text-align: center">Товар не найден</h2>
        _FILM;

if ($film = mysqli_fetch_assoc($res)){

    $prod_section = <<< _FILM
    <div class="session-film"> <!-- отдельный фильм -->
        <div class="session-film-info"> <!-- для описания фильма -->
            <h1>$film[title]</h1>
            <p>$film[categories]</p>
            <p>$film[actors]</p>
            <p>$film[country], $film[release_date]</p>
            <p>$filmh ч $filmmi м</p>
            <p>$film[age_rating]</p>
        </div>
    </div>
    _FILM;
    }

    echo $prod_section;