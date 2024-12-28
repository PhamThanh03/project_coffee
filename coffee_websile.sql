-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 17, 2024 lúc 03:55 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `coffee_websile`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `user_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(1, 1, 1, 'CÀ PHÊ ĐEN', 25000, 1, 'caffe-den.jpg'),
(204, 13, 1, 'SINH TỐ BƠ', 35000, 1, 'sinh-to-bo.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(2, 'COFFE', 'coffee.png', 1),
(4, 'TRÀ SỮA', 'tra-sua.png', 1),
(6, 'TRÀ', 'tra.png', 1),
(8, 'SINH TỐ', 'sinh-to.png', 1),
(10, 'NƯỚC ÉP', 'nuoc-ep.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(11, 'Ngậy và ngon', '2024-12-11 22:15:38', 1, 21, 16);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(165, 75, 16, 1, 40000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(75, 21, '2024-12-11 22:09:27', 40000, 'HN', '0987656543', '', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(13, 1, 'Cách tự pha coffee tại nhà', 'bai-vie.png', 'Thanh', '<p>thật tuyệt vời khi tự tay pha được những tách coffe ngon do chính tay mình làm</p><p>&nbsp;</p>', 1, 1, '2024-12-11 22:19:28', '2024-12-13 15:19:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(1, 'Các tin tức về coffe'),
(2, 'Các loại coffee nổi bật'),
(9, 'Giới thiệu về coffee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 2, 'CÀ PHÊ ĐEN', 'ca-phe-den.jpg', 100, 25000, 20000, '2023-03-18 08:22:03', 4, '<p>Cà phê đen Việt Nam là loại cà phê đậm đà, được pha chế từ hạt cà phê Robusta hoặc Arabica rang xay, qua phin nhỏ giọt truyền thống. Vị đắng mạnh, hương thơm nồng, thường được thưởng thức nguyên chất hoặc thêm chút đường. Đây là thức uống biểu tượng của văn hóa cà phê Việt.</p>', '<p>Mã SP : &nbsp;CFD09865356 &nbsp;Loại : COFEE</p>', 1),
(2, 2, 'CÀ PHÊ NÂU', 'ca-phe-nau.jpg', 100, 25000, 20000, '2023-03-19 08:22:03', 2, '<p>Cà phê nâu Việt Nam là sự kết hợp giữa cà phê phin đậm đà và sữa đặc ngọt béo. Với vị hài hòa giữa đắng và ngọt, cà phê nâu thường được uống nóng hoặc thêm đá, là lựa chọn phổ biến trong văn hóa cà phê Việt Nam.</p>', '<p>Mã SP : &nbsp;CFN09865356 &nbsp;Loại : COFEE</p>', 1),
(3, 2, 'BẠC XỈU', 'bac-xiu.png', 100, 30000, 24000, '2023-03-20 08:22:03', 3, '<p>Bạc xỉu là món uống truyền thống của Việt Nam, pha chế từ sữa đặc béo ngọt và một lượng nhỏ cà phê phin. Hương vị nhẹ nhàng, ngọt ngào, thường được ưa chuộng uống nóng hoặc lạnh, lý tưởng cho những ai thích vị cà phê dịu nhẹ.</p>', '<p>Mã SP : &nbsp;BX09865356 &nbsp;Loại : COFEE</p>', 1),
(4, 2, 'CÀ PHÊ MUỐI', 'ca-phe-muoi.png', 100, 35000, 28000, '2023-03-21 08:22:03', 2, '<p>Cà phê muối là một món đặc sản nổi tiếng ở miền Trung Việt Nam, đặc biệt là ở Đà Nẵng. Món cà phê này được pha chế từ cà phê đen nguyên chất, sau đó thêm một chút muối tinh và sữa đặc. Vị đắng của cà phê kết hợp với vị mặn nhẹ của muối tạo nên một hương vị lạ miệng và cân bằng, giúp giảm bớt độ đắng và làm tăng sự đậm đà cho thức uống. Cà phê muối thường được uống lạnh, rất thích hợp trong những ngày nóng.</p>', '<p>Mã SP : &nbsp;CFM09865356 &nbsp;Loại : COFEE</p>', 1),
(5, 4, 'TRÀ SỮA TRÂN CHÂU', 'tra-sua-tran-chau.png', 100, 30000, 24000, '2023-04-18 08:22:03', 6, '<p>Trà sữa trân châu là một loại đồ uống phổ biến, kết hợp giữa trà (thường là trà đen hoặc trà xanh), sữa đặc hoặc sữa tươi và những viên trân châu dẻo, thường làm từ bột năng và đường nâu. Vị ngọt béo của sữa hòa quyện với hương trà thanh mát, trong khi trân châu mang đến cảm giác chewy, tạo nên sự thú vị cho người uống. Món này thường được thưởng thức lạnh với đá và có thể thêm các hương vị khác như matcha, socola hoặc trái cây.</p>', '<p>Mã SP : &nbsp;TSCT09865356 &nbsp;Loại : TRÀ SỮA</p>', 1),
(6, 4, 'TRÀ SỮA TRÂN CHÂU ĐƯỜNG ĐEN', 'tra-sua-tran-chau-duong-den.png', 100, 30000, 24000, '2023-04-19 08:22:03', 2, '<p>Trà sữa trân châu đường đen là phiên bản đặc biệt của trà sữa, trong đó đường đen thay thế cho đường thông thường, tạo ra một vị ngọt đậm đà và hơi caramel. Món này được pha chế từ trà đen hoặc trà xanh, sữa tươi hoặc sữa đặc và trân châu đường đen. Trân châu trong món này được nấu với đường đen, có màu nâu hấp dẫn và vị ngọt đặc trưng. Trà sữa trân châu đường đen thường được thưởng thức lạnh, mang đến một trải nghiệm ngọt ngào và thú vị cho người uống.</p>', '<p>Mã SP : &nbsp;TSTCDD09865356 &nbsp;Loại : TRÀ SỮA</p>', 1),
(7, 4, 'MATCHA KEM CHEESE', 'matcha-kem-chesse.png', 100, 35000, 28000, '2023-04-20 08:22:03', 1, '<p>Matcha kem cheese là một món đồ uống kết hợp giữa vị đắng nhẹ của matcha (bột trà xanh) và vị béo ngậy, mịn màng của kem cheese (phô mai kem). Món này thường được pha chế với trà matcha đặc, thêm một lớp kem cheese phía trên, tạo nên sự kết hợp hài hòa giữa vị trà xanh thanh mát và sự béo ngậy của kem phô mai. Được thưởng thức lạnh, matcha kem cheese mang đến một trải nghiệm vừa mới lạ vừa quen thuộc, thích hợp cho những ai yêu thích sự pha trộn giữa các hương vị độc đáo.</p>', '<p>Mã SP : &nbsp;MCKC09865356 &nbsp;Loại : TRÀ SỮA</p>', 1),
(8, 4, 'SOCOLA KEM TRỨNG', 'socola-kem-trung.png', 100, 40000, 32000, '2023-04-21 08:22:03', 9, '<p>Sô-cô-la kem trứng là món đồ uống hoặc tráng miệng kết hợp giữa sô-cô-la nóng hoặc lạnh và kem trứng (kem được làm từ lòng đỏ trứng, sữa và đường, đánh bông). Khi kết hợp với sô-cô-la, kem trứng tạo ra một vị ngọt béo, mượt mà, làm tăng thêm độ đậm đà và sự thơm ngon của sô-cô-la. Món này thường được thưởng thức vào mùa lạnh hoặc khi bạn muốn một món tráng miệng ngọt ngào, thơm lừng.</p>', '<p>Mã SP : &nbsp;SCLKT09865356 &nbsp;Loại : TRÀ SỮA</p>', 1),
(9, 6, 'TRÀ CHANH', 'tra-chanh.png', 100, 20000, 16000, '2023-05-10 08:22:03', 1, '<p>Trà chanh là một thức uống phổ biến tại Việt Nam, kết hợp giữa trà xanh hoặc trà đen với nước chanh tươi và đường. Vị trà thanh mát, kết hợp với chua nhẹ từ chanh và ngọt dịu của đường tạo nên một hương vị dễ uống, giải khát rất tốt, đặc biệt trong những ngày hè nóng bức. Trà chanh có thể uống lạnh với đá, hoặc nóng vào những ngày se lạnh, mang lại cảm giác thư giãn và sảng khoái.</p>', '<p>Mã SP : &nbsp;TC09865356 &nbsp;Loại : TRÀ</p>', 1),
(10, 6, 'TRÀ SEN VÀNG', 'tra-sen-vang.png', 100, 35000, 28000, '2023-05-11 08:22:03', 2, '<p>Trà sen vàng là một loại trà đặc biệt được chế biến từ lá trà xanh kết hợp với hoa sen tươi. Quá trình ướp trà với hoa sen tạo ra một hương thơm nhẹ nhàng, thanh thoát, đặc trưng của hoa sen. Trà sen vàng có màu vàng nhạt và hương vị tinh tế, dịu dàng, giúp thư giãn và giải tỏa căng thẳng. Đây là một trong những loại trà cao cấp, thường được ưa chuộng trong những dịp đặc biệt và là một phần trong văn hóa thưởng trà của người Việt.</p>', '<p>Mã SP : &nbsp;TSV09865356 &nbsp;Loại : TRÀ</p>', 1),
(11, 6, 'TRÀ ĐÀO CAM SẢ', 'tra-dao-cam-sa.png', 100, 40000, 32000, '2023-05-12 08:22:03', 2, '<p>Trà đào cam sả là một loại trà trái cây kết hợp giữa trà (thường là trà đen hoặc trà xanh) với hương vị tươi mới của đào, cam và sả. Món trà này có vị ngọt thanh của đào và cam, kết hợp với sự thơm mát của sả, tạo nên một thức uống giải khát rất được ưa chuộng, đặc biệt trong những ngày hè. Trà đào cam sả có thể uống lạnh với đá, mang đến cảm giác sảng khoái, dễ chịu và là sự kết hợp hoàn hảo giữa hương vị trái cây và trà.</p>', '<p>Mã SP : &nbsp;TDCS09865356 &nbsp;Loại : TRÀ</p>', 1),
(12, 6, 'TRÀ THẠCH VẢI', 'tra-thach-vai.png', 100, 35000, 28000, '2023-05-13 08:22:03', 3, '<p>Trà thạch vải là một loại trà kết hợp giữa trà xanh hoặc trà đen với thạch vải, tạo nên một thức uống vừa thanh mát vừa thú vị. Thạch vải được làm từ nước vải tươi, có độ giòn dai, thường được cắt thành các viên nhỏ, kết hợp với trà tạo ra một sự kết hợp độc đáo giữa vị ngọt nhẹ của vải và hương trà thanh tao. Trà thạch vải thường được uống lạnh với đá, rất thích hợp để giải khát trong những ngày hè oi ả.</p>', '<p>Mã SP : &nbsp;TTV09865356 &nbsp;Loại : TRÀ</p>', 1),
(13, 8, 'SINH TỐ BƠ', 'sinh-to-bo.png', 100, 35000, 28000, '2023-06-10 08:22:03', 34, '<p>Sinh tố bơ là một món thức uống bổ dưỡng, được làm từ quả bơ chín xay nhuyễn kết hợp với sữa tươi, sữa đặc hoặc sữa chua. Với vị béo ngậy từ bơ, món sinh tố này không chỉ thơm ngon mà còn giàu chất dinh dưỡng, đặc biệt là vitamin E và các axit béo tốt cho sức khỏe. Sinh tố bơ thường được thưởng thức lạnh, là lựa chọn lý tưởng cho những ngày nóng bức hoặc khi bạn cần một món ăn nhẹ bổ sung năng lượng.</p>', '<p>Mã SP : &nbsp;STB09865356 &nbsp;Loại : SINH TỐ</p>', 1),
(14, 8, 'SINH TỐ MÃNG CẦU', 'bo-mang-cau.png', 100, 35000, 28000, '2023-06-11 08:22:03', 1, '<p>Sinh tố mãng cầu là một món thức uống ngon miệng, được làm từ thịt mãng cầu chín xay nhuyễn kết hợp với sữa tươi hoặc sữa đặc, tạo nên một hương vị ngọt ngào và thơm mát. Mãng cầu có vị chua ngọt đặc trưng, kết hợp với độ béo từ sữa, mang đến một món sinh tố mịn màng, dễ uống và giàu vitamin C. Sinh tố mãng cầu thường được thưởng thức lạnh, là lựa chọn tuyệt vời cho mùa hè hoặc khi bạn muốn thưởng thức một món đồ uống bổ dưỡng.</p>', '<p>Mã SP : &nbsp;STMC09865356 &nbsp;Loại : SINH TỐ</p>', 1),
(15, 8, 'SINH TỐ BƠ KEM DỪA', 'bo-kem-dua.png', 100, 40000, 32000, '2023-06-12 08:22:03', 7, '<p>Sinh tố bơ kem dừa là một món thức uống đặc biệt, kết hợp giữa bơ chín xay nhuyễn với kem (thường là kem vani hoặc kem tươi) để tạo ra một hương vị béo ngậy và mịn màng. Món này còn có thể được thêm một chút sữa đặc hoặc sữa tươi để tăng thêm độ ngọt và độ mượt. Với vị béo của bơ và kem, sinh tố bơ kem rửa mang đến cảm giác ngậy ngậy, thơm ngon, thích hợp cho những ai yêu thích món sinh tố đậm đà và giàu dinh dưỡng. Món này thường được thưởng thức lạnh, rất thích hợp trong những ngày nóng.</p>', '<p>Mã SP : &nbsp;STBKD09865356 &nbsp;Loại : SINH TỐ</p>', 1),
(16, 8, 'SINH TỐ BƠ KEM TRỨNG', 'bo-kem-trung.png', 100, 40000, 32000, '2023-06-13 08:22:03', 14, '<p>Sinh tố bơ kem trứng là món thức uống kết hợp giữa bơ chín xay nhuyễn và kem trứng (kem làm từ lòng đỏ trứng, sữa và đường) tạo nên một hương vị béo ngậy, mịn màng và thơm lừng. Sự kết hợp giữa vị béo của bơ và kem trứng giúp tạo ra một món sinh tố đặc biệt, vừa ngọt ngào vừa dễ uống. Món này thường được thêm sữa tươi hoặc sữa đặc để tăng độ béo và mượt mà, mang lại trải nghiệm thưởng thức thú vị. Sinh tố bơ kem trứng thường được uống lạnh, rất thích hợp cho những ai yêu thích hương vị béo ngậy và giàu dinh dưỡng.</p>', '<p>Mã SP : &nbsp;STBKT09865356 &nbsp;Loại : SINH TỐ</p>', 1),
(47, 10, 'CAM TƯƠI', 'cam-tuoi.png', 100, 35000, NULL, '2024-12-12 03:03:04', 3, '<p>Nước cam tươi là thức uống tự nhiên được ép từ quả cam chín mọng, có màu vàng cam hấp dẫn, hương thơm dịu ngọt và vị chua nhẹ, tươi mát. Đây là nguồn cung cấp vitamin C dồi dào, giúp tăng cường sức khỏe và làm sảng khoái tinh thần.</p>', '<p>Mã SP : &nbsp;CT09865356 &nbsp;Loại : NƯỚC ÉP</p>', 1),
(48, 10, 'CHANH TƯƠI', 'chanh-tuoi.png', 50, 25000, NULL, '2024-12-12 03:13:50', 1, '<p>Nước ép chanh tươi là thức uống có vị chua thanh, được làm từ chanh tươi vắt lấy nước, thường pha thêm nước và đường hoặc mật ong để cân bằng hương vị. Loại nước này mang lại cảm giác sảng khoái, giúp giải nhiệt, hỗ trợ tiêu hóa và bổ sung vitamin C hiệu quả.</p>', '<p>Mã SP : &nbsp;CT09865357 &nbsp;Loại : NƯỚC ÉP</p>', 1),
(49, 10, 'CHANH LEO', 'chanh-leo.png', 50, 30000, NULL, '2024-12-12 03:19:13', 0, '<p>Nước ép chanh leo là thức uống tươi mát, được làm từ thịt quả chanh leo vắt hoặc xay lấy nước, thường pha thêm nước, đường hoặc mật ong để cân bằng vị chua ngọt. Nước ép có màu vàng óng, hương thơm đặc trưng, vị chua nhẹ xen lẫn ngọt dịu, rất giàu vitamin C và chất chống oxy hóa. Đây là lựa chọn lý tưởng để giải nhiệt, tăng cường sức khỏe và mang lại cảm giác sảng khoái.</p>', '<p>Mã SP : &nbsp;CL09865356 &nbsp;Loại : NƯỚC ÉP</p>', 1),
(50, 10, 'TÁO DỨA BẠC HÀ', 'tao-dua-bac-ha.png', 50, 30000, NULL, '2024-12-12 03:24:31', 1, '<p>Nước ép táo dứa bạc hà là sự kết hợp hài hòa giữa táo ngọt dịu, dứa chua nhẹ và lá bạc hà tươi mát. Thức uống này có hương vị thơm ngon, cân bằng giữa ngọt, chua và the mát, cùng màu sắc vàng xanh hấp dẫn. Giàu vitamin C, chất xơ và chất chống oxy hóa, nước ép táo dứa bạc hà không chỉ giúp giải nhiệt mà còn hỗ trợ tiêu hóa và tăng cường năng lượng tự nhiên.</p>', '<p>Mã SP : &nbsp;TDBH09865356 &nbsp;Loại : NƯỚC ÉP</p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(1, 'Thanh', '$2y$10$4hShjEqngahyNDfc3cCo8e5GOnMI/nSYosXJbd1/Z5sHCL0bMzVye', 'Thanh', 'user-default.png', 'thanh290903@gmail.com', '097654321', 'HN', 1, 1),
(21, 'Thanh03', '$2y$10$YfBUBz8SoI391sQavdHE4OtKq/qd30x3oNT9n1VtkB9VJy6dV4BIe', 'Thanh03', 'user-default.png', 'Thanh290903@gmail.com', '0987656543', 'HN', 0, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
