<?php 
    include "components/header.php";

    $query = "SELECT DISTINCT g.film_id, g.title, g.actors, g.age_rating, g.country, g.release_date, g.length, g.img_path, g.categories 
    FROM (SELECT ss.session_id, ss.session_date, f.film_id, f.title, f.actors, f.age_rating, 
    f.country, f.release_date, f.length, f.img_path, GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categories 
    FROM `session` AS ss 
    JOIN film AS f ON ss.film_id=f.film_id 
    JOIN film_category AS fc ON f.film_id = fc.film_id 
    JOIN category AS c ON fc.category_id = c.category_id 
    GROUP BY ss.session_id) AS g;";

    $res = mysqli_query($conn, $query);
	if (!$res) echo("Ошибка result_cat");
?>

<div class="session-page">
    <div class="session-date-filter">
        <!-- 10 Дней -->
        <button>17 мая</button>
        <button>18 мая</button>
        <button>19 мая</button>
        <button>20 мая</button>
        <button>21 мая</button>
        <button>22 мая</button>
        <button>23 мая</button>
        <button>24 мая</button>
        <button>25 мая</button>
        <button>26 мая</button>
    </div>
    <div class="session-page-films">
        <div class="session-filters">
            <?php include "components/session-filter.php" ?>
        </div>
        <div class="sessions-elements">
            <?php
                $num_rows = mysqli_num_rows($res);
                if ($num_rows > 0){
                    for ($i=0;$i<$num_rows;$i++){
                        $film = mysqli_fetch_array($res, MYSQLI_ASSOC);
                        $filmlen = $film['length'];
                        $filmh = floor($filmlen/60);
                        $filmmi = $filmlen%60;
                        $film_html = <<<_ITEM

                        <div class="session-film"> <!-- отдельный фильм -->
                            <img src="assets/img/films/$film[img_path]" alt=""> <!-- Здесь изображение -->
                            <div class="session-film-info"> <!-- для описания фильма -->
                                <h1>$film[title]</h1>
                                <p>$film[categories]</p>
                                <p>$film[actors]</p>
                                <p>$film[country], $film[release_date]</p>
                                <p>$filmh час, $filmmi минуты</p>
                                <p>$film[age_rating]</p>
                                <a href=""><button>Выбрать время</button></a>
                            </div>
                        </div>

                        _ITEM;
                        echo $film_html;
                    }
                }
                else{
                    echo '<h2>Сеансов нет</h2>';
                }
            ?>
        </div>
    </div>
</div>

