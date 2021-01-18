-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Jan 18. 17:40
-- Kiszolgáló verziója: 10.4.14-MariaDB
-- PHP verzió: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `login`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- A tábla adatainak kiíratása `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210107120305', '2021-01-07 13:38:41', 31),
('DoctrineMigrations\\Version20210107123858', '2021-01-07 13:39:12', 50),
('DoctrineMigrations\\Version20210107140135', '2021-01-07 15:01:46', 40),
('DoctrineMigrations\\Version20210107172240', '2021-01-07 18:22:47', 49),
('DoctrineMigrations\\Version20210107175149', '2021-01-07 18:51:55', 26),
('DoctrineMigrations\\Version20210118161950', '2021-01-18 17:25:09', 196);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `sess_id` varbinary(128) NOT NULL,
  `sess_data` blob NOT NULL,
  `sess_lifetime` int(10) UNSIGNED NOT NULL,
  `sess_time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- A tábla adatainak kiíratása `sessions`
--

INSERT INTO `sessions` (`sess_id`, `sess_data`, `sess_lifetime`, `sess_time`) VALUES
(0x386973386f737066363833306866303062666c62683466383238, 0x5f7366325f617474726962757465737c613a313a7b733a32343a225f637372662f68747470732d61757468656e746963617465223b733a34333a224d61527a4364666d66346d425a796577637735665354543468546e4248336d6e43715679772d6155754d30223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313631303938373935353b733a313a2263223b693a313631303938373935353b733a313a226c223b733a313a2230223b7d, 1610989395, 1610987955);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `wrong_log_in_tries_number` int(11) DEFAULT NULL,
  `captcha_question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `api_token`, `last_login`, `wrong_log_in_tries_number`, `captcha_question`) VALUES
(1, 'alma', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dnRvZFBsc013NWd4TnFLYQ$IkkRWCHimM8eXV/LafxL/ikIKHgsdpFCmoYyxxO2cvg', NULL, '2021-01-07 19:51:24', 0, ''),
(2, 'ADMIN', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dnRvZFBsc013NWd4TnFLYQ$IkkRWCHimM8eXV/LafxL/ikIKHgsdpFCmoYyxxO2cvg', NULL, '2021-01-18 17:39:06', 0, ''),
(3, 'User1', '[\"ROLE_EDITOR\",\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dnRvZFBsc013NWd4TnFLYQ$IkkRWCHimM8eXV/LafxL/ikIKHgsdpFCmoYyxxO2cvg', NULL, '2021-01-07 19:50:38', 0, ''),
(4, 'User2', '[\"ROLE_EDITOR\"]', '$argon2id$v=19$m=65536,t=4,p=1$dnRvZFBsc013NWd4TnFLYQ$IkkRWCHimM8eXV/LafxL/ikIKHgsdpFCmoYyxxO2cvg', NULL, '2021-01-07 18:09:11', NULL, NULL),
(5, 'User3', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dnRvZFBsc013NWd4TnFLYQ$IkkRWCHimM8eXV/LafxL/ikIKHgsdpFCmoYyxxO2cvg', NULL, '2021-01-07 18:09:00', NULL, NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sess_id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_8D93D6497BA2F5EB` (`api_token`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
