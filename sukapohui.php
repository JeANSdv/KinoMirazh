

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
                <p>$film[rating]</p>
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

