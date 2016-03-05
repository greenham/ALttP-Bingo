-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2016 at 11:21 PM
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
(1, 'Ganon''s Tower, No Hammer', 25, 1),
(2, '7th Crystal', 25, 1),
(3, 'Complete Ganon''s Tower', 24, 1),
(4, 'Big Blue Pig', 24, 4),
(5, 'Open Pyramid Cracked Wall', 24, 4),
(6, 'Mire Compass, no Switches', 23, 6),
(7, '6th Crystal', 23, 6),
(8, '5th Crystal', 23, 8),
(9, 'Darkness or Skull, No Statues', 22, 7),
(10, 'Blue Mail', 22, 8),
(11, 'Ganon''s Tower Map + Compass', 22, 1),
(12, 'Moldorm Re-Fight', 21, 1),
(13, 'Mire Map + Compass', 21, 6),
(14, '2nd Crystal', 21, 7),
(15, 'Ice Map + Compass', 21, 8),
(16, 'Lanmolas Re-Fight', 20, 1),
(17, 'Darkness BK, no Bombs', 20, 5),
(18, 'Turtle Rock Map + Compass', 20, 1),
(19, 'Cane of Somaria', 20, 6),
(20, 'Armos Re-Fight', 19, 1),
(21, '3rd Crystal, no Moon Pearl', 19, 3),
(22, 'Red Mail', 19, 1),
(23, 'Hookshot', 19, 7),
(24, 'Mirror Shield', 18, 1),
(25, '1st Crystal', 18, 5),
(26, 'Swamp Map + Compass', 18, 7),
(27, 'Boomerang after Agahnim', 17, 4),
(28, '3rd Crystal', 17, 3),
(29, 'Darkness Map + Compass', 17, 5),
(30, 'Lumberjack''s HP', 17, 3),
(31, 'Kill a Boss with Silver Arrows', 16, 8),
(32, 'Close the Castle', 16, 4),
(33, 'Skull Map + Compass', 16, 3),
(34, '4th Crystal', 16, 3),
(35, 'Red Rupee from a Dungeon Chest', 15, 7),
(36, 'Use Silver Bee in a Boss Battle', 15, 8),
(37, 'Blue Rupee Room in DW Dungeon', 15, 5),
(38, 'Fire Rod, no Bombs', 14, 3),
(39, 'Zora''s HP', 14, 2),
(40, 'Cane of Byrna', 14, 1),
(41, 'Fire Rod', 14, 3),
(42, 'Digging Game HP', 13, 3),
(43, 'Master Sword', 13, 3),
(44, 'Gold Sword + Silver Arrows', 13, 4),
(45, 'Chest Game HP', 12, 3),
(46, 'Bombos', 12, 6),
(47, 'Lake Hylia HP', 12, 8),
(48, 'Purple Chest Bottle', 12, 7),
(49, 'Dark DM Island HP', 11, 1),
(50, 'Quake', 11, 2),
(51, 'Flute', 11, 4),
(52, 'Defeat 3 Lynels', 11, 1),
(53, 'Open Darkness', 11, 5),
(54, 'Get two Zeldas inside Sanctuary', 10, 2),
(55, 'Flippers', 10, 2),
(56, '1/2 Magic', 10, 3),
(57, 'Tempered Sword', 10, 3),
(58, 'Blue Shield', 10, 3),
(59, 'Mid TRock HP', 9, 1),
(60, 'Cape HP', 9, 3),
(61, 'Fire Shield', 9, 2),
(62, '$ Pulled From 4 Different Objects', 9, 7),
(63, 'End Mire Rain', 9, 6),
(64, 'Peg HP', 8, 3),
(65, 'Pendant of Wisdom', 8, 1),
(66, 'Cape', 8, 3),
(67, 'Houlihan Room', 8, 4),
(68, 'Pendant of Power', 8, 6),
(69, 'Titan''s Mitts', 7, 3),
(70, 'Thieves'' Map + Compass', 7, 3),
(71, 'Powder', 7, 2),
(72, 'Bridge Bottle', 7, 5),
(73, 'Ether', 7, 1),
(74, 'Graveyard HP', 7, 3),
(75, 'Pyramid HP', 6, 4),
(76, 'Power Gloves', 6, 6),
(77, 'Hammer', 6, 5),
(78, 'Desert Map + Compass', 6, 6),
(79, 'Magic Boomerang', 6, 2),
(80, 'NE Desert HP', 6, 6),
(81, 'Mire HP', 6, 6),
(82, 'Mid-Desert HP', 5, 6),
(83, 'Eastern Map + Compass', 5, 5),
(84, 'Buy a Shield', 5, 4),
(85, 'Talk to the Hand', 5, 8),
(86, 'South of Flute Grotto HP', 5, 4),
(87, 'Moon Pearl', 4, 1),
(88, 'Perfect Arrow Mini-Game', 4, 3),
(89, 'Book of Mudora', 4, 3),
(90, 'Ice Rod', 4, 8),
(91, 'Sanctuary HP', 4, 3),
(92, 'Spectacle Rock HP', 4, 1),
(93, 'Death Mtn Cave HP', 4, 1),
(94, '5 Equips from NPCs', 4, 8),
(95, 'Hera Map + Compass', 3, 1),
(96, 'Blue Potion', 3, 2),
(97, '300 Rupees from Chest Game', 3, 3),
(98, 'Pendant of Courage', 3, 5),
(99, 'Aginah HP', 3, 6),
(100, 'Red Potion', 2, 2),
(101, 'Green Potion', 2, 2),
(102, 'Bow', 2, 5),
(103, 'Net', 2, 3),
(104, 'Sell Fish to Merchant', 2, 7),
(105, 'Lost Woods HP', 2, 3),
(106, 'Hideout HP', 2, 3),
(107, 'Buy a Bee', 2, 8),
(108, 'Well HP', 1, 3),
(109, 'Race HP', 1, 3),
(110, 'Hyrule Castle Map', 1, 4),
(111, 'The Single Arrow Chest', 1, 5),
(112, 'Swamp Floodgate HP', 1, 7),
(113, 'Have Fortune Told', 1, 8);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
