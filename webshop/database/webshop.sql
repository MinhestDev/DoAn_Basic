-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2023 lúc 05:37 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647),
(2, 'Mod đz', 'mod@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Sản phẩm', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(30, 'Keo sữa không mùi NOTOX', '', 1, 5, '0000-00-00 00:00:00'),
(26, 'Quần áo', '', 1, 1, '0000-00-00 00:00:00'),
(27, 'Cốt vợt ngang', '', 1, 2, '0000-00-00 00:00:00'),
(28, 'Cốt vợt dọc', '', 1, 3, '0000-00-00 00:00:00'),
(29, 'Giày bóng bàn MATA', '', 1, 4, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(1, 3, 12, 1, '360000.00', 0),
(3, 4, 7, 1, '350000.00', 0),
(12, 9, 4, 1, '200000.00', 0),
(13, 10, 17, 1, '450000.00', 0),
(6, 5, 23, 1, '370000.00', 0),
(7, 6, 28, 1, '169000.00', 0),
(8, 6, 25, 1, '300000.00', 0),
(11, 8, 10, 1, '69000.00', 0),
(10, 7, 11, 1, '70000.00', 0),
(14, 11, 25, 1, '300000.00', 0),
(15, 12, 28, 1, '169000.00', 0),
(16, 13, 28, 3, '507000.00', 0),
(17, 13, 29, 3, '540000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(50, 26, 'Bộ gió JING MAI T12/2016 M3', '<p>T&ecirc;n sản phẩm: Bộ gi&oacute; JING MAI T12/2016 M3</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=215&amp;quan-ao.html\">QUẦN &Aacute;O</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '600000.00', 5, '2.jpg', '[\"21.jpg\"]', 0, 0, 4, 1, 1702602364),
(51, 26, 'Bộ gió JING MAI T12/2016 M2', '<p>T&ecirc;n sản phẩm: Bộ gi&oacute; JING MAI T12/2016 M2</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=215&amp;quan-ao.html\">QUẦN &Aacute;O</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '700000.00', 10, '3.jpg', '[\"31.jpg\"]', 0, 0, 4, 1, 1702602389),
(52, 26, 'Bộ gió JING MAI T12/2016 M1', '<p>T&ecirc;n sản phẩm: Bộ gi&oacute; JING MAI T12/2016 M1</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=215&amp;quan-ao.html\">QUẦN &Aacute;O</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '800000.00', 20, '4.jpg', '[\"41.jpg\"]', 0, 0, 4, 1, 1702602413),
(53, 27, 'KORBEL', '<p>T&ecirc;n sản phẩm: KORBEL</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=3&amp;cot-vot-ngang.html\">CỐT VỢT NGANG</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '1250000.00', 0, '12.jpg', '[\"13.jpg\"]', 0, 0, 4, 1, 1702602481),
(54, 27, 'DIODE V', '<p>T&ecirc;n sản phẩm: DIODE V</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=3&amp;cot-vot-ngang.html\">CỐT VỢT NGANG</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '1450000.00', 20, '22.jpg', '[\"23.jpg\"]', 0, 0, 4, 1, 1702602504),
(55, 27, 'TIMO BOLL TJ', '<p>T&ecirc;n sản phẩm: TIMO BOLL TJ</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=3&amp;cot-vot-ngang.html\">CỐT VỢT NGANG</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '1550000.00', 45, '32.jpg', '[\"33.jpg\"]', 0, 0, 4, 1, 1702602528),
(56, 27, 'TIMO BOLL J', '<p>T&ecirc;n sản phẩm: TIMO BOLL J</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=3&amp;cot-vot-ngang.html\">CỐT VỢT NGANG</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '1100000.00', 10, '42.jpg', '[\"43.jpg\"]', 0, 0, 4, 1, 1702602548),
(57, 27, ' TIMO BOLL CAF TIMO BOLL CAF', '<p>T&ecirc;n sản phẩm: TIMO BOLL J</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=3&amp;cot-vot-ngang.html\">CỐT VỢT NGANG</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '1560000.00', 35, '5.jpg', '[\"51.jpg\"]', 0, 0, 4, 1, 1702602571),
(58, 28, 'RYU SEUNG MING G MAX', '<p>T&ecirc;n sản phẩm: RYU SEUNG MING G MAX</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=5&amp;cot-vot-doc.html\">CỐT VỢT DỌC</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '3500000.00', 0, 'cốt_vợt_ngang.jpg', '[\"c\\u1ed1t_v\\u1ee3t_ngang1.jpg\"]', 0, 0, 4, 1, 1702602619),
(60, 29, 'Giày Mata Xanh', '<p>T&ecirc;n sản phẩm: Gi&agrave;y Mata Xanh</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=235&amp;giay-bong-ban-mata.html\">GI&Agrave;Y B&Oacute;NG B&Agrave;N MATA</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '750000.00', 0, '24.jpg', '[\"25.jpg\"]', 0, 0, 4, 1, 1702602727),
(61, 29, 'Giày Mata Trắng 2017', '<p>T&ecirc;n sản phẩm: Gi&agrave;y Mata Trắng 2017</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=235&amp;giay-bong-ban-mata.html\">GI&Agrave;Y B&Oacute;NG B&Agrave;N MATA</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '820000.00', 0, '34.jpg', '[\"35.jpg\"]', 1, 0, 4, 1, 1702602747),
(62, 30, 'Keo sữa không mùi Notox', '<p>T&ecirc;n sản phẩm: Keo sữa kh&ocirc;ng m&ugrave;i Notox</p>\r\n\r\n<p>Nh&oacute;m sản phẩm: <a href=\"https://hunghabongban.com.vn/products.asp?subid=216&amp;keo-sua-khong-mui-notox.html\">KEO SỮA KH&Ocirc;NG M&Ugrave;I NOTOX</a></p>\r\n\r\n<p>H&atilde;ng:</p>\r\n', '200000.00', 20, '52.jpg', '[\"53.jpg\"]', 0, 0, 4, 1, 1702602782);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(10, 'Banner 3', 'banner.jpg', 'http://localhost/webshop/banner3.png', 3, '2023-12-15 01:57:55'),
(9, 'Banner 2', 'b4.jpg', 'http://localhost/webshop/banner2.png', 2, '2023-12-15 01:57:24'),
(8, 'Banner 1', 'b2.jpg', 'http://localhost/webshop/banner1.png', 1, '2023-12-15 01:54:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(8, 'Minhest Dev', 'minhestdev@gmail.com', '25f9e794323b453885f5181f1b624d0b', '0987654321', 'Hà Nội ', 2023);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
