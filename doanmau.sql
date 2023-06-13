-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 06, 2023 lúc 07:25 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doanmau`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) NOT NULL,
  `iduser` int(10) DEFAULT 0,
  `bill_name` varchar(255) NOT NULL,
  `bill_email` varchar(100) NOT NULL,
  `bill_address` varchar(255) NOT NULL,
  `bill_tel` varchar(50) NOT NULL,
  `bill_pttt` varchar(255) NOT NULL,
  `ngaydathang` varchar(50) NOT NULL,
  `total` int(15) NOT NULL DEFAULT 0,
  `bill_status` tinyint(1) DEFAULT 1 COMMENT '0. Đơn hàng mới\r\n1. Đang xử lý\r\n2. Đang giao hàng\r\n3. Đã giao hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `iduser`, `bill_name`, `bill_email`, `bill_address`, `bill_tel`, `bill_pttt`, `ngaydathang`, `total`, `bill_status`) VALUES
(132, 12, '', '123@123', '', '', 'Chuyển khoản ngân hàng', '06:19:14pm 05/01/2023', 888000, 1),
(133, 12, 'Tang Tan Y', '123@123', '23', '033', 'Trả tiền khi nhận hàng', '06:22:41pm 05/01/2023', 0, 1),
(134, 13, 'ád', '1@123', 'ádas', 'ádasd', 'Trả tiền khi nhận hàng', '03:28:39am 06/01/2023', 888000, 1),
(135, 10, 'Nguyễn Văn Tuyên', 'tangtany@gmail.com', 'Đại Lộc - Quảng Nam', '0935456789', 'Trả tiền khi nhận hàng', '04:26:05am 06/01/2023', 122, 1),
(136, 10, 'Nguyễn Văn Tuyên', 'tangtany@gmail.com', 'Đại Lộc - Quảng Nam', '0935456789', 'Trả tiền khi nhận hàng', '04:26:54am 06/01/2023', 122, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(10) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `iduser` int(10) NOT NULL,
  `idpro` int(10) NOT NULL,
  `ngaybinhluan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noidung`, `iduser`, `idpro`, `ngaybinhluan`) VALUES
(27, '123', 12, 51, '03:10:08am 06/01/2023');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(15) NOT NULL DEFAULT 0,
  `soluong` int(100) NOT NULL,
  `thanhtien` int(15) NOT NULL,
  `idbill` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `img`, `name`, `price`, `soluong`, `thanhtien`, `idbill`) VALUES
(355, '68', '123', 122, 1, 122, 136);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `name`) VALUES
(21, 'Sạc dự phòng'),
(23, 'ĐIỆN THOẠI'),
(24, 'Loa Buetooth');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(35) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `luotxem` int(11) DEFAULT 0,
  `iddm` int(11) NOT NULL,
  `soluong` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `name`, `price`, `img`, `mota`, `luotxem`, `iddm`, `soluong`) VALUES
(39, 'Oppo A5', '3000000', 'oppo-a5.jpg', 'Màn hình:\r\n\r\nTFT LCD6.5\"HD+\r\n\r\nHệ điều hành:\r\n\r\nAndroid 9 (Pie)\r\n\r\nCamera sau:\r\n\r\nChính 12 MP & Phụ 8 MP, 2 MP, 2 MP\r\n\r\nCamera trước:\r\n\r\n8 MP\r\n\r\nChip:\r\n\r\nSnapdragon 665\r\n\r\nRAM:\r\n\r\n4 GB\r\n\r\nBộ nhớ trong:\r\n\r\n128 GB\r\n\r\nSIM:\r\n\r\n2 Nano SIM\r\n\r\nPin, Sạc:\r\n\r\n5000 mAh', 2, 23, 20),
(41, 'OppO  Reno 6', '6000900', 'oppo-reno6-pro-blue.jpg', 'Màn hình:\r\n\r\nAMOLED6.43\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 8 MP, 2 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nMediaTek Dimensity 900 5G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4300 mAh65 W', 0, 23, 20),
(42, 'Vivo V20 SE 8GB/128GB Xanh', '8000900', 'vivo-v20-se-8gb-128gb-xanh.jpg', 'Màn hình:\r\n\r\nAMOLED6.44\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 8 MP, 2 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nSnapdragon 665\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4100 mAh33 W', 1, 23, 20),
(43, 'Xiaomi Mi 11 5G', '7690000', 'xiaomi-mi-11-xanhduong.jpg', 'Màn hình:\r\n\r\nAMOLED6.67\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 108 MP & Phụ 8 MP, 5 MP\r\nCamera trước:\r\n\r\n16 MP\r\nChip:\r\n\r\nMediaTek Dimensity 1200\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n5000 mAh67 W', 1, 23, 20),
(44, 'Samsung Galaxy Z Flip3 5G 256GB', '25900000', 'samsung-flip.jpg', 'Màn hình:\r\n\r\nDynamic AMOLED 2XChính 6.7\" & Phụ 1.9\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\n2 camera 12 MP\r\nCamera trước:\r\n\r\n10 MP\r\nChip:\r\n\r\nSnapdragon 888\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n3300 mAh15 W', 1, 23, 20),
(45, 'Realme 8 5G', '6990000', 'realme-8-5g-blue.jpg', 'Màn hình:\r\n\r\nIPS LCD6.5\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 2 MP, 2 MP\r\nCamera trước:\r\n\r\n16 MP\r\nChip:\r\n\r\nMediaTek Dimensity 700\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n5000 mAh18 W', 5, 23, 20),
(46, 'Samsung Galaxy S21 Plus 5G', '19990000', 'samsung-galaxy-s21-plus-256gb-bac.jpg', 'Màn hình:\r\n\r\nDynamic AMOLED 2X6.7\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 12 MP & Phụ 64 MP, 12 MP\r\nCamera trước:\r\n\r\n10 MP\r\nChip:\r\n\r\nExynos 2100\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4800 mAh25 W', 2, 23, 20),
(47, 'iPhone 11 Pro Max 512 GB', '27270000', 'iphone-11-pro-max-gold.jpg', 'Màn hình:\r\n\r\nOLED6.5\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n3 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A13 Bionic\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n512 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n3969 mAh', 0, 23, 18),
(48, 'iPhone 13 128GB', '23450000', 'iPhone_13_128GB_Pink.jpg', 'Màn hình:\r\n\r\nOLED6.1\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 15\r\nCamera sau:\r\n\r\n2 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A15 Bionic\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n3240 mAh20 W', 14, 23, 18),
(49, 'Loa JBL FLIP 5', '1200000', 'loa-jbl-flip5-xanh-ngoc.jpg', 'Tổng công suất:\r\n\r\n20 W\r\nNguồn:\r\n\r\nPin\r\nThời gian sử dụng:\r\n\r\nDùng khoảng 12 tiếngSạc khoảng 2.5 tiếng\r\nKết nối không dây:\r\n\r\nBluetooth 4.2\r\nTiện ích:\r\n\r\nChống nước IPX7\r\nPhím điều khiển:\r\n\r\nBật/tắt bluetoothNút nguồnNút Party BoostPhát/dừng chơi nhạcTăng/giảm âm lượng\r\nThương hiệu của:\r\n\r\nMỹ\r\nHãng\r\n\r\nJBL.', 1, 24, 17),
(50, 'Loa JBL GO 3 - Xanh Ngọc', '888000', 'Speaker-go3-teal.jpg', 'Tổng công suất:\r\n\r\n4.2 W\r\nNguồn:\r\n\r\nPin\r\nThời gian sử dụng:\r\n\r\nDùng khoảng 5 tiếngSạc khoảng 2.5 tiếng\r\nKết nối không dây:\r\n\r\nBluetooth 5.1\r\nTiện ích:\r\n\r\nChống nước, chống bụi IP67\r\nPhím điều khiển:\r\n\r\nBật/tắt bluetoothNút nguồnPhát/dừng chơi nhạcTăng/giảm âm lượng\r\nThương hiệu của:\r\n\r\nMỹ\r\nHãng\r\n\r\nJBL.', 37, 24, 16),
(51, 'Loa JBL GO 3 -  Xanh Navy', '888000', 'loa-bluetooth-go-3-hong-xanh-navy.jpg', 'Tổng công suất:\r\n\r\n4.2 W\r\nNguồn:\r\n\r\nPin\r\nThời gian sử dụng:\r\n\r\nDùng khoảng 5 tiếngSạc khoảng 2.5 tiếng\r\nKết nối không dây:\r\n\r\nBluetooth 5.1\r\nTiện ích:\r\n\r\nChống nước, chống bụi IP67\r\nPhím điều khiển:\r\n\r\nBật/tắt bluetoothNút nguồnPhát/dừng chơi nhạcTăng/giảm âm lượng\r\nThương hiệu của:\r\n\r\nMỹ\r\nHãng\r\n\r\nJBL.', 58, 24, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0. Nguoi dung 1. Admin',
  `name` varchar(35) NOT NULL,
  `user_status` tinyint(1) DEFAULT 1 COMMENT '1. Hoat dong 0. Vo hieu hoa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `user`, `pass`, `email`, `address`, `tel`, `role`, `name`, `user_status`) VALUES
(10, 'tangtany', '123456', 'tangtanypro@gmail.com', 'Đại Lộc - Quảng Nam', '0935456789', 1, 'Tăng Tấn Y', 1),
(11, 'tangtany', 'Tangtany@123', '1@2', NULL, NULL, 0, '', 0),
(12, 'tangtany', 'Tuyennv@123', '123@1234', '123', '123', 0, 'Tân Tấn Y', 1),
(13, 'nhtd', 'Dung@123', '1@123', NULL, NULL, 0, '', 1),
(14, 'nvtuyennn', 'Tuyennv@123', 'nvtuyen@gmail.com', NULL, NULL, 0, '', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_bill` (`iduser`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_bl` (`iduser`),
  ADD KEY `fk_pro_bl` (`idpro`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_bill` (`idbill`) USING BTREE;

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_sanpham_danhmuc` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_user_bill` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `fk_pro_bl` FOREIGN KEY (`idpro`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `fk_user_bl` FOREIGN KEY (`iduser`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_bill` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `lk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
