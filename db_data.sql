-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.29-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных pizza_sushi_wok
CREATE DATABASE IF NOT EXISTS `pizza_sushi_wok` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `pizza_sushi_wok`;

-- Дамп структуры для таблица pizza_sushi_wok.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица категорий продуктов.';

-- Дамп данных таблицы pizza_sushi_wok.categories: ~3 rows (приблизительно)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `title`) VALUES
	(1, 'Пиццы'),
	(2, 'Суши'),
	(3, 'Wok');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_sushi_wok.category_product
CREATE TABLE IF NOT EXISTS `category_product` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  UNIQUE KEY `category_id_product_id` (`category_id`,`product_id`),
  KEY `FK2_product_id` (`product_id`),
  CONSTRAINT `FK1_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица отношений категорий и продуктов';

-- Дамп данных таблицы pizza_sushi_wok.category_product: ~2 rows (приблизительно)
DELETE FROM `category_product`;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` (`category_id`, `product_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 5),
	(3, 6);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_sushi_wok.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(8) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL COMMENT 'id подкатегории',
  PRIMARY KEY (`id`),
  KEY `FK1_subcategory_id` (`subcategory_id`),
  CONSTRAINT `FK1_subcategory_id` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица продуктов';

-- Дамп данных таблицы pizza_sushi_wok.products: ~4 rows (приблизительно)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `title`, `description`, `ingredients`, `price`, `image`, `subcategory_id`) VALUES
	(1, 'Пицца Пепперони', 'Отличительной чертой пиццы «Пепперони» является ее остро-жгучий вкус.', 'пицца соус (томаты базилик орегано чеснок)сыр "Моцарелла"колбаса "Пепперони"', 335, '/img/pepperoni.jpg', 1),
	(2, 'Пицца Барбекью', 'История пиццы «Барбекю» восходит к американской кулинарной культуре, где соусу «Барбекю»', 'соус "Техасский барбекю"сыр "Моцарелла"колбаса "Пепперони"ветчинабеконгрудка куриная', 445, '/img/barbecue.jpg', 1),
	(3, 'Пицца Мясное Ассорти', 'Поклонники мясных блюд по достоинству оценят кулинарный шедевр наших поваров под названием «Мясное ассорти». Ведь в его составе насчитывается сразу четыре разновидности мяса – бекон, говядина, свинина и даже куриная грудка. Чтобы сделать блюдо более сочным, в него добавлены свежие помидоры и великолепный сыр «Моцарелла».', 'пицца соус (томаты базилик орегано чеснок)сыр "Моцарелла"помидорыговядинасвининагрудка куринаябекон', 555, '/img/meat_assorti.jpg', 1),
	(4, 'Пицца Маргарита', 'История пиццы «Маргарита» восходит к концу 19 века, когда впервые это блюдо было предложено неаполитанцем Р. Эспозито королю Фердинанду II и его очаровательной супруге Маргарите. С тех пор это блюдо стало символом итальянской кухни, ведь, соединив всего несколько незамысловатых продуктов (Моцареллу, зелень и томат), удалось получить поистине неподражаемый вкус.', 'пицца соус (томаты базилик орегано чеснок), сыр "Моцарелла"', 300, '/img/margarita.jpg', 2),
	(5, 'Сяке', 'Суши «Сяке» относятся к классическим вариантам, ведь много столетий назад в Японии консервировали соленую рыбу именно с рисом. В современном исполнении суши «Сяке» выглядят как рис, который завернут в кусочек невероятно нежного слабосоленого лосося. Сочетание пресного риса и соленой морской рыбы – вкус, проверенный веками.', 'рис, лосось слабосоленый', 119, '/img/syake.jpg', 7),
	(6, 'Тяхан с курицей', 'В составе тяхана с курицей собраны только самые полезные ингредиенты, которые способны подарить к тому же настоящее гастрономическое удовольствие. Витамины, макро- и микроэлементы – все сохраняется в овощах, ведь для их обжарки используется специальный метод на сковороде вок. В качестве заправки блюда применяется соус «Чесночный», который обладает достаточно острым вкусом.', 'масло растительное, грудка куриная, морковь, лук репчатый, перец болгарский, рис, соус "Чесночный"кунжут', 299, '/img/chicken_tyakhan.jpg', 13);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Дамп структуры для таблица pizza_sushi_wok.subcategories
CREATE TABLE IF NOT EXISTS `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL COMMENT 'id родительской категории',
  PRIMARY KEY (`id`),
  KEY `FK1_t2` (`cat_id`) USING BTREE,
  CONSTRAINT `FK1_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица подкатегорий продуктов.';

-- Дамп данных таблицы pizza_sushi_wok.subcategories: ~14 rows (приблизительно)
DELETE FROM `subcategories`;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` (`id`, `title`, `cat_id`) VALUES
	(1, 'Мясные', 1),
	(2, 'Вегетарианские', 1),
	(3, 'Морские и Рыбные', 1),
	(4, 'Закрытые', 1),
	(5, 'Гриль', 1),
	(6, 'Острые', 1),
	(7, 'Классические', 2),
	(8, 'Спайс', 2),
	(9, 'Запеченные', 2),
	(10, 'Гречневая', 3),
	(11, 'Пшеничная', 3),
	(12, 'Яичная', 3),
	(13, 'Тяханы', 3),
	(14, 'Фунчозы', 3);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
