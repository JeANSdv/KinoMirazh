<?php 
    include "components/header.php"
?>

<content>
<!-- SLIDER -->

<div class="slider">
    <div class="slider-line">
        <?php
        $query = "SELECT f.film_id, f.title, fi.imgw_path, COUNT(ss.session_id) FROM film AS f JOIN `session` AS ss ON f.film_id=ss.film_id JOIN film_imgw AS fi ON f.film_id=fi.film_id GROUP BY f.film_id ORDER BY `COUNT(ss.session_id)` DESC LIMIT 5";
        $res = mysqli_query($conn, $query);
        if (!$res) die("war... war never changes");

        $num_rows = mysqli_num_rows($res);
        for ($i=0;$i<$num_rows;$i++){
            $film = mysqli_fetch_array($res, MYSQLI_ASSOC);
            $slider_film = <<<_ITEM
                <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ""><img class="slider-img" src="assets/img/films/width/$film[imgw_path]" alt="ERROR"></a>
            _ITEM;
            echo $slider_film;
        }
        ?>
    </div>
    <div class="sbl"><button class="slider-button-left"><img class="slider-button" src="assets/img/ico/ico-101.png"></button></div>
    <div class="sbr"><button class="slider-button-right"><img class="slider-button" src="assets/img/ico/ico-100.png"></button></div>
    <script src="assets/js/slider.js"></script>
</div>

<!-- BLOCKS -->

<!-- Контейнер с текстом 'популярное'. -->
<div class="block">
    <h1 class="popular">ПОПУЛЯРНОЕ</h1>
</div>

<div class="blockslayder">
    <?php
        $query = "SELECT f.film_id, f.title, fi.imgw_path, COUNT(ss.session_id) FROM film AS f JOIN `session` AS ss ON f.film_id=ss.film_id JOIN film_imgw AS fi ON f.film_id=fi.film_id GROUP BY f.film_id ORDER BY `COUNT(ss.session_id)` DESC LIMIT 5, 4";
        $res = mysqli_query($conn, $query);
        if (!$res) die("what a fox say?");

        $num_rows = mysqli_num_rows($res);
        for ($i=0;$i<$num_rows;$i++){
            $film = mysqli_fetch_array($res, MYSQLI_ASSOC);
            $slider_film = <<<_ITEM
                <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ""><img class="imgslayd" src="assets/img/films/width/$film[imgw_path]" alt="ERROR"></a>
            _ITEM;
            echo $slider_film;
        }
    ?>
</div>

<!-- Контейнер. -->
<div class="block">
    <h1 class="popular">НОВИНКИ</h1>
</div>
    <div class="blockslayder">
        <?php
            $query = "SELECT f.film_id, f.title, fi.imgw_path FROM film AS f JOIN film_imgw AS fi ON f.film_id=fi.film_id ORDER BY film_id DESC LIMIT 4";
            $res = mysqli_query($conn, $query);
            if (!$res) die("what a fox say?");

            $num_rows = mysqli_num_rows($res);
            for ($i=0;$i<$num_rows;$i++){
                $film = mysqli_fetch_array($res, MYSQLI_ASSOC);
                $slider_film = <<<_ITEM
                    <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ""><img class="imgslayd" src="assets/img/films/width/$film[imgw_path]" alt="ERROR"></a>
                _ITEM;
                echo $slider_film;
            }
        ?>
    </div>
</content>

<?php 
    include "components/footer.php"
?>
