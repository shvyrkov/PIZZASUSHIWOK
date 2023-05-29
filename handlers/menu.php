<?php
$categories = [];
$subcategories = [];

if (isset($connection) && $connection instanceof \PDO) {
    $categoriesStatement = $connection->prepare('SELECT * FROM categories');
    $subcategoriesStatement = $connection->prepare('SELECT * FROM subcategories');

    try {
        $categoriesStatement->execute();
        $categories = $categoriesStatement->fetchAll(PDO::FETCH_ASSOC);

        $subcategoriesStatement->execute();
        $subcategories = $subcategoriesStatement->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e3) {
        die('<h2 class="invalid">' . $e3->getMessage() . '</h2>');
    }
}