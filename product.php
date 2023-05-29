<?php
// Страница товара

include_once 'layouts/head.php';
include_once 'handlers/db_connection.php';
include_once 'handlers/menu.php';

$products = [];
$product = [];
$productId = (isset($_GET['id']) && is_numeric($_GET['id'])) ? $_GET['id'] : 0;

// Получить массив с id товаров для валидации
if (isset($connection) && $connection instanceof \PDO) {
    $productStatement = $connection->prepare('SELECT id FROM products');

    try {
        $productStatement->execute();
        $products = $productStatement->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e3) {
        die('<h2 class="invalid">' . $e3->getMessage() . '</h2>');
    }
}

// Получить данные товара по id
if (isset($connection) && $connection instanceof \PDO && in_array($productId, array_column($products, 'id'))) {
    $productStatement = $connection->prepare('SELECT * FROM	products WHERE	id = ?;');

    try {
        $productStatement->execute([$productId]);
        $product = $productStatement->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e3) {
        die('<h2 class="invalid">' . $e3->getMessage() . '</h2>');
    }
}
?>
<body>
<header>
    <h1>PIZZASUSHIWOK test task</h1>
    <hr>
    <h2 class="page">Страница товара.</h2>
</header>

<nav>
    <a href="/"><b>Главная</b></a>
    <?php include_once 'layouts/nav.php' ?>
</nav>

<div class="product">
    <?php if ($product) { ?>
        <a href="product.php?id=<?= $product[0]['id'] ?? '' ?>">
            <img src="<?= $product[0]['image'] ?? '' ?>" class="img_big" alt="<?= $product['title'] ?? '' ?>">
            <h4 class="title"><?= $product[0]['title'] ?? '' ?></h4>
        </a>
        <p>Описание: <?= $product[0]['description'] ?? '' ?></p>
        <p><b>Состав: <?= $product[0]['ingredients'] ?? '' ?></b></p>
        <h5 class="price">Цена: <?= $product[0]['price'] ?? '' ?> р.</h5>
    <?php } else { ?>
        <h2 class="invalid">Товар отсутствует.</h2>
    <?php } ?>
</div>

<?php include_once 'layouts/footer.php' ?>
