-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2016 at 12:28 AM
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
-- Table structure for table `bingo_goals`
--

CREATE TABLE `bingo_goals` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL,
  `nearest_flute_location` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bingo_goals`
--

INSERT INTO `bingo_goals` (`id`, `name`, `difficulty`, `nearest_flute_location`) VALUES
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
(12, 'Cane of Byrna, no Cape', 22, 1),
(13, 'Moldorm Re-Fight', 21, 1),
(14, 'Mire Map + Compass', 21, 6),
(15, '2nd Crystal', 21, 7),
(16, 'Ice Map + Compass', 21, 8),
(17, 'Light World Pendants in Reverse', 20, 5),
(18, 'Lanmolas Re-Fight', 20, 1),
(19, 'Darkness BK, no Bombs', 20, 5),
(20, 'Turtle Rock Map + Compass', 20, 1),
(21, 'Cane of Somaria', 20, 6),
(22, 'Armos Re-Fight', 19, 1),
(23, '3rd Crystal, no Moon Pearl', 19, 3),
(24, 'Red Mail', 19, 1),
(25, 'Hookshot', 19, 7),
(26, 'Mirror Shield', 18, 1),
(27, '1st Crystal', 18, 5),
(28, 'Swamp Map + Compass', 18, 7),
(29, 'Boomerang after Agahnim', 17, 4),
(30, '3rd Crystal', 17, 3),
(31, 'Darkness Map + Compass', 17, 5),
(32, 'Lumberjack''s HP', 17, 3),
(33, 'Kill a Boss with Silver Arrows', 16, 8),
(34, 'Close the Castle', 16, 4),
(35, 'Skull Map + Compass', 16, 3),
(36, '4th Crystal', 16, 3),
(37, 'Red Rupee from a Dungeon Chest', 15, 7),
(38, 'Use Silver Bee in a Boss Battle', 15, 8),
(39, 'Blue Rupee Room in DW Dungeon', 15, 5),
(40, 'Fire Rod, no Bombs', 14, 3),
(41, 'Zora''s HP', 14, 2),
(42, 'Cane of Byrna', 14, 1),
(43, 'Fire Rod', 14, 3),
(44, 'Digging Game HP', 13, 3),
(45, 'Master Sword', 13, 3),
(46, 'Gold Sword + Silver Arrows', 13, 4),
(47, 'Chest Game HP', 12, 3),
(48, 'Bombos', 12, 6),
(49, 'Lake Hylia HP', 12, 8),
(50, 'Purple Chest Bottle', 12, 7),
(51, 'Dark DM Island HP', 11, 1),
(52, 'Quake', 11, 2),
(53, 'Flute', 11, 4),
(54, 'Defeat 3 Lynels', 11, 1),
(55, 'Open Darkness', 11, 5),
(56, 'Get two Zeldas inside Sanctuary', 10, 2),
(57, 'Flippers', 10, 2),
(58, '1/2 Magic', 10, 3),
(59, 'Tempered Sword', 10, 3),
(60, 'Blue Shield', 10, 3),
(61, 'Mid TRock HP', 9, 1),
(62, 'Cape HP', 9, 3),
(63, 'Fire Shield', 9, 2),
(64, '$ Pulled From 4 Different Objects', 9, 7),
(65, 'End Mire Rain', 9, 6),
(66, 'Peg HP', 8, 3),
(67, 'Pendant of Wisdom', 8, 1),
(68, 'Cape', 8, 3),
(69, 'Houlihan Room', 8, 4),
(70, 'Pendant of Power', 8, 6),
(71, 'Open 6 50 rupees chests', 8, 7),
(72, 'Titan''s Mitts', 7, 3),
(73, 'Thieves'' Map + Compass', 7, 3),
(74, 'Powder', 7, 2),
(75, 'Bridge Bottle', 7, 5),
(76, 'Ether', 7, 1),
(77, 'Graveyard HP', 7, 3),
(78, 'Pyramid HP', 6, 4),
(79, 'Power Gloves', 6, 6),
(80, 'Hammer', 6, 5),
(81, 'Desert Map + Compass', 6, 6),
(82, 'Magic Boomerang', 6, 2),
(83, 'NE Desert HP', 6, 6),
(84, 'Mire HP', 6, 6),
(85, 'Mid-Desert HP', 5, 6),
(86, 'Eastern Map + Compass', 5, 5),
(87, 'Buy a Shield', 5, 4),
(88, 'Talk to the Hand', 5, 8),
(89, 'South of Flute Grotto HP', 5, 4),
(90, 'Moon Pearl', 4, 1),
(91, 'Perfect Arrow Mini-Game', 4, 3),
(92, 'Book of Mudora', 4, 3),
(93, 'Ice Rod', 4, 8),
(94, 'Sanctuary HP', 4, 3),
(95, 'Spectacle Rock HP', 4, 1),
(96, 'Death Mtn Cave HP', 4, 1),
(97, '5 Equips from NPCs', 4, 8),
(98, 'Hera Map + Compass', 3, 1),
(99, 'Blue Potion', 3, 2),
(100, '300 Rupees from Chest Game', 3, 3),
(101, 'Pendant of Courage', 3, 5),
(102, 'Aginah HP', 3, 6),
(103, 'Red Potion', 2, 2),
(104, 'Green Potion', 2, 2),
(105, 'Bow', 2, 5),
(106, 'Net', 2, 3),
(107, 'Sell Fish to Merchant', 2, 7),
(108, 'Lost Woods HP', 2, 3),
(109, 'Hideout HP', 2, 3),
(110, 'Buy a Bee', 2, 8),
(111, 'Well HP', 1, 3),
(112, 'Race HP', 1, 3),
(113, 'Hyrule Castle Map', 1, 4),
(114, 'The Single Arrow Chest', 1, 5),
(115, 'Swamp Floodgate HP', 1, 7),
(116, 'Have Fortune Told', 1, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bingo_goals`
--
ALTER TABLE `bingo_goals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bingo_goals`
--
ALTER TABLE `bingo_goals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
