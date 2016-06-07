-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2016 at 05:09 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rupesh_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `ru_daily_routine`
--

CREATE TABLE IF NOT EXISTS `ru_daily_routine` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ru_friends`
--

CREATE TABLE IF NOT EXISTS `ru_friends` (
`id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `contact_no` int(15) NOT NULL,
  `mobile_no` int(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ru_income`
--

CREATE TABLE IF NOT EXISTS `ru_income` (
`id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` varchar(255) NOT NULL,
  `added_date` date NOT NULL,
  `company` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ru_income`
--

INSERT INTO `ru_income` (`id`, `date`, `amount`, `added_date`, `company`) VALUES
(4, '2015-12-10', '20000', '2015-12-12', 'Crossover Nepal');

-- --------------------------------------------------------

--
-- Table structure for table `ru_invoice`
--

CREATE TABLE IF NOT EXISTS `ru_invoice` (
`id` int(11) NOT NULL,
  `date` date NOT NULL,
  `total` int(11) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ru_invoice`
--

INSERT INTO `ru_invoice` (`id`, `date`, `total`, `added_date`) VALUES
(3, '2015-12-14', 220, '2015-12-15'),
(4, '2015-12-15', 120, '2015-12-27'),
(5, '2015-12-16', 200, '2016-01-10'),
(6, '2015-12-17', 110, '2016-01-10'),
(7, '2015-12-18', 130, '2016-01-10'),
(8, '2015-12-19', 1210, '2015-12-27'),
(10, '2015-12-21', 200, '2016-01-10'),
(11, '2015-12-22', 150, '2016-01-10'),
(12, '2015-12-23', 180, '2016-03-01'),
(13, '2015-12-24', 140, '2016-01-10'),
(14, '2015-12-25', 1275, '2015-12-27'),
(15, '2015-12-26', 1400, '2016-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `ru_invoice_item`
--

CREATE TABLE IF NOT EXISTS `ru_invoice_item` (
`id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total` float NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ru_invoice_item`
--

INSERT INTO `ru_invoice_item` (`id`, `item_name`, `qty`, `price`, `total`, `invoice_id`) VALUES
(9, 'tea', 3, 20, 60, 3),
(10, 'roti tarkari', 1, 100, 100, 3),
(11, 'donot', 1, 10, 10, 3),
(12, 'extra', 5, 10, 50, 3),
(44, 'extra', 5, 10, 50, 14),
(45, 'chana dunot +tea', 1, 50, 50, 14),
(46, 'tea+extra', 1, 30, 30, 14),
(47, 'lemontea', 2, 30, 60, 14),
(48, 'transport', 2, 18, 35, 14),
(49, 'guthi payment', 1, 1050, 1050, 14),
(56, 'shoe', 1, 150, 150, 8),
(57, 'extra', 1, 10, 10, 8),
(58, 'bear party', 1, 850, 850, 8),
(59, 'sausage', 2, 50, 100, 8),
(60, 'extra', 10, 10, 100, 8),
(64, 'vehicles', 2, 20, 40, 4),
(65, 'tea', 2, 20, 40, 4),
(66, 'chana tarkari', 1, 40, 40, 4),
(70, 'dental charge', 1, 1000, 1000, 15),
(71, 'chaumin', 3, 25, 75, 15),
(72, 'momo', 2, 80, 160, 15),
(73, 'sausage', 1, 75, 75, 15),
(74, 'panipuri', 2, 20, 40, 15),
(75, 'chatpat', 1, 50, 50, 15),
(76, 'vehicles', 2, 20, 40, 13),
(77, 'allu+chiya+chana', 2, 50, 100, 13),
(81, 'extra', 1, 10, 10, 11),
(82, 'chana+allu+chiya', 1, 50, 50, 11),
(83, 'chiya_extra', 1, 50, 50, 11),
(84, 'transport charge', 2, 20, 40, 11),
(85, 'momo', 1, 100, 100, 5),
(86, 'tea', 1, 50, 50, 5),
(87, 'extra', 5, 10, 50, 5),
(88, 'vehicles', 2, 15, 30, 10),
(89, 'tea+chanaalu', 2, 25, 50, 10),
(90, 'tea+friedrice', 1, 120, 120, 10),
(91, 'khaja set', 1, 50, 50, 7),
(92, 'tea', 1, 30, 30, 7),
(93, 'extra', 1, 50, 50, 7),
(97, 'chaumin', 1, 30, 30, 6),
(98, 'tea', 2, 20, 40, 6),
(99, 'extra', 2, 20, 40, 6),
(100, 'transport charge', 2, 40, 80, 12),
(101, 'alluchana', 1, 40, 40, 12),
(102, 'tea+extra', 3, 20, 60, 12);

-- --------------------------------------------------------

--
-- Table structure for table `ru_plans`
--

CREATE TABLE IF NOT EXISTS `ru_plans` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ru_plans`
--

INSERT INTO `ru_plans` (`id`, `title`, `description`, `added_date`) VALUES
(8, 'masters in engineering', '<p>where to read how to read when to read and what subject to read i m confused i dont have any idea what to dowhat not to do .</p><p><br><p>Confused ......<br></p></p>', '2015-12-17 10:58:00'),
(9, 'Freelancer', 'i want to earn money.doing freelancing.but it gets stucked in starting it.i want it but smthing that change and diverts me in doing this.<br><p><br></p>', '2015-12-19 14:05:43'),
(10, 'Going aboard  study and earn money', '<p>we need to rise over our beliefs and culture.so we need to get over our troubles of old system.i need to smthng for family society and other.its not like i want to far away from them.i need to change smthing do smthing beyond everoe else capacity</p><p><br><p><br></p></p>', '2015-12-19 14:11:32'),
(11, 'we are liers nobel', 'today i addedd nobel in my mobile thinking i will study it and complete<br><p><br></p>', '2015-12-21 23:01:57'),
(12, 'Gorkys mother', 'its the nobel i had been studying since last week hope i will complete it soon<br><p><br></p>', '2015-12-21 23:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `ru_user`
--

CREATE TABLE IF NOT EXISTS `ru_user` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ru_user`
--

INSERT INTO `ru_user` (`id`, `name`, `username`, `password`, `status`) VALUES
(1, 'Rupesh Manandhar', 'rupesh', '6dc51c0db6d309303c48eb429b8efbb3b3c87c64f1ea2f2a8e01f1d8932aaccabcdedf623925e5259a84959c134b4cbf018f06a03e3a42b3327e67f780d40366', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ru_daily_routine`
--
ALTER TABLE `ru_daily_routine`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ru_friends`
--
ALTER TABLE `ru_friends`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ru_income`
--
ALTER TABLE `ru_income`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ru_invoice`
--
ALTER TABLE `ru_invoice`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ru_invoice_item`
--
ALTER TABLE `ru_invoice_item`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ru_plans`
--
ALTER TABLE `ru_plans`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ru_user`
--
ALTER TABLE `ru_user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ru_daily_routine`
--
ALTER TABLE `ru_daily_routine`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ru_friends`
--
ALTER TABLE `ru_friends`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ru_income`
--
ALTER TABLE `ru_income`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ru_invoice`
--
ALTER TABLE `ru_invoice`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ru_invoice_item`
--
ALTER TABLE `ru_invoice_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `ru_plans`
--
ALTER TABLE `ru_plans`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ru_user`
--
ALTER TABLE `ru_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
