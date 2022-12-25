-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 06:48 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstoredb3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `pass` varchar(40) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `pass`) VALUES
('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `book_title` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `book_author` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `book_image` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `book_descr` text COLLATE latin1_general_ci DEFAULT NULL,
  `book_price` decimal(6,2) NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `categoryid`) VALUES
('001', 'Mikhail', 'Ramlee Awang Murshid', 'mikhail-new-front.jpg', 'MIKHAIL – bukan sekadar sebuah nama. Selama 16 tahun menjadi pelarian di perantauan, dia muncul semula memburu mangsa-mangsanya. Mikhail membunuh kerana dendam lama. Sewaktu usia remaja, keluarganya telah ditembak mati. Mikhail telah diselamatkan Dickens, seorang lelaki Amerika Syarikat yang juga merupakan rakan niaga ayahnya, Tuan Sadon. Dickens melatih Mikhail menjadi seorang pembunuh profesional untuk membela kematian keluarga.\r\nDalam pada itu, Mikhail juga menghidapi sejenis penyakit paranormal. Apabila retina matanya terkena cahaya matahari atau silauan lampu yang terang lagi tajam, dia akan berada dalam satu dimensi yang tidak diketahui. Kadangkala dia terperangkap antara dua dimensi – fantasi dan realiti. Akibatnya, Mikhail sukar membezakan mana yang benar.\r\nRAMLEE AWANG MURSHID menampilkan novel MIKHAIL sebagai satu agenda yang dipengaruhi wang bertunjangkan kuasa. Wang serta kuasa dijadikan sandaran sebagai satu simbol kejahatan. Mereka yang enggan bekerjasama akan dijatuhkan hukuman mati. Mikhail pula adalah alat kepada misi pembunuhan itu. Saspens dan penuh emosi!', '34.91', 1),
('002', 'Adobe Photoshop CC For Dummies', 'Peter Bauer', 'photoshop.jpg', 'Photoshop is a stunning program that puts the power of a professional photography studio into your hands, but it can also be a jungle to navigate—with a dense proliferation of menus, panels, shortcuts, plug-ins, and add-ons to get thoroughly lost in. Written by a literal Photoshop Hall of Famer, the new edition of Photoshop CC For Dummies is your experienced guide to the technical terrain, slashing away the foliage for a clear picture of how to produce the perfectly framed and beautifully curated images you want.\r\n\r\nBeginning with an overview of the basic kit bag you need for your journey toward visual mastery, Peter Bauer—Photoshop instructor and an award-winning fine art photographer in his own right—shows you how to build your skills and enrich your creative palette with enhanced colors and tone, filters and layering, and even how undertake a foray into digital painting. Add in instructions on combining text with images and the how-tos of video and animation editing, and you have all the tools you need to carve out a one-person multimedia empire', '100.46', 5),
('003', 'PHP & MySQL : Server-side Web Development', 'Jon Duckett', 'php_mysql.jpg', 'Learn PHP, the programming language used to build sites like Facebook, Wikipedia and WordPress, then discover how these sites store information in a database (MySQL) and use the database to create the web pages.\r\n\r\nThis full-color book is packed with inspiring code examples, infographics and photography that not only teach you the PHP language and how to work with databases, but also show you how to build new applications from scratch. It demonstrates practical techniques that you will recognize from popular sites', '168.93', 5),
('004', 'A Family Recipe : A deliciously feel-good story of family and friendship, from the Sunday Times bestselling author', 'Veronica Henry', 'family_recipe.jpg', 'Laura Griffin is preparing for an empty nest. The thought of Number 11 Lark Hill falling silent - a home usually bustling with noise, people and the fragrant smells of something cooking on the Aga - seems impossible. Laura hopes it will mean more time for herself, and more time with her husband, Dom.', '33.14', 4),
('005', 'The Fast 800 Recipe Book : Low-carb, Mediterranean-style recipes for intermittent fasting and long-term health', 'Dr Clare Bailey', 'recipe_book.jpg', 'Dr Clare Bailey, GP, and acclaimed food writer Justine Pattison have created meals which are tasty and easy to make, from breakfasts and brunches, soups and shakes to more substantial suppers and even occasional indulgent treats. All the recipes are based on the low-carb Mediterranean style of eating now proven to revolutionise your health.\r\n\r\nWhether you are embarking on an intensive weight-loss programme to prevent or reverse Type 2 diabetes, or simply want to bring down your blood pressure and cholesterol and improve your mood and general health, The Fast 800 Recipe Book will inspire you to change the way you eat for ever.', '42.11', 4),
('006', 'Crooked Kingdom', 'Leigh Bardugo', 'crooked_kingdom.jpg', 'After pulling off a seemingly impossible heist in the notorious Ice Court, criminal prodigy Kaz Brekker feels unstoppable. But life is about to take a dangerous turn - and with friends who are among the deadliest outcasts in Ketterdam city, Kaz is going to need more than luck to survive in this unforgiving underworld.', '58.81', 1),
('007', 'It Ends With Us', 'Colleen Hoover', 'novel1.jpg', 'Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.\r\n\r\nRyle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.\r\n\r\nAs questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.', '38.29', 1),
('008', 'Before the Coffee Gets Cold', 'Toshikazu Kawaguchi', 'before_coffee_get_cold.jpg', 'If you could go back, who would you want to meet?\r\n\r\nIn a small back alley of Tokyo, there is a café that has been serving carefully brewed coffee for more than one hundred years. Local legend says that this shop offers something else besides coffee—the chance to travel back in time.\r\n\r\nOver the course of one summer, four customers visit the café in the hopes of making that journey. But time travel isn’t so simple, and there are rules that must be followed. Most important, the trip can last only as long as it takes for the coffee to get cold.\r\n\r\nHeartwarming, wistful, mysterious and delightfully quirky, Toshikazu Kawaguchi’s internationally bestselling novel explores the age-old question: What would you change if you could travel back in time?', '34.73', 2),
('009', 'Attack on Titan, Volume 20', 'Hajime Isayama', 'Aotvol20.jpg', 'With his hometown in ruins, young Eren Yeager becomes determined to fight back against the giant Titans that threaten to destroy the human race.', '19.90', 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `category_name`) VALUES
(1, 'Novel'),
(2, 'Non Fiction'),
(3, 'Comic'),
(4, 'Recipe'),
(5, 'Study');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerid` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE latin1_general_ci NOT NULL,
  `address` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `city` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `zip_code` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `country` varchar(60) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerid`, `name`, `address`, `city`, `zip_code`, `country`) VALUES
(5, 'angel jude suarez', 'brgy. tooy', 'himamaylan city', '6108', 'philippines'),
(12, 'Hanafi', 'No 4, Jln Sesat, Pangsapuri Bahagia,', 'Alor Gajah', '78000', 'Malaysia'),
(13, 'Siti', 'No 2, Jln Sentosa, Tmn Damai', 'Batu Pahat', '78000', 'Malaysia');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `customerid` int(10) UNSIGNED NOT NULL,
  `amount` decimal(6,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ship_name` char(60) COLLATE latin1_general_ci NOT NULL,
  `ship_address` char(80) COLLATE latin1_general_ci NOT NULL,
  `ship_city` char(30) COLLATE latin1_general_ci NOT NULL,
  `ship_zip_code` char(10) COLLATE latin1_general_ci NOT NULL,
  `ship_country` char(20) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `customerid`, `amount`, `date`, `ship_name`, `ship_address`, `ship_city`, `ship_zip_code`, `ship_country`) VALUES
(7, 5, '20.00', '2021-03-10 05:03:55', 'angel jude suarez', 'brgy. tooy', 'himamaylan city', '6108', 'philippines'),
(20, 12, '59.70', '2022-01-09 22:39:31', 'Hanafi', 'No 4, Jln Sesat, Pangsapuri Bahagia,', 'Alor Gajah', '78000', 'Malaysia'),
(21, 12, '34.91', '2022-01-09 22:40:27', 'Hanafi', 'No 4, Jln Sesat, Pangsapuri Bahagia,', 'Alor Gajah', '78000', 'Malaysia'),
(22, 13, '34.91', '2022-01-09 22:47:05', 'Siti', 'No 2, Jln Sentosa, Tmn Damai', 'Batu Pahat', '78000', 'Malaysia');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `book_id` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`orderid`, `book_id`, `item_price`, `quantity`) VALUES
(1, '978-1-118-94924-5', '20.00', 1),
(1, '978-1-44937-019-0', '20.00', 1),
(1, '978-1-49192-706-9', '20.00', 1),
(2, '978-1-118-94924-5', '20.00', 1),
(2, '978-1-44937-019-0', '20.00', 1),
(2, '978-1-49192-706-9', '20.00', 1),
(3, '978-0-321-94786-4', '20.00', 1),
(1, '978-1-49192-706-9', '20.00', 1),
(5, '978-1-484217-26-9', '20.00', 4),
(5, '978-1-118-94924-5', '20.00', 1),
(7, '978-0-321-94786-4', '20.00', 1),
(7, '978-0-7303-1484-4', '20.00', 1),
(7, '978-1-118-94924-5', '20.00', 1),
(10, '002', '45.41', 3),
(10, '002', '45.41', 1),
(12, '002', '45.41', 1),
(10, '007', '97.83', 1),
(12, '010', '100.46', 1),
(12, '001', '38.29', 6),
(12, '006', '95.70', 1),
(12, '011', '19.90', 1),
(12, '001', '38.29', 5),
(16, '011', '19.90', 1),
(16, '006', '95.70', 1),
(10, '011', '19.90', 3),
(18, '002', '45.41', 1),
(19, '001', '38.29', 1),
(20, '009', '19.90', 3),
(20, '001', '34.91', 1),
(22, '001', '34.91', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`name`,`pass`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
