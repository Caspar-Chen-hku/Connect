-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: sophia
-- Generation Time: Feb 28, 2018 at 01:42 PM
-- Server version: 5.1.35
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cchen`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE IF NOT EXISTS `Account` (
  `account_id` varchar(15) NOT NULL,
  `branch_id` varchar(15) NOT NULL,
  `balance` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`account_id`, `branch_id`, `balance`) VALUES
('A1', 'B1', 500),
('A2', 'B2', 400),
('A3', 'B2', 900),
('A4', 'B1', 700);

-- --------------------------------------------------------

--
-- Table structure for table `attendanceList`
--

CREATE TABLE IF NOT EXISTS `attendanceList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentname` varchar(256) DEFAULT NULL,
  `major` varchar(256) DEFAULT NULL,
  `course` varchar(256) DEFAULT NULL,
  `coursedate` date DEFAULT NULL,
  `attendOrNot` varchar(7) NOT NULL DEFAULT 'PRESENT',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `attendanceList`
--

INSERT INTO `attendanceList` (`id`, `studentname`, `major`, `course`, `coursedate`, `attendOrNot`) VALUES
(1, 'Alice', 'BEng', 'COMP3322', '2017-10-05', 'PRESENT'),
(2, 'Bob', 'BEcon', 'COMP3327', '2017-10-06', 'PRESENT'),
(3, 'Charlie', 'BBA', 'COMP3329', '2017-10-11', 'PRESENT'),
(4, 'Dave', 'BBA', 'COMP3322', '2017-10-01', 'ABSENT'),
(5, 'Eve', 'BJ', 'COMP3403', '2017-10-05', 'PRESENT'),
(6, 'Isaac', 'BEng', 'COMP3403', '2017-10-06', 'PRESENT');

-- --------------------------------------------------------

--
-- Table structure for table `Author`
--

CREATE TABLE IF NOT EXISTS `Author` (
  `author_id` int(12) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Author`
--

INSERT INTO `Author` (`author_id`, `author_name`) VALUES
(1, 'Walter Savitch'),
(2, 'Dennis M');

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE IF NOT EXISTS `Book` (
  `book_id` int(12) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`book_id`, `book_name`) VALUES
(1, 'Introduction to programming'),
(2, 'Introduction to database management system');

-- --------------------------------------------------------

--
-- Table structure for table `Borrower`
--

CREATE TABLE IF NOT EXISTS `Borrower` (
  `loan_id` varchar(15) NOT NULL DEFAULT '',
  `customer_id` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`loan_id`,`customer_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Borrower`
--

INSERT INTO `Borrower` (`loan_id`, `customer_id`) VALUES
('L3', 'C1'),
('L1', 'C2'),
('L2', 'C4');

-- --------------------------------------------------------

--
-- Table structure for table `Branch`
--

CREATE TABLE IF NOT EXISTS `Branch` (
  `branch_id` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `asset` int(10) unsigned NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Branch`
--

INSERT INTO `Branch` (`branch_id`, `name`, `asset`) VALUES
('B1', 'Central', 7100000),
('B2', 'Causeway Bay', 9000000),
('B3', 'Aberdeen', 400000),
('B4', 'North Point', 3700000);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `commentID` int(11) NOT NULL,
  `postID` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `commContent` longtext NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `postID` (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `postID`, `time`, `commContent`) VALUES
(1, 1, 'February 26 2018', 'that''s so cool!'),
(2, 1, 'February 26 2018', 'www'),
(3, 2, 'February 26 2018', 'I also love quirrels!'),
(4, 3, 'February 26 2018', 'Well, I think dogs are better~'),
(5, 4, 'February 26 2018', 'You are just hurting single dog like me!'),
(6, 7, 'February 26 2018', 'itsumo sugusokoni aru'),
(7, 5, 'February 27 2018', 'amazing!'),
(8, 3, 'February 27 2018', 'Cats change their mood in a sudden'),
(9, 8, 'February 27 2018', 'I also wanna travel there qaq'),
(10, 2, 'February 27 2018', 'I thought they are rabbits hhh'),
(11, 6, 'February 27 2018', 'Well, kind of...'),
(12, 9, 'February 27 2018', 'how''s your life though'),
(13, 7, 'February 27 2018', 'how''s my Japanese hhh'),
(14, 4, 'February 27 2018', 'We are never friends!'),
(15, 1, 'February 28 2018', 'You are so brave'),
(16, 6, 'February 28 2018', 'But it''s also cute');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `customer_id` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL,
  `address` text,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customer_id`, `name`, `address`) VALUES
('C1', 'Kit', 'CB320'),
('C2', 'Ben', 'CB326'),
('C3', 'Jolly', 'CB311'),
('C4', 'Ernest', 'CB415');

-- --------------------------------------------------------

--
-- Table structure for table `Departments`
--

CREATE TABLE IF NOT EXISTS `Departments` (
  `department_id` int(12) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `budget` int(10) unsigned NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`department_id`, `name`, `budget`) VALUES
(1, 'Toys', 122000),
(2, 'Tools', 239000),
(3, 'Food', 100000),
(4, 'Dummy', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `Driver`
--

CREATE TABLE IF NOT EXISTS `Driver` (
  `memberID` int(11) NOT NULL,
  `accountNO` varchar(30) NOT NULL,
  `licence` int(11) NOT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Driver`
--

INSERT INTO `Driver` (`memberID`, `accountNO`, `licence`) VALUES
(2, '004019856320202', 200),
(3, '0155926750303', 300),
(5, '0046485220505', 500),
(6, '02498854210606', 600),
(9, '0685447895420909', 900);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(12) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `name`, `address`) VALUES
(1, 'Kit', 'HKU'),
(2, 'Ben', 'HKUST');

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE IF NOT EXISTS `Employees` (
  `employee_id` int(12) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  `salary` int(10) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`employee_id`, `name`, `salary`) VALUES
(1, 'Jones', 26000),
(2, 'Smith', 28000),
(3, 'Parker', 35000),
(4, 'Smith', 24000);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `friendID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `starred` varchar(1) NOT NULL,
  PRIMARY KEY (`friendID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`friendID`, `name`, `starred`) VALUES
(1, 'Caspar Chen', 'Y'),
(2, 'Cara Superior', 'Y'),
(3, 'Amanda Wang', 'Y'),
(4, 'Sakurai Sho', 'N'),
(5, 'Aragaki Yui', 'Y'),
(6, 'Nettie Shen', 'N'),
(7, 'Taylor Swift', 'N'),
(8, 'Ishihara Satomi', 'Y'),
(9, 'Tsuchiya Tao', 'N'),
(10, 'Murasaki Shikibu', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `Loan`
--

CREATE TABLE IF NOT EXISTS `Loan` (
  `loan_id` varchar(15) NOT NULL DEFAULT '',
  `branch_id` varchar(15) DEFAULT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Loan`
--

INSERT INTO `Loan` (`loan_id`, `branch_id`, `amount`) VALUES
('L1', 'B3', 900),
('L2', 'B1', 1500),
('L3', 'B1', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE IF NOT EXISTS `Location` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`id`, `name`, `address`, `lat`, `lng`) VALUES
(3, 'Sha Tin', 'City Link Plaza\r\n22.382571, 114.187431', 22.382570, 114.187431),
(2, 'Central', 'World-Wide House\r\n22.282476, 114.157497', 22.282476, 114.157494),
(1, 'HKU', 'Chow Yei Ching Bldg, Pokfulam, HK\r\n22.283142, 114.135472', 22.283142, 114.135475);

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE IF NOT EXISTS `Member` (
  `memberID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `referrer` int(11) DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `referrer` (`referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`memberID`, `name`, `referrer`) VALUES
(1, 'Annie', NULL),
(2, 'Brian', 1),
(3, 'Cecilia', 1),
(4, 'David', 1),
(5, 'Emily', NULL),
(6, 'Francis', NULL),
(7, 'Gillian', 4),
(8, 'Henry', 7),
(9, 'Irene', NULL),
(10, 'Jacob', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Owner`
--

CREATE TABLE IF NOT EXISTS `Owner` (
  `customer_id` varchar(15) NOT NULL DEFAULT '',
  `account_id` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`,`account_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Owner`
--

INSERT INTO `Owner` (`customer_id`, `account_id`) VALUES
('C1', 'A1'),
('C2', 'A1'),
('C1', 'A2'),
('C4', 'A3'),
('C4', 'A4');

-- --------------------------------------------------------

--
-- Table structure for table `Passenger`
--

CREATE TABLE IF NOT EXISTS `Passenger` (
  `memberID` int(11) NOT NULL,
  `creditCardNO` varchar(16) NOT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Passenger`
--

INSERT INTO `Passenger` (`memberID`, `creditCardNO`) VALUES
(1, '4552859663320101'),
(3, '4384521696350303'),
(4, '4791552205960404'),
(7, '4557896631850707'),
(8, '4384895521280808'),
(10, '375948632181010');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `postID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  `time` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `friendID`, `time`, `location`, `content`, `image`) VALUES
(1, 1, 'February 12 2018', 'Calgary, Alberta, Ca', 'I am currently traveling in Calgary.', 'images/profiles/1.jpg'),
(2, 2, 'February 13 2018', 'Hong Kong', 'cute animals! Quirrels are very rare animals in my country, I am so excited now!', 'images/profiles/2.jpg'),
(3, 3, 'February 11 2018', 'Hong Kong', 'If you ask me whether I love cats better or dogs better, definitely my answer is cats!', 'images/profiles/3.jpg'),
(4, 4, 'February 14 2018', 'Sydney, Australia', 'What a nice gift! I will love my boyfriend forever', 'images/profiles/4.jpg'),
(5, 5, 'February 10 2018', 'Northpole', 'I will never forget this magnificent aurora!', 'images/profiles/5.jpg'),
(6, 6, 'February 9 2018', 'New York, US', 'Dont you think this statue is kind of scary?', 'images/profiles/6.jpg'),
(7, 7, 'February 8 2018', 'Guangzhou, China', 'Glad to be here!', 'images/profiles/7.jpg'),
(8, 8, 'February 7 2018', 'Okinawa, Japan', 'It is even better than Hawaii!', 'images/profiles/8.jpg'),
(9, 9, 'February 6 2018', 'New Delhi, India', 'This horse reminds me of my life...', 'images/profiles/9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Route`
--

CREATE TABLE IF NOT EXISTS `Route` (
  `tripID` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`tripID`,`seq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Route`
--

INSERT INTO `Route` (`tripID`, `seq`, `lat`, `lng`) VALUES
(2, 1, 22.282476, 114.157494),
(2, 2, 22.283142, 114.135475),
(1, 1, 22.382570, 114.187431),
(1, 2, 22.359278, 114.162384),
(1, 3, 22.330732, 114.145409),
(1, 4, 22.316420, 114.160507),
(1, 5, 22.309013, 114.161179),
(1, 6, 22.300076, 114.155548),
(1, 7, 22.289532, 114.145821),
(1, 8, 22.288771, 114.140884),
(1, 9, 22.284176, 114.140564),
(1, 10, 22.283142, 114.135475);

-- --------------------------------------------------------

--
-- Table structure for table `t3_authors`
--

CREATE TABLE IF NOT EXISTS `t3_authors` (
  `authorID` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `t3_authors`
--

INSERT INTO `t3_authors` (`authorID`, `name`) VALUES
(1, 'Abraham Silberschatz'),
(2, 'Henry Korth'),
(3, 'S. Sudarshan'),
(4, 'Peter B. Galvin'),
(5, 'Greg Gagne'),
(6, 'Thomas H. Cormen'),
(7, 'Charles E. Leiserson'),
(8, 'Ronald L. Rivest'),
(9, 'Clifford Stein'),
(10, 'Jeffrey B. Fuerst');

-- --------------------------------------------------------

--
-- Table structure for table `t3_belongs`
--

CREATE TABLE IF NOT EXISTS `t3_belongs` (
  `bookID` int(12) NOT NULL,
  `categoryID` int(12) NOT NULL,
  PRIMARY KEY (`bookID`,`categoryID`),
  KEY `categoryID` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t3_belongs`
--

INSERT INTO `t3_belongs` (`bookID`, `categoryID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(4, 3),
(2, 4),
(3, 4),
(5, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `t3_books`
--

CREATE TABLE IF NOT EXISTS `t3_books` (
  `bookID` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `picture` text NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `t3_books`
--

INSERT INTO `t3_books` (`bookID`, `name`, `description`, `price`, `picture`) VALUES
(1, 'Database System Concepts', 'Database System Concepts by Silberschatz, Korth and Sudarshan is now in its 6th edition and is one of the cornerstone texts of database education. It presents the fundamental concepts of database management in an intuitive manner geared toward allowing students to begin working with databases as quickly as possible.\r\nThe text is designed for a first course in databases at the junior/senior undergraduate level or the first year graduate level. It also contains additional material that can be used as supplements or as introductory material for an advanced course. Because the authors present concepts as intuitive descriptions, a familiarity with basic data structures, computer organization, and a high-level programming language are the only prerequisites. Important theoretical results are covered, but formal proofs are omitted. In place of proofs, figures and examples are used to suggest why a result is true.', 680, 'photos/1.jpg'),
(2, 'Operating System Concepts', 'Operating System Concepts, now in its ninth edition, continues to provide a solid theoretical foundation for understanding operating systems. The ninth edition has been thoroughly updated to include contemporary examples of how operating systems function. The text includes content to bridge the gap between concepts and actual implementations. End-of-chapter problems, exercises, review questions, and programming exercises help to further reinforce important concepts.  A new Virtual Machine provides interactive exercises to help engage students with the material.', 655, 'photos/2.jpg'),
(3, 'Operating Systems Concepts with Java', '* New edition of the bestseller provides readers with a clear description of the concepts that underlie operating systems\r\n* Uses Java to illustrate many ideas and includes numerous examples that pertain specifically to popular operating systems such as UNIX, Solaris 2, Windows NT and XP, Mach, the Apple Macintosh OS, IBM''s OS/2 and Linux\r\n* Style is even more hands-on than the previous edition, with extensive programming examples written in Java and C\r\n* New coverage includes recent advances in Windows 2000/XP, Linux, Solaris 9, and Mac OS X\r\n* Detailed case studies of Windows XP and Linux give readers full coverage of two very popular operating systems', 480, 'photos/3.jpg'),
(4, 'Introduction to Algorithms, 3rd Edition', 'Some books on algorithms are rigorous but incomplete; others cover masses of material but lack rigor. Introduction to Algorithms uniquely combines rigor and comprehensiveness. The book covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers. Each chapter is relatively self-contained and can be used as a unit of study. The algorithms are described in English and in a pseudocode designed to be readable by anyone who has done a little programming. The explanations have been kept elementary without sacrificing depth of coverage or mathematical rigor.The first edition became a widely used text in universities worldwide as well as the standard reference for professionals. The second edition featured new chapters on the role of algorithms, probabilistic analysis and randomized algorithms, and linear programming. The third edition has been revised and updated throughout. It includes two completely new chapters, on van Emde Boas trees and multithreaded algorithms, substantial additions to the chapter on recurrence (now called "Divide-and-Conquer"), and an appendix on matrices. It features improved treatment of dynamic programming and greedy algorithms and a new notion of edge-based flow in the material on flow networks. Many new exercises and problems have been added for this edition. As of the third edition, this textbook is published exclusively by the MIT Press.', 850, 'photos/4.jpg'),
(5, 'Three Blind Mice', 'Three blind mice. Three blind mice.<br>\r\nSee how they run. See how they run.<br>\r\nThey all ran after the farmer''s wife,<br>\r\nWho cut off their tails with a carving knife,<br>\r\nDid you ever see such a sight in your life,<br>\r\nAs three blind mice?', 99.9, 'photos/5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `t3_categories`
--

CREATE TABLE IF NOT EXISTS `t3_categories` (
  `categoryID` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `t3_categories`
--

INSERT INTO `t3_categories` (`categoryID`, `name`) VALUES
(1, 'Computer Science'),
(2, 'Database'),
(3, 'Algorithms'),
(4, 'Operating systems'),
(5, 'Children'),
(6, 'Story');

-- --------------------------------------------------------

--
-- Table structure for table `t3_writes`
--

CREATE TABLE IF NOT EXISTS `t3_writes` (
  `bookID` int(12) NOT NULL,
  `authorID` int(12) NOT NULL,
  PRIMARY KEY (`bookID`,`authorID`),
  KEY `authorID` (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t3_writes`
--

INSERT INTO `t3_writes` (`bookID`, `authorID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 4),
(2, 5),
(3, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Trip`
--

CREATE TABLE IF NOT EXISTS `Trip` (
  `tripID` int(11) NOT NULL,
  `passengerID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `startTime` time NOT NULL,
  `source` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `carPlate` varchar(8) NOT NULL,
  `fare` decimal(6,1) NOT NULL,
  PRIMARY KEY (`tripID`),
  KEY `carPlate` (`carPlate`),
  KEY `passengerID` (`passengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Trip`
--

INSERT INTO `Trip` (`tripID`, `passengerID`, `startDate`, `startTime`, `source`, `destination`, `carPlate`, `fare`) VALUES
(1, 1, '2018-02-01', '08:01:22', 'Sha Tin', 'HKU', 'CD0303', 160.0),
(2, 1, '2018-02-01', '09:51:19', 'HKU', 'Central', 'GH0505', 55.0),
(3, 7, '2018-02-01', '09:48:50', 'Tai Koo', 'Airport', 'EF0303', 455.8),
(4, 1, '2018-02-01', '18:33:05', 'Admiralty', 'Sha Tin', 'JK0606', 120.0),
(5, 3, '2018-02-01', '23:54:56', 'Tsing Yi', 'Kwai Fong', 'AB0202', 62.5),
(6, 3, '2018-02-02', '09:11:50', 'Tsuen Wan', 'Central', 'JK0606', 305.0),
(7, 4, '2018-02-02', '11:24:25', 'HKU', 'Causeway Bay', 'AB0202', 75.0),
(8, 8, '2018-02-02', '11:50:12', 'Causeway Bay', 'Kennedy Town', 'AB0202', 85.6),
(9, 8, '2018-02-02', '16:04:09', 'Wong Tai Sin', 'Lam Tin', 'AB0202', 115.5),
(10, 7, '2018-02-02', '23:48:01', 'Airport', 'Sai Wan Ho', 'CD0303', 455.0),
(11, 1, '2018-02-03', '10:04:30', 'HKU', 'Central', 'JK0606', 60.5),
(12, 4, '2018-02-02', '12:05:21', 'Lo Wu', 'HKU', 'AB0202', 303.0);

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE IF NOT EXISTS `Vehicle` (
  `carPlate` varchar(8) NOT NULL,
  `carType` enum('normal','commercial','7-seaters') NOT NULL,
  `brand` varchar(30) NOT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`carPlate`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Vehicle`
--

INSERT INTO `Vehicle` (`carPlate`, `carType`, `brand`, `owner`) VALUES
('AB0202', 'normal', 'Audi', 2),
('CD0303', 'commercial', 'Benz', 3),
('EF0303', 'normal', 'Ford', 3),
('GH0505', '7-seaters', 'Volkswagen', 5),
('JK0606', 'commercial', 'Tesla', 6);

-- --------------------------------------------------------

--
-- Table structure for table `webtech_workshop_items`
--

CREATE TABLE IF NOT EXISTS `webtech_workshop_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `cover_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `recommendedWeather` varchar(300) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Thunderstorms',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

--
-- Dumping data for table `webtech_workshop_items`
--

INSERT INTO `webtech_workshop_items` (`id`, `name`, `description`, `cover_image`, `recommendedWeather`) VALUES
(1, 'The cat who talked to ghosts', 'When Mrs. Cobb heard unearthly noises in the antique-filled farmhouse, she called Jim Qwilleran for help. But he was too late. It looked as if his kindly ex-housekeeper had been frightened to death--but by whom? Or what? Now Qwilleran''s moved into the historic farmhouse with his two cat companions--and Koko the Siamese is spooked. Is it a figment of feline imagination--or the clue to a murder in Moose County? And does Qwilleran have a ghost of a chance of solving this haunting mystery?', 'pic/45.5395b9a4d64c6.jpg', 'thunderstorms'),
(2, 'An unsuitable job for a woman', 'An Unsuitable Job for a Woman is the title of a 1972 detective novel by P. D. James  and also the title of a TV series of four dramas developed from that novel.\r\n\r\nIt features Detective Cordelia Gray, the protagonist of both this title and The Skull Beneath the Skin. Cordelia inherited a detective agency and from there took on her first case.', 'pic/89.5395b9d0106a4.jpg', 'cloudy'),
(3, 'The Climb', 'The Climb, republished as The Climb: Tragic Ambitions on Everest, is an account by Russian mountaineer Anatoli Boukreev of the 1996 Everest Disaster, during which eight climbers lost their lives on Mount Everest. The co-author, G. Weston DeWalt  who was not part of the expedition  provides accounts from other climbers and ties together the narrative of Boukreev''s logbook.', 'pic/132.5395bca929002.jpg', 'sunny'),
(4, 'Genuine lies', 'A book to die for...\r\n\r\nEve Benedict is the last of the movie goddesses, a smoky-voiced sex symbol with two Oscars, four ex-husbands, and a legion of lovers to her name. There is no secret, no scandal she doesn''t know. Now Eve has decided to write her memoirs--no holds barred. All Hollywood begs her not to. But Eve has her reasons....', 'pic/176.5395bd4ac3d87.jpg', 'hot'),
(5, 'Sanctuary', 'Photographer Jo Ellen Hathaway thought she''d escaped the house called Sanctuary long ago. She''d spent her lonliest years there, after the sudden, unexplained disappearance of her mother. Yet the sprawling resort off the Georgia coast continues to haunt her dreams. And now, even more haunting are the pictures someone is sending to her: strange close-ups and candids, culminating in the most shocking portrait of all--a photo of her mother...naked, beautiful, and dead. Now Jo must return to the island, and to her bitterly estranged family--and, with the help of one man, learn the truth about her tragic past. But Sanctuary may also be the most dangerous place of all...', 'pic/220.5395bdfc5f4c5.jpg', 'showers'),
(6, 'Code to zero', 'In America, 1958 a man wakes up in a men''s room with no recollection of his past. His clothing, associates and surroundings suggest to him that he is an alcoholic derelict, however his behaviour, morals and instinct lead him to investigate and research his past. He establishes (by the simple method of going into a library and pulling books off shelves until he finds one that he understands,) that he is in fact Dr Lucas - a rocket scientist, and well known in his field. He further establishes that he is directly responsible for the design of a rocket due to be launched by America in an attempt to match the Soviet Sputnik, and bolster America''s entry into what would become the Space Race.', 'pic/264.5395beafc00aa.jpg', 'foggy'),
(7, 'Will Rogers', 'Will Rogers was a true American icon. His newspaper column was read daily by 40 million people, and as radio entertainer, lecturer, movies star, and homespun sage, he was one of our most popular entertainers.', 'pic/308.5395bf4e434d3.jpg', 'haze'),
(8, 'Edge of danger', 'Even the deepest peril couldn''t keep him away from her.\r\n\r\nAs an anti-terrorism operative in T-FLAC''s classified paranormal unit, the intrepid, ruggedly handsome Gabriel Edge protects the world from the forces of evil. So when an ingenious and extremely volatile invention is stolen from a covert lab in Arizona, Gabriel zeroes in on the brilliant young scientist who helped to create the device. From Gabriel''s first contact, Eden Cahill leaves an indelible impression.\r\n\r\nUsing a mysterious telepathic power as ancient as his Scottish heritage, as well as his seductive physical charms, Gabriel must infiltrate Eden''s mind to uncover the secrets she so desperately protects. But Gabriel is in a bind-for the only way to penetrate Eden''s memories is through one shared intimate encounter that will trigger revelations, shatter lives, and just might save humanity all at a terribly steep price.', 'pic/352.5395c0117e6ca.jpg', 'smoky'),
(9, 'The falcon at the portal', 'Amelia and family have arrived in Egypt for the 1911 archeological season -- after the marriage of young Ramses'' best friend David to Amelia''s niece Lia. But trouble finds them immediately when David is accused of selling ancient artifacts. \r\n\r\nWhile Amelia and company try to clear his name and expose the real culprit, the body of an American is found at the bottom of their excavation shaft. As accusations of drug dealing and moral misconduct fly, a child of mysterious antecedents sparks a crisis that threatens to tear the family apart. Amelia brings her brilliant powers of deduction to bear, but someone is shooting bullets at her -- and coming awfully close!', 'pic/396.5395c0afa1d5f.jpg', 'clear sky'),
(10, 'Seeing a large cat', 'No villain is safe in 1903 Egypt as feisty archaeologist Amelia Peabody embarks on her ninth adventure.\r\n\r\nAccording to an ancient Egyptian papyrus, dreaming of a large cat means good luck. And that''s just what Amelia Peabody could use, as her growing family matures in the new century. What''s more, Amelia''s dashing husband Emerson has received a mysterious warning not to enter the Valley of the Kings. To Emerson''s annoyance, Amelia''s meddling distracts her attention as she exposes a fraudulent spiritualist, saves a marriage, and plays matchmaker. But diabolical forces are at work when an unknown tomb reveals a shocking murder -- and the Peabody family dodges bullets from an assassin determined to put an end to their discoveries.', 'pic/440.5395c161caa76.jpg', 'hot'),
(11, 'Whispers', 'Teri meets three incredible men in Maui...but which one is the man of her dreams? \r\n\r\nTeri Moreno went to Maui hoping to start one special relationship. But romance takes a complicated twist when the Spanish teacher from Glenbrooke, Oregon, finds herself enjoying the attentions of three men: the handsome marine biologist who called her back to the islands; a charming old crush from high school; and a clumsy, endearing Australian with a wild past. \r\n\r\nSwept up by her feelings, yet determined to make the right choice, Teri makes powerful discoveries about God''s law and His grace in this new release of Whipsers, now book two in the heartwarming Glenbrooke series from Robin Jones Gunn.', 'pic/484.5395c2106d639.jpg', 'hot'),
(12, 'Playing for pizza', 'Rick Dockery was the third-string quarterback for the Cleveland Browns. In the AFC Championship game, to the surprise and dismay of virtually everyone, Rick actually got into the game. With a 17-point lead and just minutes to go, Rick provided what was arguably the worst single performance in the history of the NFL. Overnight, he became a national laughingstock-and was immediately cut by the Browns and shunned by all other teams. But all Rick knows is football, and he insists that his agent find a team that needs him. Against enormous odds, Rick finally gets a job-as the starting quarterback for the Mighty Panthers . . . of Parma, Italy. The Parma Panthers desperately want a former NFL player-any former NFL player-at their helm. And now they''ve got Rick, who knows nothing about Parma (not even where it is) and doesn''t speak a word of Italian. To say that Italy-the land of fine wines, extremely small cars, and football americano-holds a few surprises for Rick Dockery would be something of an understatement.', 'pic/528.5395c2cae201b.jpg', 'clear sky'),
(13, 'High profile', 'When the body of controversial talk-show host Walton Weeks is discovered hanging from a tree on the outskirts of Paradise, police chief Jesse Stone finds himself at the center of a highly public case. When another dead body, that of a young woman, is discovered just a few days later, the pressure to solve the crimes becomes almost unbearable.\r\nTwo victims in less than a week should provide a host of clues, but all Jesse runs into are dead ends. Yet what may be the most disturbing aspect of these murders is the fact that no one seems to care, not a single one of Weeks, ex-wives, not the family of the girl. And when the medical examiner reveals a heartbreaking link between the two departed souls, the mystery only deepens. Forced to delve into a world of stormy relationships, Jesse soon comes to realize that knowing whom to trust is indeed a matter of life and death.', 'pic/572.5395c385e49e4.jpg', 'clear sky'),
(14, 'The Appeal', 'John Grisham is now an institution -- a writer whose bestselling status is assured, So assured, in fact, that expectations for each new book are as high as can be imagined. Does The Appeal make the grade? And will it appeal to Grisham admirers -- or disappoint them?\r\nThe stakes in the novel''s plot are high: corporate crime on the largest scale. The duo of lawyers at the centre of the narrative are Mary and Wes Grace, who succeed in a multimillion dollar case against a chemical company, who have polluted a town with dumped toxic waste. A slew of agonising deaths have followed this, but lawyers for the chemical company appeal, and a variety of legal shenanigans are employed -- and it is certainly not clear which way the scales of justice will be finally balanced.\r\n\r\nAs ever with Grisham, the mechanics of plotting are key, and the characterisation is functional rather than detailed. But it is (as always) more than capable of keeping the reader totally engaged. Given John Grisham''s much-publicised conversion to born-again Christianity, it''s intriguing to note here the implicit criticism of the moral majority''s religious values, but that is hardly central to the enterprise. What counts is the storytelling, and while the writing is as straightforward and uncomplicated as ever, few readers will put down The Appeal once they have allowed it to exert its grip on upon them. --Barry Forshaw', 'pic/616.5395c44239e86.jpg', 'clear sky'),
(15, 'A bride most begrudging', 'Any ship arriving from England means good news for Virginia colony farmers. The "tobacco brides" would be on board--eligible women seeking a better life in America, bartered for with barrels of tobacco from the fields.\n\nDrew O''Connor isn''t stirred by news of a ship full of brides. Still broken-hearted from the loss of his beloved, he only wants a maid to tend his house and care for his young sister.\n\nWhat he ends up with is a wife-a feisty redhead who claims she is Lady Constance Morrow, daughter of an Earl, brought to America against her will. And she wants to go straight back to England as soon as she can. She hasn''t the foggiest notion how to cook, dares to argue with her poor husband, and spends more time working on mathematical equations than housework. What kind of a wife is that? Drew''s Christian forbearance is in for some testing.\n\nHeadstrong and intelligent, deeply moral but incredibly enticing, Constance turns what was supposed to be a marriage of convenience into something most inconvenient, indeed.', 'pic/660.5395c4f658be5.jpg', 'haze'),
(16, 'The fourth bear', 'Five years ago, Viking introduced Jasper Fforde and his upsidedown, inside-out literary crime masterpieces. And as they move from Thursday Next to Jack Spratts Nursery Crimes, his audience is insatiable and growing. Now, with The Fourth Bear, Jack Spratt and Mary Mary take on their most dangerous case so far as a murderous cookie stalks the streets of Reading.', 'pic/704.5395c5bbbb727.jpg', 'sunny'),
(17, 'Founding brothers', 'In retrospect, it seems as if the American Revolution was inevitable. But was it? In Founding Brothers, Joseph J. Ellis reveals that many of those truths we hold to be self-evident were actually fiercely contested in the early days of the republic.\r\n\r\nEllis focuses on six crucial moments in the life of the new nation, including a secret dinner at which the seat of the nation''s capital was determined--in exchange for support of Hamilton''s financial plan; Washington''s precedent-setting Farewell Address; and the Hamilton and Burr duel. Most interesting, perhaps, is the debate (still dividing scholars today) over the meaning of the Revolution. In a fascinating chapter on the renewed friendship between John Adams and Thomas Jefferson at the end of their lives, Ellis points out the fundamental differences between the Republicans, who saw the Revolution as a liberating act and hold the Declaration of Independence most sacred, and the Federalists, who saw the revolution as a step in the building of American nationhood and hold the Constitution most dear. Throughout the text, Ellis explains the personal, face-to-face nature of early American politics--and notes that the members of the revolutionary generation were conscious of the fact that they were establishing precedents on which future generations would rely.', 'pic/748.5395c6658cfd8.jpg', 'hot'),
(18, 'Devil in the white city', 'Author Erik Larson imbues the incredible events surrounding the 1893 Chicago World''s Fair with such drama that readers may find themselves checking the book''s categorization to be sure that ''The Devil in the White City'' is not, in fact, a highly imaginative novel. Larson tells the stories of two men: Daniel H. Burnham, the architect responsible for the fair''s construction, and H.H. Holmes, a serial killer masquerading as a charming doctor. \r\n\r\nBurnham''s challenge was immense. In a short period of time, he was forced to overcome the death of his partner and numerous other obstacles to construct the famous "White City" around which the fair was built. His efforts to complete the project, and the fair''s incredible success, are skillfully related along with entertaining appearances by such notables as Buffalo Bill Cody, Susan B. Anthony, Nikola Tesla and Thomas Edison. \r\n\r\nThe activities of the sinister Dr. Holmes, who is believed to be responsible for scores of murders around the time of the fair, are equally remarkable. He devised and erected the World''s Fair Hotel, complete with crematorium and gas chamber, near the fairgrounds and used the event as well as his own charismatic personality to lure victims.', 'pic/792.5395c72604077.jpg', 'clear sky'),
(19, 'Actor', 'New York private eye Stanley Hastings can''t say no when he gets the chance to play the lead in a summer stock production. But when the stage manager is murdered, Stanley is the main suspect--and he must not only learn his part, but uncover the killer as well.', 'pic/836.5395c7d5107bb.jpg', 'thunderstorms'),
(20, 'Green darkness', 'This unforgettable story of undying love combines mysticism, suspense, mystery, and romance into a web of good and evil that stretches from 16th-century England to the present day. Richard Marsdon marries a young American woman named Celia, brings her to live at his English estate, and all seems to be going well. But now Richard has become withdrawn, and Celia is constantly haunted by a vague dread. When she suffers a breakdown and wavers between life and death, a wise doctor realizes that only by forcing Celia to relive her past can he enable her to escape her illness. Celia travels back 400 years in time to her past life as a beautiful but doomed servant. Through her eyes, we see the England of the Tudors, torn by religious strife, and experience all the pageantry, lustiness, and cruelty of the age. As in other historical romance titles by this author, the past comes alive in this flamboyant classic novel.', 'pic/880.5395c888edbed.jpg', 'thunderstorms'),
(21, '"A" is for alibi', 'PI Kinsey Milhone 32, in a pretty California town, gets her first case. Laurence Fife was a slick divorce lawyer and slippery ladies'' man until someone killed him. Released from jail after 8 years, his wife Nikki wants the truth. But the trail is cold, and at the end is a chilling twist - a second eight-year-old murder and a brand new corpse.', 'pic/924.5395c941ca3da.jpg', 'clear sky'),
(22, 'Hunting badger', 'Three men raid the gambling casino run by the Ute nation and then disappear into the maze of canyons on the Utah-Arizona border. When the FBI, with its helicopters and high-tech equipment, focuses on a wounded deputy sheriff as a possible suspect, Navajo Tribal Police Sergeant Jim Chee and his longtime colleague, retired Lieutenant Joe Leaphorn, launch an investigation of their own. Chee sees a dangerous flaw in the federal theory; Leaphorn sees intriguing connections to the exploits of a legendary Ute bandit-hero. And together, they find themselves caught up in the most perplexing -- and deadly -- criminal manhunt of their lives.', 'pic/968.5395c9f4e0846.jpg', 'thunderstorms'),
(23, 'The rocky road to romance', 'Her tall, dark, and deliciously dangerous boss . . .\r\n\r\nWhen the delightful, daffy Dog Lady of station WZZZ offered to take on the temporary job of traffic reporter, Steve Crow tried to think of reasons to turn Daisy Adams down. Perhaps he knew that sharing the close quarters of a car with her for hours would give the handsome program director no room to resist her quirky charms. He''d always favored low-slung sportscars and high-heeled women, but that was before he fell for a free spirit who caught crooks by accident, loved old people and pets, and had just too many jobs!\r\n\r\nLoving Daisy turned Steve''s life upside down, especially once he adopted Bob, a huge dog masquerading as a couch potato. But was Daisy finally ready to play for keeps?', 'pic/1012.5395cab32ec11.jpg', 'thunderstorms'),
(24, 'Harvest home.', 'It was almost as if time had not touched the village of Cornwall Coombe. The quiet, peaceful place was straight out of a bygone era, with well-cared-for Colonial houses, a white-steepled church fronting a broad Common. Ned and Beth Constantine chanced upon the hamlet and immediately fell in love with it. This was exactly the haven they dream of. Or so they thought.\r\n\r\nFor Ned and his family, Cornwall Coombe was to become a place of ultimate horror.', 'pic/1056.5395cb6392243.jpg', 'clear sky'),
(25, 'Harry Potter and the Chamber of Secrets', 'The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he''s packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike.\r\n\r\nAnd strike it does. For in Harry''s second year at Hogwarts, fresh torments and horrors arise, including an outrageously stuck-up new professor, Gilderoy Lockheart, a spirit named Moaning Myrtle who haunts the girl''s bathroom, and the unwanted attentions of Ron Weasley''s younger sister, Ginny.\r\n\r\nBut each of these seem minor annoyances when the real trouble beings, and someone--or something--starts turning Hogwarts students to stone. Could it be Draco Malfoy, a more poisonous rival than ever? Could it possibly be Hagrid, whose mysterious past is finally told? Or could it be the one everyone at Hogwarts most suspects...Harry Potter himself.', 'pic/1100.5395cc152aa9f.jpg', 'hot');

-- --------------------------------------------------------

--
-- Table structure for table `webtech_workshop_users`
--

CREATE TABLE IF NOT EXISTS `webtech_workshop_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `webtech_workshop_users`
--

INSERT INTO `webtech_workshop_users` (`id`, `login`, `password`) VALUES
(1, 'webtech', 'webtech');

-- --------------------------------------------------------

--
-- Table structure for table `Works_in`
--

CREATE TABLE IF NOT EXISTS `Works_in` (
  `employee_id` int(12) NOT NULL DEFAULT '0',
  `department_id` int(12) NOT NULL DEFAULT '0',
  `since` date NOT NULL,
  PRIMARY KEY (`employee_id`,`department_id`),
  KEY `department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Works_in`
--

INSERT INTO `Works_in` (`employee_id`, `department_id`, `since`) VALUES
(1, 1, '2001-01-01'),
(2, 1, '2002-04-01'),
(2, 2, '2005-02-02'),
(3, 3, '2003-01-01'),
(4, 3, '2005-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `Writes`
--

CREATE TABLE IF NOT EXISTS `Writes` (
  `book_id` int(12) NOT NULL,
  `author_id` int(12) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Writes`
--

INSERT INTO `Writes` (`book_id`, `author_id`) VALUES
(1, 1),
(1, 2),
(2, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `Account_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `Branch` (`branch_id`),
  ADD CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `Branch` (`branch_id`);

--
-- Constraints for table `Borrower`
--
ALTER TABLE `Borrower`
  ADD CONSTRAINT `Borrower_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  ADD CONSTRAINT `Borrower_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `Loan` (`loan_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`);

--
-- Constraints for table `Driver`
--
ALTER TABLE `Driver`
  ADD CONSTRAINT `Driver_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `Member` (`memberID`);

--
-- Constraints for table `Loan`
--
ALTER TABLE `Loan`
  ADD CONSTRAINT `Loan_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `Branch` (`branch_id`);

--
-- Constraints for table `Member`
--
ALTER TABLE `Member`
  ADD CONSTRAINT `Member_ibfk_1` FOREIGN KEY (`referrer`) REFERENCES `Member` (`memberID`);

--
-- Constraints for table `Owner`
--
ALTER TABLE `Owner`
  ADD CONSTRAINT `Owner_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  ADD CONSTRAINT `Owner_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`);

--
-- Constraints for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `Member` (`memberID`);

--
-- Constraints for table `t3_belongs`
--
ALTER TABLE `t3_belongs`
  ADD CONSTRAINT `t3_belongs_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `t3_categories` (`categoryID`),
  ADD CONSTRAINT `t3_belongs_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `t3_books` (`bookID`);

--
-- Constraints for table `t3_writes`
--
ALTER TABLE `t3_writes`
  ADD CONSTRAINT `t3_writes_ibfk_2` FOREIGN KEY (`authorID`) REFERENCES `t3_authors` (`authorID`),
  ADD CONSTRAINT `t3_writes_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `t3_books` (`bookID`);

--
-- Constraints for table `Trip`
--
ALTER TABLE `Trip`
  ADD CONSTRAINT `Trip_ibfk_1` FOREIGN KEY (`carPlate`) REFERENCES `Vehicle` (`carPlate`),
  ADD CONSTRAINT `Trip_ibfk_2` FOREIGN KEY (`passengerID`) REFERENCES `Passenger` (`memberID`);

--
-- Constraints for table `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD CONSTRAINT `Vehicle_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `Driver` (`memberID`);

--
-- Constraints for table `Works_in`
--
ALTER TABLE `Works_in`
  ADD CONSTRAINT `Works_in_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`),
  ADD CONSTRAINT `Works_in_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
