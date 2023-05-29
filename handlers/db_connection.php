<?php

try { // Подключение к БД
    $connection = new PDO('mysql:host=localhost;dbname=pizza_sushi_wok;port=3306', 'mysql', 'mysql');
} catch (\PDOException $e) {
    die('<h2 class="invalid">' . $e->getMessage() . '</h2>'); // Лучше выводить в лог-файл, а не на экран.
}
