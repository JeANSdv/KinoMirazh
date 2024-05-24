-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 25 2024 г., 00:14
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinomirage`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` smallint NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(2, 'Криминал'),
(3, 'Триллер'),
(4, 'Боевик'),
(6, 'Драма'),
(7, 'Фантастика'),
(8, 'Комедия'),
(9, 'Ужасы'),
(10, 'Военные фильмы'),
(11, 'Детективы'),
(12, 'Комедийная драма'),
(13, 'Комедийный боевик'),
(14, 'Комедийный триллер'),
(15, 'Комедия ужасов'),
(16, 'Мелодрама');

-- --------------------------------------------------------

--
-- Структура таблицы `cinema_hall`
--

CREATE TABLE `cinema_hall` (
  `hall_id` mediumint UNSIGNED NOT NULL,
  `location_id` smallint UNSIGNED DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cinema_hall`
--

INSERT INTO `cinema_hall` (`hall_id`, `location_id`, `number`) VALUES
(1, 1, '1'),
(2, 2, '1'),
(3, 2, '2'),
(4, 3, '1'),
(5, 3, '2');

-- --------------------------------------------------------

--
-- Структура таблицы `cinema_location`
--

CREATE TABLE `cinema_location` (
  `location_id` smallint UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `building` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cinema_location`
--

INSERT INTO `cinema_location` (`location_id`, `city`, `street`, `building`) VALUES
(1, 'Ижевск', 'Кирова', '17'),
(2, 'Ижевск', 'Широкий переулок', '53'),
(3, 'Ижевсе', 'Баранова', '87');

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `customer_id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rank` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `surname`, `email`, `password`, `phone_number`, `birth_date`, `registration_date`, `rank`) VALUES
(1, 'Патрик', 'Бэйтман', 'americanpsy@mail.com', '$2y$10$2PxkbD73oXHEszk8zL0e0.XieNXfaLfzkkYzopaU48KV.OwnR222S', '88005553535', '1980-05-06', '2024-05-14 14:12:52', 'user'),
(2, 'admin', 'admin', 'admin@admin', '$2y$10$Vk/mkxgVXZpbRcB7knmHKum.HZHMWPEcCNDEl/SlFAnpPLPFt8RZC', '000', '1991-12-26', '2024-05-23 12:46:22', 'admin'),
(3, 'Александр', 'Вучич', 'SnickersSanya@gmod.com', '$2y$10$eBXjca/WHIPHz5Tmc1aOy.hJDsT4JzlBPPFOvdpG5ImTRwwQd7pyW', '+169908333', '2006-04-12', '2024-05-24 11:16:48', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `film_id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `actors` text NOT NULL,
  `age_rating` enum('0+','6+','12+','16+','18+') NOT NULL,
  `country` varchar(255) NOT NULL,
  `release_date` year NOT NULL,
  `length` smallint UNSIGNED NOT NULL,
  `img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`film_id`, `title`, `description`, `actors`, `age_rating`, `country`, `release_date`, `length`, `img_path`) VALUES
(2, 'Американский психопат', 'Американский сатирический фильм ужасов 2000 года по одноимённому роману Брета Истона Эллиса.', 'Кристиан Бэйл, Уиллем дефо, Хлоя Севинье, Мэтт Росс', '18+', 'США, Канада', 2000, 102, 'americanPsycho.jpg'),
(3, 'Джон Уик 2', 'Когда бывший коллега Джона решает взять под свой контроль таинственную гильдию убийц, Уик вынужден выйти из отставки. ', 'Киану Ривз, Риккардо Скамарчо, Иэн Макшейн, Руби Роуз\r\n', '18+', 'США, Гонконг', 2017, 122, 'ghone.webp'),
(4, 'Годзилла и Конг: Новая империя\r\n', 'Два древних титана, Годзилла и Конг, сражаются в эпической битве, пока люди разгадывают их происхождение и связь с тайнами Острова черепа.', 'Реббека Хол, Брайфн Тайри, Дэн Стивенс', '16+', 'США, Австралия', 2024, 115, 'godzila.jpg'),
(5, 'Воздух', 'Великая Отечественная война. В СССР идут тяжелые бои, немецкая армия наступает. В смешанный авиационный полк прибывает подразделение летчиц', 'Анастасия Талызина, Аглая Тарасова, Кристина Лапшина, Сергей Безруков', '16+', 'Россия', 2023, 151, 'Vozduh.jpg'),
(6, 'Топ Ган: Мэверик', 'Пит Митчелл по прозвищу Мэверик более 30 лет остается одним из лучших пилотов ВМФ: бесстрашный летчик-испытатель, он расширяет границы возможного и старательно избегает повышения в звании, которое заставило бы его приземлиться навсегда.', 'Том Круз, Майлз Теллер, Дженифер Конелли, Джон Хэмм', '16+', 'США', 2022, 130, 'topgun.jpg'),
(7, 'Коллекционер ', 'Бывший домушник Аркин забирается в загородный коттедж своего начальника с тем, чтобы ограбив его, выплатить долг бывшей жене. ', 'Джош Стюарт, Хуан Фернандес, Карли Скот', '18+', 'США', 2009, 90, 'kolekcioner.jpg'),
(8, 'Судьба Человека', 'Фильм рассказывает о русском солдате, которого война подвергла страшным испытаниям, лишила дома и семьи, бросила в концлагерь. ', 'Сергей Бондарчуг, Павел Полунин, Зинаида Кириенко', '16+', 'СССР', 1959, 97, 'cydba.jpeg'),
(9, 'Однажды в Голливуде', '1969 год, золотой век Голливуда уже закончился. Известный актёр Рик Далтон и его дублер Клифф Бут пытаются найти свое место в стремительно меняющемся мире киноиндустрии.  \r\n', 'Лионардо Ди Каприо, Брэд Пит, Марго Робби', '16+', 'США, Великобритания, Китай', 2019, 161, 'holywood.jpg'),
(10, 'Флешбек', 'Алекс Льюис, профессиональный киллер с репутацией, в какой-то момент пошел против ветра и теперь вынужден отбиваться и от ФБР, и от криминального босса. ', 'Лиам Нисон, Гай Пирс, Тадж Атвал', '16+', 'США', 2022, 114, 'flash.webp'),
(11, 'Тихон место', 'Семья с двумя детьми живёт на отдалённой ферме. Казалось бы, жизнь этих людей совершенно не отличается от жизни других таких семей, но они живут в месте, которое наполнено ужасными монстрами, реагирующими на любой звук.', 'Эмили Блант, Джон Красински, Ноа Джуп', '18+', 'США', 2018, 90, 'quietplace.jpg'),
(12, 'Патруль', 'Лос-Анджелес. На первый взгляд это самый обычный город, живущий своей жизнью.', 'Майкл Пенья, Анна Кендрик, Натали Мартинес', '18+', 'США', 2012, 109, 'patrule.jpeg'),
(13, 'Такси', 'Таксист Даниэль помешан на быстрой езде. Как ураган проносится он по извилистым улицам Марселя на мощном ревущем «Пежо», пугая прохожих и приводя в ужас пассажиров.', 'Сами Насери, Эмма Виклунд, Бернар Фарси\r\n', '18+', 'Франция', 1998, 89, 'taksi.jpg'),
(14, 'Лёд', 'С самого детства Надя верила в чудеса. Она представляла себе, как выходит на лёд под овации публики и танцует свой самый красивый танец. ', 'Аглая Тарасова, Диана Енакаева, Мария Аронова', '12+', 'Россия', 2018, 113, 'led.webp'),
(15, 'Джентльмены', 'Один ушлый американец ещё со студенческих лет приторговывал наркотиками, а теперь придумал схему нелегального обогащения с использованием поместий обедневшей английской аристократии и очень неплохо на этом разбогател.', 'Чарли Ханнэм, Генри Голдинк, Мишель Докери', '18+', 'США, Великобритания, Франция, Япония, Чехия', 2019, 113, 'djen.jpg'),
(16, 'ОНО', 'Когда в городке Дерри штата Мэн начинают пропадать дети, несколько ребят сталкиваются со своими величайшими страхами — не только с группой школьных хулиганов, но со злобным клоуном Пеннивайзом, список жертв которого уходит вглубь веков.', 'София Лиллис, Джек Дилан, Джейк Сим', '18+', 'США, Канада', 2017, 135, 'ono.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `film_category`
--

CREATE TABLE `film_category` (
  `film_id` int UNSIGNED NOT NULL,
  `category_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `film_category`
--

INSERT INTO `film_category` (`film_id`, `category_id`) VALUES
(2, 2),
(2, 3),
(3, 3),
(7, 3),
(10, 3),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(12, 4),
(13, 4),
(15, 4),
(6, 6),
(8, 6),
(9, 6),
(11, 6),
(12, 6),
(14, 6),
(16, 6),
(4, 7),
(9, 8),
(13, 8),
(15, 8),
(7, 9),
(11, 9),
(16, 9),
(5, 10),
(8, 10),
(14, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `film_imgw`
--

CREATE TABLE `film_imgw` (
  `film_id` int UNSIGNED NOT NULL,
  `imgw_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `film_imgw`
--

INSERT INTO `film_imgw` (`film_id`, `imgw_path`) VALUES
(2, 'americanPsycho.jpg'),
(3, 'jhone.jpg'),
(4, 'godzila.jpg'),
(5, 'vozduh.jpg'),
(6, 'topgun.jpg'),
(7, 'kolekcioner.jpg'),
(8, 'cydba.webp'),
(9, 'holywood.jpg'),
(10, 'flash.jpg'),
(11, 'tixoemesto.jpeg'),
(12, 'patrule.jpeg'),
(13, 'taksi.png'),
(14, 'led.jpg'),
(15, 'djen.jpg'),
(16, 'ono.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `film_trailer`
--

CREATE TABLE `film_trailer` (
  `film_id` int UNSIGNED NOT NULL,
  `trailer_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `film_trailer`
--

INSERT INTO `film_trailer` (`film_id`, `trailer_link`) VALUES
(2, 'https://www.youtube.com/embed/x19FimfBfOo'),
(3, 'https://www.youtube.com/embed/0DkJa_aGTP8'),
(4, 'https://www.youtube.com/embed/ac65s4A-VH0'),
(5, 'https://www.youtube.com/embed/kdRDumZq2xA'),
(6, 'https://www.youtube.com/embed/WKlWUNRjB_8\r\n'),
(7, 'https://www.youtube.com/embed/lq9DV7FsPg8'),
(8, 'https://www.youtube.com/embed/ov7bKyahGL4'),
(9, 'https://www.youtube.com/embed/zw81ihoukKU'),
(10, 'https://www.youtube.com/embed/q-bNkLPjnFU'),
(11, 'https://www.youtube.com/embed/gYwowpbn_xs'),
(12, 'https://www.youtube.com/embed/lR7OgDHwP-g'),
(13, 'https://www.youtube.com/embed/cbBK31-Zjhk'),
(14, 'https://www.youtube.com/embed/63vkDyLi98A'),
(15, 'https://www.youtube.com/embed/HGZ-IXSKjQ8'),
(16, 'https://www.youtube.com/embed/IisU-JHj_fU');

-- --------------------------------------------------------

--
-- Структура таблицы `hall_seats`
--

CREATE TABLE `hall_seats` (
  `seat_id` int UNSIGNED NOT NULL,
  `hall_id` mediumint UNSIGNED DEFAULT NULL,
  `row` varchar(50) DEFAULT NULL,
  `seat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `hall_seats`
--

INSERT INTO `hall_seats` (`seat_id`, `hall_id`, `row`, `seat`) VALUES
(1, 1, '1', '1'),
(2, 1, '1', '2'),
(3, 1, '1', '3'),
(4, 1, '1', '4'),
(5, 2, '1', '1'),
(6, 2, '1', '2'),
(7, 2, '1', '3'),
(8, 2, '1', '4'),
(9, 2, '1', '5'),
(10, 2, '1', '6'),
(11, 2, '2', '7'),
(12, 2, '2', '8'),
(13, 2, '2', '9'),
(14, 2, '2', '10'),
(15, 2, '2', '11'),
(16, 2, '2', '12'),
(17, 2, '3', '13'),
(18, 2, '3', '14'),
(19, 2, '3', '15'),
(20, 2, '3', '16'),
(21, 2, '3', '17'),
(22, 2, '3', '18'),
(23, 2, '4', '19'),
(24, 2, '4', '20'),
(25, 2, '4', '21'),
(26, 2, '4', '22'),
(27, 2, '4', '23'),
(28, 2, '4', '24'),
(29, 2, '5', '25'),
(30, 2, '5', '26'),
(31, 2, '5', '27'),
(32, 2, '5', '28'),
(33, 2, '5', '29'),
(34, 2, '5', '30'),
(35, 3, '1', '1'),
(36, 3, '1', '2'),
(37, 3, '1', '3'),
(38, 3, '1', '4'),
(39, 3, '1', '5'),
(40, 3, '1', '6'),
(41, 3, '2', '7'),
(42, 3, '2', '8'),
(43, 3, '2', '9'),
(44, 3, '2', '10'),
(45, 3, '2', '11'),
(46, 3, '2', '12'),
(47, 3, '3', '13'),
(48, 3, '3', '14'),
(49, 3, '3', '15'),
(50, 3, '3', '16'),
(51, 3, '3', '17'),
(52, 3, '3', '18'),
(53, 3, '4', '19'),
(54, 3, '4', '20'),
(55, 3, '4', '21'),
(56, 3, '4', '22'),
(57, 3, '4', '23'),
(58, 3, '4', '24'),
(59, 3, '5', '25'),
(60, 3, '5', '26'),
(61, 3, '5', '27'),
(62, 3, '5', '28'),
(63, 3, '5', '29'),
(64, 3, '5', '30'),
(65, 4, '1', '1'),
(66, 4, '1', '2'),
(67, 4, '1', '3'),
(68, 4, '1', '4'),
(69, 4, '1', '5'),
(70, 4, '1', '6'),
(71, 4, '2', '7'),
(72, 4, '2', '8'),
(73, 4, '2', '9'),
(74, 4, '2', '10'),
(75, 4, '2', '11'),
(76, 4, '2', '12'),
(77, 4, '3', '13'),
(78, 4, '3', '14'),
(79, 4, '3', '15'),
(80, 4, '3', '16'),
(81, 4, '3', '17'),
(82, 4, '3', '18'),
(83, 4, '4', '19'),
(84, 4, '4', '20'),
(85, 4, '4', '21'),
(86, 4, '4', '22'),
(87, 3, '4', '23'),
(88, 4, '4', '24'),
(89, 4, '5', '25'),
(90, 4, '5', '26'),
(91, 4, '5', '25'),
(92, 4, '5', '26'),
(93, 4, '5', '27'),
(94, 4, '5', '28'),
(95, 4, '5', '29'),
(96, 4, '5', '30'),
(97, 5, '1', '1'),
(98, 5, '1', '2'),
(99, 5, '1', '3'),
(100, 5, '1', '4'),
(101, 5, '1', '5'),
(102, 5, '1', '6'),
(103, 5, '2', '7'),
(104, 5, '2', '8'),
(105, 5, '2', '9'),
(106, 5, '2', '10'),
(107, 5, '2', '11'),
(108, 5, '2', '12'),
(109, 5, '3', '13'),
(110, 5, '3', '14'),
(111, 5, '3', '15'),
(112, 5, '3', '16'),
(113, 5, '3', '17'),
(114, 5, '3', '18'),
(115, 5, '4', '19'),
(116, 5, '4', '20'),
(117, 5, '4', '21'),
(118, 5, '4', '22'),
(119, 5, '4', '23'),
(120, 5, '4', '24'),
(121, 5, '5', '25'),
(122, 5, '5', '26'),
(123, 5, '5', '27'),
(124, 5, '5', '28'),
(125, 5, '5', '29'),
(126, 5, '5', '30');

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `payment_id` int UNSIGNED NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method` smallint UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `payment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`payment_id`, `amount`, `payment_method`, `customer_id`, `payment_date`) VALUES
(3, '480.00', 1, 1, '2024-05-24 21:35:48'),
(4, '480.00', 7, 1, '2024-05-24 21:49:53'),
(5, '480.00', 1, 1, '2024-05-24 22:05:13'),
(6, '480.00', 1, 1, '2024-05-24 23:44:47');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_method`
--

CREATE TABLE `payment_method` (
  `pmethod_id` smallint UNSIGNED NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `payment_method`
--

INSERT INTO `payment_method` (`pmethod_id`, `payment_method`) VALUES
(1, 'Банковская карта'),
(2, 'Оплата через СБП'),
(3, 'QIWI'),
(6, 'TINKOFF pay'),
(7, 'VKPay');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_price`
--

CREATE TABLE `payment_price` (
  `payment_id` int UNSIGNED NOT NULL,
  `price_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `payment_price`
--

INSERT INTO `payment_price` (`payment_id`, `price_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE `price` (
  `price_id` int UNSIGNED NOT NULL,
  `session_id` int UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `option_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `price`
--

INSERT INTO `price` (`price_id`, `session_id`, `price`, `option_id`) VALUES
(1, 1, '480.00', 1),
(2, 2, '500.00', 1),
(3, 3, '350.00', 1),
(4, 4, '600.00', 1),
(5, 5, '400.00', 1),
(6, 6, '700.00', 1),
(7, 7, '300.00', 1),
(9, 9, '800.00', 1),
(10, 10, '850.00', 1),
(11, 11, '500.00', 1),
(12, 12, '400.00', 1),
(13, 13, '900.00', 1),
(14, 14, '300.00', 1),
(15, 15, '650.00', 1),
(16, 16, '460.00', 1),
(17, 17, '670.00', 1),
(18, 18, '560.00', 1),
(19, 19, '650.00', 1),
(20, 20, '450.00', 1),
(21, 21, '650.00', 1),
(22, 22, '650.00', NULL),
(23, 23, '700.00', 1),
(24, 24, '780.00', 1),
(25, 25, '850.00', 1),
(26, 26, '670.00', NULL),
(27, 27, '500.00', 1),
(28, 28, '300.00', 1),
(29, 29, '350.00', 1),
(30, 30, '450.00', 1),
(31, 31, '350.00', 1),
(32, 32, '300.00', 1),
(33, 33, '350.00', 1),
(34, 34, '400.00', 1),
(35, 35, '500.00', 1),
(36, 36, '700.00', 1),
(37, 37, '400.00', 1),
(38, 38, '700.00', 1),
(39, 39, '900.00', 1),
(40, 40, '550.00', 1),
(41, 41, '450.00', 1),
(42, 42, '400.00', 1),
(43, 43, '600.00', 1),
(44, 44, '300.00', 1),
(45, 45, '900.00', 1),
(46, 46, '350.00', 1),
(47, 47, '600.00', 1),
(48, 48, '800.00', 1),
(49, 49, '500.00', 1),
(51, 76, '850.00', 1),
(52, 77, '800.00', 1),
(53, 78, '450.00', 1),
(54, 79, '350.00', 1),
(55, 80, '620.00', 1),
(56, 81, '480.00', 1),
(57, 82, '700.00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `price_option`
--

CREATE TABLE `price_option` (
  `option_id` int UNSIGNED NOT NULL,
  `option_name` varchar(55) DEFAULT NULL,
  `option_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `price_option`
--

INSERT INTO `price_option` (`option_id`, `option_name`, `option_description`) VALUES
(1, 'Взрослый', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

CREATE TABLE `session` (
  `session_id` int UNSIGNED NOT NULL,
  `session_date` datetime DEFAULT NULL,
  `film_id` int UNSIGNED DEFAULT NULL,
  `hall_id` mediumint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`session_id`, `session_date`, `film_id`, `hall_id`) VALUES
(1, '2024-05-30 22:05:00', 2, 1),
(2, '2024-05-18 12:30:00', 7, 2),
(3, '2024-05-18 14:30:00', 7, 2),
(4, '2024-05-18 16:30:00', 7, 2),
(5, '2024-05-17 18:30:00', 7, 2),
(6, '2024-05-19 12:30:00', 7, 2),
(7, '2024-05-19 14:30:00', 7, 2),
(9, '2024-05-19 16:30:00', 7, 2),
(10, '2024-05-20 12:30:00', 7, 2),
(11, '2024-05-20 14:30:00', 7, 2),
(12, '2024-05-20 16:30:00', 7, 2),
(13, '2024-05-20 18:30:00', 7, 2),
(14, '2024-05-18 13:30:00', 5, 3),
(15, '2024-05-18 15:30:00', 5, 3),
(16, '2024-05-18 17:30:00', 5, 3),
(17, '2024-05-18 19:30:00', 5, 3),
(18, '2024-05-19 13:30:00', 5, 3),
(19, '2024-05-19 15:30:00', 5, 3),
(20, '2024-05-19 17:30:00', 5, 3),
(21, '2024-05-19 19:30:00', 5, 3),
(22, '2024-05-20 13:30:00', 5, 3),
(23, '2024-05-20 15:30:00', 5, 3),
(24, '2024-05-20 17:30:00', 5, 3),
(25, '2024-05-20 19:30:00', 5, 3),
(26, '2024-05-17 11:30:00', 11, 4),
(27, '2024-05-18 13:30:00', 11, 4),
(28, '2024-05-18 15:30:00', 11, 4),
(29, '2024-05-18 17:30:00', 11, 4),
(30, '2024-05-19 11:30:00', 11, 4),
(31, '2024-05-19 13:30:00', 11, 4),
(32, '2024-05-19 15:30:00', 11, 4),
(33, '2024-05-19 17:30:00', 11, 4),
(34, '2024-05-20 11:30:00', 11, 4),
(35, '2024-05-20 13:30:00', 11, 4),
(36, '2024-05-20 15:30:00', 11, 4),
(37, '2024-05-20 17:30:00', 11, 4),
(38, '2024-05-18 13:30:00', 9, 5),
(39, '2024-05-18 15:30:00', 9, 5),
(40, '2024-05-18 17:30:00', 9, 5),
(41, '2024-05-18 19:30:00', 9, 5),
(42, '2024-05-19 13:30:00', 9, 5),
(43, '2024-05-19 15:30:00', 9, 5),
(44, '2024-05-19 17:30:00', 9, 5),
(45, '2024-05-19 19:30:00', 9, 5),
(46, '2024-05-20 13:30:00', 9, 5),
(47, '2024-05-20 15:30:00', 9, 5),
(48, '2024-05-20 17:30:00', 9, 5),
(49, '2024-05-20 19:30:41', 9, 5),
(50, '2024-05-18 12:30:00', 16, 3),
(51, '2024-05-18 14:30:00', 16, 5),
(52, '2024-05-20 15:30:00', 3, 2),
(53, '2024-05-19 13:50:00', 3, 1),
(54, '2024-05-18 15:40:00', 4, 1),
(55, '2024-05-19 17:20:00', 4, 2),
(56, '2024-05-20 14:50:00', 6, 2),
(57, '2024-05-19 17:30:00', 6, 5),
(58, '2024-05-19 17:30:00', 8, 5),
(59, '2024-05-18 14:30:00', 8, 2),
(60, '2024-05-19 17:30:00', 10, 5),
(61, '2024-05-18 15:30:00', 10, 3),
(62, '2024-05-18 13:30:00', 12, 1),
(63, '2024-05-20 15:30:00', 12, 3),
(64, '2024-05-20 13:30:00', 13, 1),
(65, '2024-05-18 15:30:00', 13, 4),
(66, '2024-05-18 13:30:00', 15, 1),
(67, '2024-05-18 15:30:00', 15, 3),
(68, '2024-05-19 13:30:00', 4, 2),
(69, '2024-05-20 15:30:00', 3, 5),
(70, '2024-05-20 13:30:00', 16, 2),
(71, '2024-05-18 19:30:00', 6, 3),
(72, '2024-05-18 12:30:00', 12, 5),
(73, '2024-05-18 15:30:00', 10, 2),
(74, '2024-05-20 13:30:00', 13, 3),
(76, '2024-05-28 18:05:00', 3, 1),
(77, '2024-05-25 18:00:00', 2, 3),
(78, '2024-05-25 18:10:00', 6, 3),
(79, '2024-05-25 16:00:00', 5, 5),
(80, '2024-05-25 23:35:00', 16, 1),
(81, '2024-05-26 13:25:00', 9, 1),
(82, '2024-05-25 17:20:00', 2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int UNSIGNED NOT NULL,
  `option` int UNSIGNED DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `session_id` int UNSIGNED DEFAULT NULL,
  `seat_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD PRIMARY KEY (`hall_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Индексы таблицы `cinema_location`
--
ALTER TABLE `cinema_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`);

--
-- Индексы таблицы `film_category`
--
ALTER TABLE `film_category`
  ADD PRIMARY KEY (`film_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `film_imgw`
--
ALTER TABLE `film_imgw`
  ADD PRIMARY KEY (`film_id`);

--
-- Индексы таблицы `film_trailer`
--
ALTER TABLE `film_trailer`
  ADD PRIMARY KEY (`film_id`);

--
-- Индексы таблицы `hall_seats`
--
ALTER TABLE `hall_seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_method` (`payment_method`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`pmethod_id`);

--
-- Индексы таблицы `payment_price`
--
ALTER TABLE `payment_price`
  ADD PRIMARY KEY (`payment_id`,`price_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Индексы таблицы `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Индексы таблицы `price_option`
--
ALTER TABLE `price_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Индексы таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `option` (`option`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `cinema_hall`
--
ALTER TABLE `cinema_hall`
  MODIFY `hall_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `cinema_location`
--
ALTER TABLE `cinema_location`
  MODIFY `location_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `hall_seats`
--
ALTER TABLE `hall_seats`
  MODIFY `seat_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `pmethod_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `price`
--
ALTER TABLE `price`
  MODIFY `price_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT для таблицы `price_option`
--
ALTER TABLE `price_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cinema_hall`
--
ALTER TABLE `cinema_hall`
  ADD CONSTRAINT `cinema_hall_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `cinema_location` (`location_id`);

--
-- Ограничения внешнего ключа таблицы `film_category`
--
ALTER TABLE `film_category`
  ADD CONSTRAINT `film_category_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`),
  ADD CONSTRAINT `film_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Ограничения внешнего ключа таблицы `film_imgw`
--
ALTER TABLE `film_imgw`
  ADD CONSTRAINT `film_imgw_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `film_trailer`
--
ALTER TABLE `film_trailer`
  ADD CONSTRAINT `film_trailer_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`);

--
-- Ограничения внешнего ключа таблицы `hall_seats`
--
ALTER TABLE `hall_seats`
  ADD CONSTRAINT `hall_seats_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `cinema_hall` (`hall_id`);

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`pmethod_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Ограничения внешнего ключа таблицы `payment_price`
--
ALTER TABLE `payment_price`
  ADD CONSTRAINT `payment_price_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`),
  ADD CONSTRAINT `payment_price_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `price` (`price_id`);

--
-- Ограничения внешнего ключа таблицы `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  ADD CONSTRAINT `price_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `price_option` (`option_id`);

--
-- Ограничения внешнего ключа таблицы `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `cinema_hall` (`hall_id`);

--
-- Ограничения внешнего ключа таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`option`) REFERENCES `price_option` (`option_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`seat_id`) REFERENCES `hall_seats` (`seat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
