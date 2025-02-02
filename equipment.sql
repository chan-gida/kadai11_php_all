-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2025 年 2 月 01 日 00:39
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `kadai_php05`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `installation_date` date NOT NULL,
  `solar_capacity` int(11) NOT NULL,
  `raspberry_pi_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `equipment`
--

INSERT INTO `equipment` (`id`, `user_id`, `installation_date`, `solar_capacity`, `raspberry_pi_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2025-01-09', 300, 100, '2025-01-30 05:11:16', '2025-01-30 05:11:16'),
(2, 5, '2025-01-10', 550, 200, '2025-01-30 05:11:50', '2025-01-30 05:11:50'),
(3, 1, '2025-01-13', 200, 400, '2025-01-30 05:12:19', '2025-01-30 05:12:19');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
