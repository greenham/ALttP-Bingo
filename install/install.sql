-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2016 at 06:49 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alttp_bingo`
--

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL,
  `nearest_flute_location` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `name`, `difficulty`, `nearest_flute_location`) VALUES
(1, 'Complete Ganon''s Tower', 25, 1),
(2, '7th Crystal', 25, 1),
(3, 'Big Blue Pig', 25, 4),
(4, 'Open Pyramid Cracked Wall', 24, 4),
(5, '6th Crystal', 23, 6),
(6, '5th Crystal', 23, 8),
(7, 'Darkness or Skull, No Statues', 22, 7),
(8, 'Mire Map + Compass', 22, 6),
(9, 'Blue Mail', 22, 8),
(10, 'Ganon''s Tower Map + Compass', 21, 1),
(11, '2nd Crystal', 21, 7),
(12, 'Ice Map + Compass', 21, 8),
(13, 'Turtle Rock Map + Compass', 20, 1),
(14, '3rd Crystal', 20, 3),
(15, 'Cane of Somaria', 20, 6),
(16, 'Red Mail', 19, 1),
(17, 'Hookshot', 19, 7),
(18, 'Mirror Shield', 18, 1),
(19, 'Gold Sword + Silver Arrows', 18, 4),
(20, '1st Crystal', 18, 5),
(21, 'Flippers', 17, 2),
(22, '4th Crystal', 17, 3),
(23, 'Darkness Map + Compass', 17, 5),
(24, 'Zora''s HP', 16, 2),
(25, 'Skull Map + Compass', 16, 3),
(26, 'Thieves'' Map + Compass', 16, 3),
(27, 'Close the Castle', 16, 4),
(28, 'Open Darkness', 16, 5),
(29, 'Use Silver Bee in a Boss Battle', 16, 8),
(30, 'Swamp Map + Compass', 15, 7),
(31, 'Blue Rupee Room in DW Dungeon', 15, 0),
(32, 'Cane of Byrna', 14, 1),
(33, 'Fire Rod', 14, 3),
(34, 'Hammer', 14, 5),
(35, 'Dark DM Island HP', 13, 1),
(36, 'Quake', 13, 2),
(37, 'Lumberjack''s HP', 13, 3),
(38, 'Master Sword', 13, 3),
(39, 'Mid TRock HP', 12, 1),
(40, 'Titan''s Mitts', 12, 3),
(41, 'Bombos', 12, 6),
(42, 'Lake Hylia HP', 12, 8),
(43, 'Fire Shield', 11, 2),
(44, 'Digging Game HP', 11, 3),
(45, 'Chest Game HP', 11, 3),
(46, 'Flute', 11, 4),
(47, 'Ice Rod', 11, 8),
(48, 'Tempered Sword', 10, 3),
(49, 'Purple Chest Bottle', 10, 7),
(50, 'Blue Shield', 9, 3),
(51, '1/2 Magic', 9, 3),
(52, '$ Pulled From 4 Different Objects', 9, 7),
(53, 'Pendant of Wisdom', 8, 1),
(54, 'Cape', 8, 3),
(55, 'Houlihan Room', 8, 4),
(56, 'Pendant of Power', 8, 6),
(57, 'Powder', 7, 2),
(58, 'Bridge Bottle', 7, 5),
(59, 'Pendant of Courage', 7, 5),
(60, 'Power Gloves', 7, 6),
(61, 'Ether', 6, 1),
(62, 'Eastern Map + Compass', 6, 5),
(63, 'Desert Map + Compass', 6, 6),
(64, 'Magic Boomerang', 6, 2),
(65, 'Cape HP', 5, 3),
(66, 'Peg HP', 5, 3),
(67, 'Buy Shield', 5, 4),
(68, 'Talk to the Hand', 5, 8),
(69, 'Moon Pearl', 4, 1),
(70, 'Perfect Arrow Mini-Game', 4, 3),
(71, 'Hera Map + Compass', 3, 1),
(72, 'Blue Potion', 3, 2),
(73, '300 Rupees from Chest Game', 3, 3),
(74, 'Bow', 3, 5),
(75, 'Red Potion', 2, 2),
(76, 'Net', 2, 3),
(77, 'Sell Fish to Merchant', 2, 7),
(78, 'Green Potion', 1, 2),
(79, 'Race HP', 1, 3),
(80, 'Hyrule Castle Map', 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
