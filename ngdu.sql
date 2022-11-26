-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 17 2018 г., 21:00
-- Версия сервера: 5.7.20
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ngdu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brigade`
--

CREATE TABLE `brigade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_cdng` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `brigade_user`
--

CREATE TABLE `brigade_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_brigade` int(11) DEFAULT NULL,
  `id_object` int(11) DEFAULT NULL,
  `id_well` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cdng`
--

CREATE TABLE `cdng` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `check_list_object`
--

CREATE TABLE `check_list_object` (
  `id` int(11) NOT NULL,
  `id_check_name` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `id_raport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `check_list_well`
--

CREATE TABLE `check_list_well` (
  `id` int(11) NOT NULL,
  `id_check_name` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `id_raport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `check_name`
--

CREATE TABLE `check_name` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_check_title` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `check_title`
--

CREATE TABLE `check_title` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `object`
--

CREATE TABLE `object` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `object_raport`
--

CREATE TABLE `object_raport` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_object` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `password_hach` varchar(65) NOT NULL,
  `auth_hach` varchar(65) NOT NULL,
  `status` set('brigadir','operator','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `first_name`, `last_name`, `father_name`, `password_hach`, `auth_hach`, `status`) VALUES
(1, 'admin', 'Ивано', 'Иванов', 'Иванович', '202cb962ac59075b964b07152d234b70', '6afb3ebbf1e68df5c44be783c5a0f796da7b04c54da9c92663d1f439679371d0', 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `well`
--

CREATE TABLE `well` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `well_raport`
--

CREATE TABLE `well_raport` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_well` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brigade`
--
ALTER TABLE `brigade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cdng` (`id_cdng`);

--
-- Индексы таблицы `brigade_user`
--
ALTER TABLE `brigade_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_brigade`,`id_object`,`id_well`),
  ADD KEY `brigade_user_ibfk_1` (`id_brigade`),
  ADD KEY `brigade_user_ibfk_2` (`id_object`),
  ADD KEY `brigade_user_ibfk_4` (`id_well`);

--
-- Индексы таблицы `cdng`
--
ALTER TABLE `cdng`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `check_list_object`
--
ALTER TABLE `check_list_object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_check_name` (`id_check_name`),
  ADD KEY `id_check` (`id_raport`);

--
-- Индексы таблицы `check_list_well`
--
ALTER TABLE `check_list_well`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_check_name` (`id_check_name`),
  ADD KEY `id_check` (`id_raport`);

--
-- Индексы таблицы `check_name`
--
ALTER TABLE `check_name`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_title` (`id_check_title`);

--
-- Индексы таблицы `check_title`
--
ALTER TABLE `check_title`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `object_raport`
--
ALTER TABLE `object_raport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_object` (`id_object`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `well`
--
ALTER TABLE `well`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `well_raport`
--
ALTER TABLE `well_raport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_well` (`id_well`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brigade`
--
ALTER TABLE `brigade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `brigade_user`
--
ALTER TABLE `brigade_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cdng`
--
ALTER TABLE `cdng`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `check_list_object`
--
ALTER TABLE `check_list_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `check_list_well`
--
ALTER TABLE `check_list_well`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `check_name`
--
ALTER TABLE `check_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `check_title`
--
ALTER TABLE `check_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `object`
--
ALTER TABLE `object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `object_raport`
--
ALTER TABLE `object_raport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `well`
--
ALTER TABLE `well`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `well_raport`
--
ALTER TABLE `well_raport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `brigade`
--
ALTER TABLE `brigade`
  ADD CONSTRAINT `brigade_ibfk_1` FOREIGN KEY (`id_cdng`) REFERENCES `cdng` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `brigade_user`
--
ALTER TABLE `brigade_user`
  ADD CONSTRAINT `brigade_user_ibfk_1` FOREIGN KEY (`id_brigade`) REFERENCES `brigade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brigade_user_ibfk_2` FOREIGN KEY (`id_object`) REFERENCES `object` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brigade_user_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brigade_user_ibfk_4` FOREIGN KEY (`id_well`) REFERENCES `well` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `check_list_object`
--
ALTER TABLE `check_list_object`
  ADD CONSTRAINT `check_list_object_ibfk_1` FOREIGN KEY (`id_raport`) REFERENCES `object_raport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `check_list_object_ibfk_2` FOREIGN KEY (`id_check_name`) REFERENCES `check_name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `check_list_well`
--
ALTER TABLE `check_list_well`
  ADD CONSTRAINT `check_list_well_ibfk_1` FOREIGN KEY (`id_raport`) REFERENCES `well_raport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `check_list_well_ibfk_2` FOREIGN KEY (`id_check_name`) REFERENCES `check_name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `check_name`
--
ALTER TABLE `check_name`
  ADD CONSTRAINT `check_name_ibfk_1` FOREIGN KEY (`id_check_title`) REFERENCES `check_title` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `object_raport`
--
ALTER TABLE `object_raport`
  ADD CONSTRAINT `object_raport_ibfk_1` FOREIGN KEY (`id_object`) REFERENCES `object` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `object_raport_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `well_raport`
--
ALTER TABLE `well_raport`
  ADD CONSTRAINT `well_raport_ibfk_1` FOREIGN KEY (`id_well`) REFERENCES `well` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `well_raport_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
