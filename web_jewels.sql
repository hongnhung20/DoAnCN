-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 29, 2021 lúc 07:59 PM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_jewels`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `bill_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `noti` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`bill_id`, `user_id`, `total`, `payment`, `address`, `date`, `status`, `phone`, `noti`) VALUES
(1, 1, 9000000, 'Bank transfer ', 'vinh', '2021-11-12 23:50:44', 3, NULL, 1),
(2, 1, 11000000, 'Bank transfer ', 'aaaa', '2021-11-12 23:50:44', 3, NULL, 1),
(45466335, 1, 27500000, 'Thanh toán khi nhận hàng', 'test', '2021-11-12 23:50:44', 3, NULL, 1),
(45466336, 1, 21000000, 'Thanh toán khi nhận hàng', 'fsdg', '2018-06-12 23:42:43', 3, '01652335156', 1),
(45466337, 4, 12000000, 'Thanh toán khi nhận hàng', 'saddad', '2018-06-13 00:40:48', 3, '24235523532355', 1),
(45466338, 4, 12000000, 'Thanh toán khi nhận hàng', 'gffgd', '2018-06-13 00:44:14', 3, 'hhdfdh', NULL),
(45466339, 4, 28000000, 'Thanh toán khi nhận hàng', 'dssfsf', '2021-11-12 23:50:44', 3, '325255', 1),
(45466340, 4, 41100000, 'Thanh toán khi nhận hàng', 'gfdgdg', '2018-06-13 00:52:12', 1, '120112112', 1),
(45466348, 1, 25000000, 'Thanh toán khi nhận hàng', 'a', '2021-11-22 15:15:53', 1, '0984259410', 1),
(45466349, 1, 89400000, 'Thanh toán khi nhận hàng', 'wewe', '2021-11-22 18:55:18', 1, '0868655861', 1),
(45466350, 1, 32300000, 'Thanh toán khi nhận hàng', 'dg', '2021-11-23 08:08:57', 1, '24', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_detail_id` bigint(20) NOT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`bill_detail_id`, `bill_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 1, 9000000, 1),
(2, 2, 1, 11000000, 1),
(3, 3, 2, 7000000, 1),
(8, 45466335, 3, 12000000, 2),
(9, 45466335, 8, 3500000, 1),
(10, 45466336, 9, 4800000, 2),
(11, 45466336, 15, 5000000, 2),
(12, 45466336, 2, 9000000, 1),
(13, 45466336, 3, 12000000, 1),
(14, 45466337, 3, 12000000, 1),
(15, 45466338, 3, 12000000, 1),
(16, 45466339, 2, 9000000, 1),
(17, 45466339, 3, 12000000, 1),
(18, 45466339, 4, 7000000, 1),
(19, 45466340, 8, 3500000, 1),
(20, 45466340, 9, 4800000, 2),
(21, 45466340, 10, 14000000, 2),
(22, 45466341, 1484425983254, 888888888, 1),
(23, 45466341, 6, 6000000, 1),
(24, 45466342, 1484425983256, 4500000, 1),
(25, 45466344, 1484425983257, 3900000, 2),
(26, 45466346, 1484425983263, 850000, 1),
(27, 45466346, 1484425983262, 709000, 1),
(28, 45466346, 1484425983260, 695000, 1),
(29, 45466347, 1484425983256, 4500000, 1),
(30, 45466348, 1484425983279, 25000000, 1),
(31, 45466349, 1484425983277, 89400000, 1),
(32, 45466350, 1484425983267, 32300000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` bigint(11) NOT NULL,
  `category_name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Đồng Hồ'),
(2, 'Nhẫn '),
(3, 'Dây chuyền'),
(4, 'Lắc Tay'),
(6, 'Nguyên Bộ Trang Sức '),
(7, 'Bông Tai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` bigint(20) NOT NULL,
  `comment_email` varchar(200) NOT NULL,
  `comment_name` varchar(200) NOT NULL,
  `comment_text` text NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_email`, `comment_name`, `comment_text`, `product_id`) VALUES
(3, 'Nguyễn Phi Hùng', 'Phi Nguyễn', 'Sản Phẩm Chất Lượng Tốt', 2),
(4, 'Nguyễn Phi Hùng', 'Phi Phi', 'Sản Phẩm Chất Lượng Tốt', 2),
(9, 'admin@email.com', 'Tran Minh ', 'vip', 1484425983281),
(10, 'admin@email.com', 'customer 3', '5 sao', 1484425983281);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_description` text CHARACTER SET utf8 DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_provider` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_buy` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_image`, `product_price`, `product_description`, `product_quantity`, `product_provider`, `product_buy`) VALUES
(1484425983256, 2, 'Nhẫn Vàng 24K 0000Y001303', 'http://hoankimthao.vn/wp-content/uploads/2021/05/Nhan-cuoi-Vang-24K-PNJ-Bon-Mua-Yeu-Thuong-0000Y000309-300x300.png', 4500000, '                                                                      Vừa mang nét cổ điển nhưng lại có một chút sự hiện đại bởi sự rành mạch trong đường nét, lại giữ được sự mềm mại và ngẫu hứng giữa vàng 24K cùng thiết kế độc đáo - chiếc nhẫn khoác lên sự thanh lịch và gây ấn tượng như người phụ nữ trưởng thành với phong cách tao nhã.\n\nVới mong muốn gửi gắm những cảm xúc yêu thương đến nàng thông qua những món trang sức nói chung và chiếc nhẫn nói riêng, Jewels N tin rằng đây sẽ là món quà ý nghĩa nhất dành tặng cho người phụ nữ mà bạn yêu thương.\n                                \n                                \n                                ', 9, 'PNJ', 4000000),
(1484425983257, 2, 'Nhẫn Kim cương Vàng trắng 14K PNJ DD00W000112', '/resources/images/gndd00w000112-nhan-kim-cuong-vang-trang-14k-pnj-01.png', 3900000, '                                   Kim cương vốn là món trang sức mang đến niềm kiêu hãnh và cảm hứng thời trang bất tận. Sở hữu riêng cho mình món trang sức kim cương chính là điều mà ai cũng mong muốn. Chiếc nhẫn được chế tác từ vàng 14K cùng điểm nhấn kim cương với 57 giác cắt chuẩn xác, tạo nên món trang sức đầy sự sang trọng và đẳng cấp.\nKim cương đã đẹp, trang sức kim cương lại càng mang sức hấp dẫn khó cưỡng. Sự kết hợp mới mẻ này chắc chắn sẽ tạo nên dấu ấn thời trang hiện đại và giúp quý cô trở nên nổi bật, tự tin và thu hút sự ngưỡng mộ của mọi người.\n                                ', 3, 'PNJ', 3500000),
(1484425983258, 2, 'Nhẫn bạc đính đá Disney ', 'https://cdn.pnj.io/images/detailed/68/snztmxc000001-nhan-bac-dinh-da-pnjsilver-beauty-and-the-beast-ztmxc000001-01.png', 1000000, '                                                                                                         Thương hiệu:\nDisney|PNJ\n \nBộ sưu tập:\nBeauty & The Beast\n \nLoại đá chính:\nSynthetic\n \nLoại đá phụ (nếu có):\nMix đá\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nCác dịp lễ tết\n \nQuà tặng cho người thân:\nCho Nàng\n                                \n                                \n                                \n                                ', 10, 'PNJ', 900000),
(1484425983259, 2, 'Nhẫn bạc đính đá màu đỏ PNJSilver Fantasia ZTXMK000086', 'https://cf.shopee.vn/file/713f8b9f9e916216411551179544a89f', 515000, 'Thương hiệu:\nPNJSilver\n \nBộ sưu tập:\nFantasia\n \nLoại đá chính:\nCZ\n \nMàu đá chính:\nĐỏ\n \nHình dạng đá:\nTrái tim\n \nLoại đá phụ (nếu có):\nCZ\n \nMàu đá phụ (nếu có):\nTrắng\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nNgày kỷ niệm\n \nQuà tặng cho người thân:\nCho Nàng', 10, 'PNJ', 450000),
(1484425983260, 7, ' Bông tai bạc đính đá màu tím PNJSilver Fantasia ZTXMK000123', 'https://cdn.pnj.io/images/detailed/87/SBZTXMK000123-bong-tai-bac-dinh-da-mau-tim-PNJSilver-Fantasia.png', 695000, 'Thương hiệu:\nPNJSilver\n \nBộ sưu tập:\nFantasia\n \nLoại đá chính:\nCZ\n \nMàu đá chính:\nTím\n \nHình dạng đá:\nNhiều dạng\n \nLoại đá phụ (nếu có):\nCZ\n \nMàu đá phụ (nếu có):\nTrắng\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nNgày kỷ niệm\nCác dịp lễ tết\n \nQuà tặng cho người thân:\nCho Nàng', 6, 'Kim Loan', 500000),
(1484425983261, 7, 'Bông tai bạc đính đá PNJSilver XMXMH060000', 'https://cdn.pnj.io/images/thumbnails/800/800/detailed/88/sbxmxmh060000-bong-tai-bac-dinh-da-pnjsilver.png', 845000, 'Thương hiệu:\nPNJSilver\n \nLoại đá chính:\nXoàn mỹ\n \nMàu đá chính:\nTrắng\n \nHình dạng đá:\nTròn\n \nLoại đá phụ (nếu có):\nXoàn mỹ\n \nMàu đá phụ (nếu có):\nTrắng\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nNgày kỷ niệm\n \nQuà tặng cho người thân:\nCho Nàng\nCho Mẹ', 10, 'PNJ', 700000),
(1484425983262, 7, 'Bông tai bạc đính đá Disney|PNJ Mickey ZTXMW000006', 'https://cdn.pnj.io/images/detailed/68/sbztxmw000006-bong-tai-bac-dinh-da-pnjsilver-mickey-alone-ztxmw000006-02.png', 709000, 'Thương hiệu:\nDisney|PNJ\n \nBộ sưu tập:\nMickey\n \nLoại đá chính:\nSynthetic\n \nLoại đá phụ (nếu có):\nXoàn mỹ\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nCác dịp lễ tết\n \nQuà tặng cho người thân:\nCho Nàng', 4, 'PNJ', 550000),
(1484425983263, 7, 'Bông tai Bạc đính đá PNJSilver XMXMW000037', 'https://cdn.pnj.io/images/detailed/94/sbxm00h000037-bong-tai-bac-dinh-da-pnjsilver-1.png', 850000, 'Thương hiệu:\nPNJSilver\n \nBộ sưu tập:\nThe language of flowers\n \nLoại đá chính:\nXoàn mỹ\n \nMàu đá chính:\nTrắng\n \nHình dạng đá:\nTròn\n \nLoại đá phụ (nếu có):\nXoàn mỹ\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nNgày kỷ niệm\nCác dịp lễ tết\n \nQuà tặng cho người thân:\nCho Nàng\nCho Mẹ', 4, 'Kim Loan', 780000),
(1484425983264, 3, 'Dây cổ Vàng 14K đính Ngọc trai Freshwater PNJ PFXMH000002', 'https://cdn.pnj.io/images/detailed/96/gcpfxmx000001-day-co-vang-14k-dinh-ngoc-trai-freshwater-pnj-001.png', 12000000, 'Thương hiệu:\nPNJ\n \nLoại đá chính:\nFreshwater Pearl\n \nLoại đá phụ (nếu có):\nXoàn mỹ\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nCầu hôn\nQuà cưới - Kỷ niệm ngày cưới\n \nQuà tặng cho người thân:\nCho Nàng\nCho Mẹ\n \nTrọng lượng vàng tham khảo (phân vàng):\n8.21000', 5, 'PNJ', 10000000),
(1484425983265, 3, 'Dây chuyền Vàng trắng 18K PNJ 0000W000480', 'https://cdn.pnj.io/images/detailed/82/gd0000w000480-day-chuyen-vang-trang-18k-pnj-02.png', 24100000, 'Thương hiệu:\nPNJ\n \nLoại đá chính:\nKhông gắn đá\n \nLoại đá phụ (nếu có):\nKhông gắn đá\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nCầu hôn\nQuà cưới - Kỷ niệm ngày cưới\n \nQuà tặng cho người thân:\nCho Nàng\nCho Mẹ\n \nSở thích:\nDuyên dáng\n \nPhong cách:\nDoanh Nhân\n \nTrọng lượng vàng tham khảo (phân vàng):\n42.86928', 5, 'PNJ', 22001000),
(1484425983266, 3, 'Dây chuyền Vàng Ý 18K PNJ 0000X000037', 'https://cdn.pnj.io/images/detailed/86/gd0000w060381-day-chuyen-vang-y-18k-pnj-1.png', 19100000, '                                   Thương hiệu:\nPNJ\n \nLoại đá chính:\nKhông gắn đá\n \nLoại đá phụ (nếu có):\nKhông gắn đá\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nNgày kỷ niệm\nCác dịp lễ tết\n \nQuà tặng cho người thân:\nCho Nàng\nCho Mẹ\n \nTrọng lượng vàng tham khảo (phân vàng):\n32.16256\n                                ', 5, 'Kim Loan', 17500000),
(1484425983267, 3, 'Dây cổ Vàng 18K đính đá Ruby PNJ RBMXY000004', 'https://cdn.pnj.io/images/detailed/91/gcrbmxy000002-day-co-vang-18k-dinh-da-ruby-pnj-001.png', 32300000, 'Thương hiệu:\nPNJ\n \nLoại đá chính:\nRuby\n \nMàu đá chính:\nĐỏ\n \nHình dạng đá:\nTròn\n \nLoại đá phụ (nếu có):\nMix đá\n \nGiới tính:\nNữ\n \nDịp tặng quà:\nSinh nhật\nTình yêu\nNgày kỷ niệm\n \nQuà tặng cho người thân:\nCho Nàng\nCho Mẹ\n \nTrọng lượng vàng tham khảo (phân vàng):\n33.45682\n \nKích thước đá (tham khảo):\n7.0 ly', 5, 'PNJ', 29000000),
(1484425983268, 1, 'Đồng Hồ Thông Minh Fossil Nữ FTW6054 Dây Da 44mm', 'https://cdn.pnj.io/images/thumbnails/800/800/detailed/75/FTW6054_Desktop_1.jpg', 790070, 'Thương hiệu:\nFossil\n \nGiới tính:\nNữ\n \nPhong cách:\nThời Trang\n \nKích thước dây:\n22mm\n \nKích thước mặt:\n40 - 45mm\n \nĐộ dày vỏ máy:\n12mm\n \nXuất Xứ Thương Hiệu:\nMỹ\n \nXuất xứ bộ máy:\nNhật Bản\n \nLắp ráp tại:\nTrung Quốc\n \nLoại máy đồng hồ:\nQuartz\n \nLoại mặt kính:\nKính Phản Quang\n \nChất liệu vỏ:\nVỏ Thép Cao Cấp Không Gỉ 316L\n \nHình dạng mặt:\nTròn\n \nĐộ chịu nước:\n30m\n \nSố Kim:\n0 Kim\n \nĐá Gắn Kèm Đồng Hồ:\nĐá quý\n \nChứng nhận Chronometer:\nKhông\n \nChức năng chính:\nKhác', 10, 'Fossil', 700000),
(1484425983269, 1, 'Đồng Hồ Thông Minh Michael Kors Nữ MKT5071 Dây Cao Su 43mm', 'https://cdn.pnj.io/images/thumbnails/600/600/detailed/75/MKT5071_Desktop_1.jpg', 797000, 'Thương hiệu:\nMichael Kors\n \nGiới tính:\nNữ\n \nPhong cách:\nThời Trang\n \nKích thước dây:\n20mm\n \nKích thước mặt:\n40 - 45mm\n \nĐộ dày vỏ máy:\n7mm\n \nXuất Xứ Thương Hiệu:\nMỹ\n \nXuất xứ bộ máy:\nNhật Bản\n \nLắp ráp tại:\nTrung Quốc\n \nLoại máy đồng hồ:\nQuartz\n \nLoại mặt kính:\nKính Phản Quang\n \nChất liệu vỏ:\nVỏ Thép Cao Cấp Không Gỉ 316L\n \nHình dạng mặt:\nTròn\n \nĐộ chịu nước:\n30m\n \nSố Kim:\n0 Kim', 5, 'Michael Kors', 700000),
(1484425983270, 1, 'Đồng Hồ Thông Minh Michael Kors Nữ MKT5070 Dây Cao Su 43mm', 'https://cdn.pnj.io/images/thumbnails/600/600/detailed/75/MKT5070_Desktop_1.jpg', 8000000, 'Thương hiệu:\nMichael Kors\n \nGiới tính:\nNữ\n \nPhong cách:\nThời Trang\n \nKích thước dây:\n20mm\n \nKích thước mặt:\n40 - 45mm\n \nĐộ dày vỏ máy:\n7mm\n \nXuất Xứ Thương Hiệu:\nMỹ\n \nXuất xứ bộ máy:\nNhật Bản\n \nLắp ráp tại:\nTrung Quốc\n \nLoại máy đồng hồ:\nQuartz\n \nLoại mặt kính:\nKính Phản Quang\n \nChất liệu vỏ:\nVỏ Thép Cao Cấp Không Gỉ 316L\n \nHình dạng mặt:\nTròn\n \nĐộ chịu nước:\n30m\n \nSố Kim:\n0 Kim\n \nĐá Gắn Kèm Đồng Hồ:\nKhông gắn đá\n \nChứng nhận Chronometer:\nKhông\n \nChức năng chính:\nKhác', 5, ' Michael Kors', 7600000),
(1484425983271, 1, 'Đồng Hồ Citizen Nữ EQ0608-55E Dây Thép Không Gỉ 28mm', 'https://cdn.pnjwatch.com.vn/3227/1576233663606EQ0608-55E-Desktop-1.jpg', 3550000, 'Thương hiệu:\nCitizen\n \nGiới tính:\nNữ\n \nPhong cách:\nCổ Điển\n \nKích thước dây:\n14mm\n \nĐộ dày vỏ máy:\n7mm\n \nXuất Xứ Thương Hiệu:\nNhật Bản\n \nXuất xứ bộ máy:\nNhật Bản\n \nLắp ráp tại:\nTrung Quốc\n \nLoại máy đồng hồ:\nQuartz\n \nLoại mặt kính:\nKính Khoáng Cứng\n \nChất liệu vỏ:\nVỏ Thép Không Gỉ Mạ PVD\n \nHình dạng mặt:\nTròn\n \nĐộ chịu nước:\n50m\n \nSố Kim:\n3 Kim\n \nĐá Gắn Kèm Đồng Hồ:\nKhông gắn đá\n \nChứng nhận Chronometer:\nKhông\n \nChức năng chính:\nLịch', 5, ' Citizen', 2800000),
(1484425983272, 4, 'Lắc tay cưới Vàng 24K PNJ Thiên Đường Hạnh Phúc 0000Y000051', 'https://cdn.pnj.io/images/detailed/37/gldrya74034.014-lac-tay-cuoi-pnj-thien-duong-hanh-phuc-vang-24k-01.png', 31500000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nThiên đường hạnh phúc\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n56.76737', 10, 'PNJ', 29000000),
(1484425983273, 4, 'Vòng tay cưới Vàng 24K PNJ 0000Y060002', 'https://cdn.pnj.io/images/detailed/94/gv0000y060002-vong-tay-cuoi-vang-24k-pnj.png', 11700000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nHạnh phúc vàng\r\n \r\nLoại đá chính:\r\nKhông gắn đá\r\n \r\nLoại đá phụ (nếu có):\r\nKhông gắn đá\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n20.00000', 10, 'PNJ', 10000000),
(1484425983275, 4, 'Vòng tay Vàng trắng 10K đính đá ECZ PNJ Sắc Hoa Tinh Khôi XMXMW000062', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/35/GVDRWB86074.100-vong-tay-cuoi-pnj-sac-hoa-tinh-khoi-vang-trang-10k-dinh-da-ecz.png', 15700000, 'Thương hiệu:\r\nPNJ\r\n \r\nLoại đá chính:\r\nXoàn mỹ\r\n \r\nLoại đá phụ (nếu có):\r\nXoàn mỹ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n32.94625', 10, 'PNJ', 13000000),
(1484425983276, 4, 'Lắc tay Vàng 24K PNJ 0000Y001460', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/85/gl0000y001460-lac-tay-vang-24k-pnj-01.png', 11000000, 'Thương hiệu:\r\nPNJ\r\n \r\nLoại đá chính:\r\nKhông gắn đá\r\n \r\nLoại đá phụ (nếu có):\r\nKhông gắn đá\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n18.59020', 10, 'PNJ', 10000000),
(1484425983277, 2, 'Nhẫn Kim cương Vàng 18K PNJ DDDDC000156', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/93/gnddddc000156-nhan-kim-cuong-vang-18k-pnj.png', 89400000, 'Thương hiệu:\r\nPNJ\r\n \r\nLoại đá chính:\r\nDiamond\r\n \r\nMàu đá chính:\r\nTrắng\r\n \r\nHình dạng đá:\r\nTròn\r\n \r\nLoại đá phụ (nếu có):\r\nDiamond\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n7.98000\r\n \r\nCut (Giác cắt/ Hình dạng kim cương):\r\n57\r\n \r\nKích thước đá chính (tham khảo):\r\n5.4 ly\r\n \r\nColor (Màu sắc/ Nước kim cương):\r\nF\r\n \r\nClarity (Độ tinh khiết):\r\nSI1\r\n \r\nGiấy kiểm định:\r\nCó', 5, 'PNJ', 85600000),
(1484425983278, 4, 'Lắc tay cưới Vàng 24K PNJ Bốn Mùa Yêu Thương 0000Y000045', 'https://cdn.pnj.io/images/detailed/27/gldrya56305.014-lac-tay-bo-bon-mua-yeu-thuong-vang-24k-2.png', 24300000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nBốn Mùa Yêu Thương\r\n \r\nMàu đá chính:\r\nĐang cập nhật\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n41.84333', 5, 'PNJ', 20000000),
(1484425983279, 4, 'Vòng tay cưới Vàng 22K PNJ Duyên Ngọc Lan', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/34/gvdrya86728.000-vong-tay-cuoi-pnj-duyen-ngoc-lan-vang-22k-1.png', 25000000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nDuyên Ngọc Lan\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n42.61333', 10, 'PNJ', 20000000),
(1484425983280, 3, 'Dây cổ cưới Vàng 24K PNJ Hoa Duyên 0000Y000022', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/26/gcdrya47568.014-day-co-cuoi-pnj-hoa-duyen-vang-24k.png', 30100000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nHoa Duyên\r\n \r\nMàu đá chính:\r\nĐang cập nhật\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n52.25957', 5, 'PNJ', 29000000),
(1484425983281, 3, 'Dây cổ cưới Vàng 22K PNJ Nhịp Khúc Tình Xuân 0000Y000040', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/27/GCDRYA83927.000.jpg', 92700000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nNhịp Khúc Tình Xuân\r\n \r\nMàu đá chính:\r\nĐang cập nhật\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n178.53000', 5, 'PNJ', 89000000),
(1484425983282, 2, 'Nhẫn Vàng trắng 14K đính ngọc trai Akoya PNJ PAXMW000064', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/51/gndrwb87736.601-nhan-pnj-vang-trang-14k-dinh-ngoc-trai-akoya-wb87736.601.png', 5650000, 'Thương hiệu:\r\nPNJ\r\n \r\nLoại đá chính:\r\nNgọc trai\r\n \r\nMàu đá chính:\r\nTrắng\r\n \r\nHình dạng đá:\r\nTròn\r\n \r\nLoại đá phụ (nếu có):\r\nECZ - Swarovski\r\n \r\nMàu đá phụ (nếu có):\r\nTrắng\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n4.89700\r\n \r\nKích thước đá (tham khảo):\r\n6.0 ly\r\n \r\nLoại ngọc trai:\r\nAkoya', 15, 'PNJ', 5000000),
(1484425983283, 7, 'Bông tai cưới Vàng 24K PNJ Hoa Duyên 0000Y000079', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/26/gbdrya47566.014-bong-tai-cuoi-pnj-vang-24k-001.png', 6172000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nHoa Duyên\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n10.32200', 5, 'PNJ', 5500000),
(1484425983284, 7, 'Bông tai Vàng 10K đính đá Suncut PNJ ZTXMY000524', 'https://cdn.pnj.io/images/thumbnails/300/300/detailed/70/gbztxmy000524-bong-tai-vang-10k-dinh-da-suncut-swarovski-pnj.png', 5024000, 'Thương hiệu:\r\nPNJ\r\n \r\nBộ sưu tập:\r\nSunflower\r\n \r\nLoại đá chính:\r\nSythetic\r\n \r\nLoại đá phụ (nếu có):\r\nXoàn mỹ\r\n \r\nGiới tính:\r\nNữ\r\n \r\nTrọng lượng vàng tham khảo (phân vàng):\r\n6.78105', 10, 'PNJ', 4500000),
(1484425983285, 1, 'Đồng Hồ Tissot Nữ T109.210.36.031.00 Dây Da 30mm', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/54/wdf36t03284.000-t109.210.36.031.00-dong-ho-thoi-trang-nu-day-da-tissot.png', 5832000, 'Thương hiệu:\r\nTissot\r\n \r\nGiới tính:\r\nNữ\r\n \r\nPhong cách:\r\nCổ điển\r\n \r\nKích thước mặt:\r\n25 - 30mm\r\n \r\nXuất Xứ Thương Hiệu:\r\nThụy Sỹ\r\n \r\nXuất xứ bộ máy:\r\nThụy Sỹ\r\n \r\nLắp ráp tại:\r\nThụy Sỹ\r\n \r\nLoại máy đồng hồ:\r\nQuartz\r\n \r\nLoại mặt kính:\r\nKính Sapphire\r\n \r\nChất liệu dây:\r\nDây Da\r\n \r\nChất liệu vỏ:\r\nVỏ Thép Cao Cấp Không Gỉ 316L\r\n \r\nHình dạng mặt:\r\nTròn\r\n \r\nĐộ chịu nước:\r\n30m\r\n \r\nSố Kim:\r\n3 Kim\r\n \r\nĐá Gắn Kèm Đồng Hồ:\r\nKhông gắn đá\r\n \r\nChứng nhận Chronometer:\r\nKhông\r\n \r\nChức năng chính:\r\nKhác', 10, 'Tissot', 5200000),
(1484425983286, 1, 'Đồng Hồ Tissot Nữ T050.207.37.017.05 Dây Da 35mm', 'https://cdn.pnj.io/images/thumbnails/435/435/detailed/76/T050.207.37.017.05_Desktop_1.jpg', 18500000, 'Thương hiệu:\r\nTissot\r\n \r\nGiới tính:\r\nNữ\r\n \r\nPhong cách:\r\nThời Trang\r\n \r\nKích thước dây:\r\n16mm\r\n \r\nĐộ dày vỏ máy:\r\n9.8mm\r\n \r\nXuất Xứ Thương Hiệu:\r\nThụy Sỹ\r\n \r\nXuất xứ bộ máy:\r\nThụy Sỹ\r\n \r\nLắp ráp tại:\r\nThụy Sỹ\r\n \r\nLoại máy đồng hồ:\r\nAutomatic\r\n \r\nLoại mặt kính:\r\nKính Sapphire\r\n \r\nChất liệu vỏ:\r\nVỏ Thép Không Gỉ Mạ PVD\r\n \r\nHình dạng mặt:\r\nTròn\r\n \r\nĐộ chịu nước:\r\n30m\r\n \r\nSố Kim:\r\n3 Kim\r\n \r\nĐá Gắn Kèm Đồng Hồ:\r\nĐá pha lê\r\n \r\nChứng nhận Chronometer:\r\nKhông\r\n \r\nChức năng chính:\r\nKhông Có', 10, 'Tissot', 1700000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `ratings` bigint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ratings`
--

INSERT INTO `ratings` (`rating_id`, `user_id`, `product_id`, `ratings`) VALUES
(1, 54, 3, 4),
(3, 55, 2, 4),
(4, 56, 4, 2),
(5, 54, 4, 5),
(13, 54, 3, 1),
(14, 54, 3, 5),
(15, 54, 3, 3),
(25, 54, 8, 1),
(26, 54, 6, 2),
(27, 54, 6, 5),
(28, 54, 5, 5),
(29, 54, 5, 5),
(30, 54, 5, 4),
(31, 54, 5, 5),
(32, 54, 4, 2),
(33, 54, 7, 5),
(34, 54, 7, 4),
(35, 54, 9, 4),
(36, 54, 9, 2),
(37, 54, 9, 2),
(38, 54, 9, 5),
(40, 1, 1484425983281, 5),
(41, 1, 1484425983281, 4),
(42, 1, 1484425983281, 1),
(43, 1, 1484425983281, 5),
(44, 1, 1484425983281, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usergroup`
--

CREATE TABLE `usergroup` (
  `usergroup_id` int(11) NOT NULL,
  `usergroup_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `usergroup`
--

INSERT INTO `usergroup` (`usergroup_id`, `usergroup_name`) VALUES
(1, 'customer'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_role` bit(1) NOT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_diachi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_pass`, `user_role`, `usergroup_id`, `phone`, `user_name`, `user_diachi`) VALUES
(1, 'user@email.com', '123456', b'0', 1, '0983737384', 'abc', 'bình phước'),
(2, 'admin@email.com', '123456', b'0', 2, NULL, NULL, NULL),
(3, 'user1@gmail.com', '123123', b'0', 1, '052335156', 'Tran Minh Quan', 'Binh Phuoc'),
(4, 'user2@email.com', '123123', b'0', 1, '0937282348', 'Nguyen Hoai Nam', 'Dak lak'),
(12, 'hongnhungtdm0905@gmail.com', '1', b'0', 1, '0984259410', 'Do Thi Hong Nhung', 'Binh Phuoc'),
(13, 'akjsdfakjsdh#@gmail.com', '123', b'0', 1, '0984259410', NULL, NULL),
(14, 'ggg@ggg', '123', b'0', 1, '0984259410', NULL, NULL),
(18, 'customer2@gmail.com', '1111', b'0', 1, '0848723438', 'Hoai Nam 1', 'dak lak');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_detail_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`usergroup_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45466351;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `bill_detail_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1484425983287;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
