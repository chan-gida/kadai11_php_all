-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2025 年 2 月 02 日 08:42
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
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` char(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `balcony_orientation` enum('N','E','S','W') NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `indate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `name`, `address`, `balcony_orientation`, `user_image`, `indate`) VALUES
(1, 'yamamoto@email.com', '$2y$10$QvQV6vhxsOEmJg5xi4ANjeLb5lF8jc/OuRxYDPubuhgv5X/KjVIre', '山本', '東京都', 'E', NULL, '2025-02-01 09:57:18'),
(2, 'tanaka@email.com', '$2y$10$WEwyWj/6k0Kfpj93H6YvEePx588OkqdcLlE4wzD/Qtd1RI9Ev5MQy', '田中', '岡山県', 'N', NULL, '2025-01-30 13:06:56'),
(3, 'yamada@email.com', '$2y$10$JWdMhBvybpRM/6wbyWRu9ujwtcHDPsbrs/4Mx4zgAgAAV3/9Echpi', '山田', '大阪府', 'S', 'img/679f208e49452.png', '2025-02-02 16:36:46'),
(4, 'nakamura@email.com', '$2y$10$U227L3Dt10neawFF8uwmmuhaoHCqsWUm42uJyJ90SeDbyY1PMOdnC', '中村', '鹿児島', 'W', NULL, '2025-02-01 09:57:57'),
(5, 'okada@email.com', '$2y$10$Ayk1/GZE4BLAMj8acsB49ua3TCCcRStgy6GrajyI/Bv6Xp0AIU.Kq', '岡田', '宮崎', 'S', 'img/679f20e12fb22.png', '2025-02-02 16:38:09'),
(12, 'okawa@email.com', '$2y$10$a3BGiJcj6jqxHvBnuOdIyeix8Nxhu08PYqm1Rg/2xS7DyulMjUBz2', '大川', '国分寺', 'E', 'img/679f218896c3f.png', '2025-02-02 16:40:56');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
