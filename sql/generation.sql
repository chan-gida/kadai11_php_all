-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2025 年 2 月 01 日 00:38
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
-- テーブルの構造 `generation`
--

CREATE TABLE `generation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `generated_power` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `generation`
--

INSERT INTO `generation` (`id`, `user_id`, `equipment_id`, `timestamp`, `generated_power`, `created_at`) VALUES
(1, 3, 1, '2025-01-30 05:07:15', 300, '2025-01-30 05:07:15'),
(2, 3, 1, '2025-01-30 05:07:50', 300, '2025-01-30 05:07:15'),
(3, 5, 2, '2025-01-30 05:09:42', 500, '2025-01-30 05:09:42'),
(4, 5, 2, '2025-01-30 05:10:58', 550, '2025-01-30 05:10:58');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `generation`
--
ALTER TABLE `generation`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `generation`
--
ALTER TABLE `generation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
