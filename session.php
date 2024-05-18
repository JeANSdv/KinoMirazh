<?php 
    include "components/header.php";

    $query = "SELECT DISTINCT g.film_id, g.title, g.actors, g.age_rating, g.country, g.release_date, g.length, g.img_path, g.categories
    FROM (SELECT ss.session_id, ss.session_date, f.film_id, f.title, f.actors, f.age_rating, 
    f.country, f.release_date, f.length, f.img_path, GROUP_CONCAT(c.category_name SEPARATOR ', ') AS categories 
    FROM `session` AS ss 
    JOIN film AS f ON ss.film_id=f.film_id 
    JOIN film_category AS fc ON f.film_id = fc.film_id 
    JOIN category AS c ON fc.category_id = c.category_id 
    GROUP BY ss.session_id) AS g WHERE 1=1";

    if(isset($_GET['age'])){
        $age_rating = $_GET['age'];
        $query .= " AND g.age_rating = '$age_rating+'";
    }

    if(isset($_GET['category'])){
        $category_filt = $_GET['category'];
        $query .= " AND g.categories LIKE '%$category_filt%'";
    }

    // print_r($query);
    // echo "<br>";
    // print_r($_GET);


    $res = mysqli_query($conn, $query);
	if (!$res) echo("Ошибка result");

    // $date_cr = date_create();
?>

<div class="session-page">
    <!-- <form class="session-date-filter" method="GET"> 
        <?php
            // for($i=0; $i<10;$i++){
            //     $date_fo = date_format($date_cr, "j.m");
            //     $date_filt_html = <<<_DAFI
            //         <input type="button" value="$date_fo" name="date">
            //     _DAFI;
            //     date_add($date_cr,date_interval_create_from_date_string("1 day"));
            //     echo "$date_filt_html";
            // }
        ?>
    </form>  -->

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
                                <p>$filmh ч $filmmi м</p>
                                <p>$film[age_rating]</p>
                                <a href="single-film.php?film=$film[film_id]"><button>Выбрать время</button></a>
                            </div>
                        </div>

                        _ITEM;
                        echo $film_html;
                    }
                }
                else{
                    echo '<h2 style="color: gray">Сеансов нет</h2>';
                }
            ?>
        </div>
    </div>
</div>

