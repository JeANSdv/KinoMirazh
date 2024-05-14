-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 14 2024 г., 17:32
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
(3, 'Триллер');

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
(1, 1, '1');

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
(1, 'Ижевск', 'Кирова', '17');

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
(1, 'Патрик', 'Бэйтман', 'americanpsy@mail.com', 'hashed1', '88005553535', '1980-05-06', '2024-05-14 14:12:52', 'user');

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
(2, 'Американский психопат', 'Американский сатирический фильм ужасов 2000 года по одноимённому роману Брета Истона Эллиса.', 'Кристиан Бэйл, Уиллем дефо, Хлоя Севинье, Мэтт Росс', '18+', 'США, Канада', 2000, 102, 'americanPsycho.jpg');

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
(2, 3);

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
(2, 'https://www.youtube.com/watch?v=x19FimfBfOo');

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
(4, 1, '1', '4');

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
(1, '480.00', 1, 1, '2024-05-14 17:21:28');

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
(1, 'Банковская карта');

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
(1, 1);

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
(1, 1, '480.00', 1);

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
(1, '2024-05-30 22:05:00', 2, 1);

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
-- Дамп данных таблицы `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `option`, `customer_id`, `session_id`, `seat_id`) VALUES
(1, 1, 1, 1, 3);

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
  MODIFY `category_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cinema_hall`
--
ALTER TABLE `cinema_hall`
  MODIFY `hall_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cinema_location`
--
ALTER TABLE `cinema_location`
  MODIFY `location_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `hall_seats`
--
ALTER TABLE `hall_seats`
  MODIFY `seat_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `pmethod_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `price`
--
ALTER TABLE `price`
  MODIFY `price_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `price_option`
--
ALTER TABLE `price_option`
  MODIFY `option_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `session`
--
ALTER TABLE `session`
  MODIFY `session_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
