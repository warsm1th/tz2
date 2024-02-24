-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 24 2024 г., 23:49
-- Версия сервера: 8.0.36-0ubuntu0.22.04.1
-- Версия PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dbase3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(6, 'Микрофоны'),
(2, 'Мониторы'),
(1, 'Ноутбуки'),
(4, 'Системные блоки'),
(3, 'Телефоны'),
(5, 'Часы');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `quantity`, `price`) VALUES
(1, 1, 'Ноутбук Noname', 'Портативный компьютер для работы', 100, 45000),
(2, 2, 'Монитор Noname', 'FullHD Монитор с VA-матрицей 144Ghz', 100, 15000),
(3, 3, 'Телефон Noname', 'Смартфон Android с хорошей камерой и мощным аккумулятором', 100, 20000),
(4, 4, 'Системный блок Noname', '2 ядра, 2 гига, RTX4090', 100, 250000),
(5, 5, 'Часы Noname', 'Не опоздай на работу', 100, 7000),
(6, 6, 'Микрофон Noname', 'Ща спою', 100, 5000);

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz`
--

CREATE TABLE `zakaz` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `zakaz`
--

INSERT INTO `zakaz` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz_item`
--

CREATE TABLE `zakaz_item` (
  `id` int NOT NULL,
  `zakaz_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `rack` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `zakaz_item`
--

INSERT INTO `zakaz_item` (`id`, `zakaz_id`, `product_id`, `quantity`, `rack`) VALUES
(1, 1, 1, 2, 'А'),
(2, 1, 3, 1, 'Б'),
(3, 1, 6, 1, 'Ж'),
(4, 2, 2, 3, 'А'),
(5, 3, 1, 3, 'А'),
(6, 3, 4, 4, 'Ж'),
(7, 4, 5, 1, 'Ж');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `name` (`name`),
  ADD KEY `price` (`price`);

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `zakaz_item`
--
ALTER TABLE `zakaz_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `zakaz_id` (`zakaz_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `zakaz_item`
--
ALTER TABLE `zakaz_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `zakaz_item`
--
ALTER TABLE `zakaz_item`
  ADD CONSTRAINT `zakaz_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zakaz_item_ibfk_2` FOREIGN KEY (`zakaz_id`) REFERENCES `zakaz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
