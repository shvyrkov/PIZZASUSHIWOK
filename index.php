<?php
// Главная страница со списком товаров по категориям

include_once 'layouts/head.php';
include_once 'handlers/db_connection.php';
include_once 'handlers/menu.php';

$products = [];

// Получить данные по всем товарам
if (isset($connection) && $connection instanceof \PDO) {
    $productsStatement = $connection->prepare('
        SELECT p.*, c.title category, s.title subcategory FROM products p
            JOIN	category_product ct ON	p.id = ct.product_id
            JOIN	categories c ON	c.id = ct.category_id
            JOIN	subcategories s ON	s.id = p.subcategory_id    
            ');

    try {
        $productsStatement->execute();
        $products = $productsStatement->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e3) {
        die('<h2 class="invalid">' . $e3->getMessage() . '</h2>');
    }
}
?>

<body>
<header>
    <h1>PIZZASUSHIWOK test task</h1>
    <hr>
    <h2 class="page">Главная.</h2>
</header>

<nav>
    <a href="/"><b>Главная</b></a>
    <?php include_once 'layouts/nav.php'?>
</nav>

<?php foreach ($categories as $category) : ?>
    <section>
        <h2><?= $category['title'] ?></h2>

        <?php foreach ($subcategories as $subcategory) : ?>
            <?php if ($subcategory['cat_id'] === $category['id']) : ?>
                <a href="#"><b><?= $subcategory['title'] ?></b></a>
            <?php endif; ?>
        <?php endforeach; ?>

        <div class="category">
            <?php foreach ($products as $product) : ?>
                <?php if ($category['title'] === $product['category']) : ?>
                    <div class="product">
                        <a href="product.php?id=<?= $product['id'] ?? '' ?>">
                            <img src="<?= $product['image'] ?? '' ?>" class="img" alt="<?= $product['title'] ?? '' ?>">
                            <h4 class="title"><?= $product['title'] ?? '' ?></h4>
                        </a>
                        <h5 class="subcategory">Подкатегория: <a href="#"><?= $product['subcategory'] ?? '' ?></a></h5>
                        <p><?= $product['description'] ?? '' ?></p>
                        <h5 class="price">Цена: <?= $product['price'] ?? '' ?> р.</h5>
                    </div>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>
    </section>
<?php endforeach;

include_once 'layouts/footer.php'
?>


