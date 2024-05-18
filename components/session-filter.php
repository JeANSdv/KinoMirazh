<?php
    $filt_query = "SELECT * FROM category";

    $filt_res = mysqli_query($conn, $filt_query);
    if (!$filt_res) echo ("error filt_res");
?>

<link rel="stylesheet" href="assets/css/seans.css">

<form class="session-film-filter" method="GET">

    <h3 class="filter-main-text">ПОДБОР ПО ПАРАМЕТРАМ:</h3>

    <!-- <h5 class="filt-second-text">Цена билета:</h5>
    <div class="price-filt">
        <input type='number' name="minprice" placeholder="от" min="1" max="9999">
        <input type='number' name="maxprice" placeholder="до" min="2" max="10000">
    </div> -->

    <h5 class="filt-second-text">Жанры:</h5>

    <div class="filt-check-block">
        <?php
            $filt_num_rows = mysqli_num_rows($filt_res);
            if ($filt_num_rows > 0){
                for ($i=0; $i<$filt_num_rows; $i++){
                    $cat_filt = mysqli_fetch_array($filt_res, MYSQLI_ASSOC);  
                    $cat_filt_html = <<<_CATFILTER
                        <div class="select-element">
                            <input id="$cat_filt[category_id]" type="radio" value="$cat_filt[category_name]" name="category">
                            <label for="$cat_filt[category_id]" class="sort">$cat_filt[category_name]</label>
                        </div>
                    _CATFILTER;
                    echo $cat_filt_html;
                }
            }
        ?>
    </div>

    <h5 class="filt-second-text">Ограничение по возрасту:</h5>

    <div class="filt-check-block">
        <div class="select-element">
            <input type="radio" name="age" value="0">
            <label class="sort">0+</label>
        </div>

        <div class="select-element">
            <input type="radio" name="age"  value="6">
            <label class="sort">6+</label>
        </div>

        <div class="select-element">
            <input type="radio" name="age"  value="12">
            <label class="sort">12+</label>
        </div>

        <div class="select-element">
            <input type="radio" name="age"  value="16">
            <label class="sort">16+</label>
        </div>

        <div class="select-element">
            <input type="radio" name="age"  value="18">
            <label class="sort">18+</label>
        </div>
    </div>
    <input class="button" type="submit" value="Применить фильтры">
</form>