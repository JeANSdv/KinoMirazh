<?php
    
?>

<link rel="stylesheet" href="assets/css/seans.css">

<div class="session-film-filter">

    <h3 class="filter-main-text">ПОДБОР ПО ПАРАМЕТРАМ:</h3>

    <h5 class="filt-second-text">Цена билета:</h5>
    <div class="price-filt">
        <input type='number' placeholder="от" min="1" max="9999">
        <input type='number' placeholder="до" min="2" max="10000">
    </div>

    <h5 class="filt-second-text">Жанры:</h5>

    <div class="filt-check-block">
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">Ужасы</label>
        </div>
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">Комедия</label>
        </div>
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">Триллер</label>
        </div>
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">Приключения</label>
        </div>
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">Экшн</label>
        </div>
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">История</label>
        </div>
    </div>

    <h5 class="filt-second-text">Ограничение по возрасту:</h5>

    <div class="filt-check-block">
        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">0+</label>
        </div>

        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">6+</label>
        </div>

        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">12+</label>
        </div>

        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">16+</label>
        </div>

        <div class="select-element">
            <input type="checkbox" value="0">
            <label class="sort">18+</label>
        </div>
    </div>
    <button>Применить фильтры</button>
</div>