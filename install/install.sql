-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2016 at 03:30 AM
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
(3, 'Ganon''s Tower', 24, 1),
(4, 'Ganon''s Tower Map + Compass', 22, 1),
(5, 'Cane of Byrna, no Cape', 22, 1),
(6, 'Moldorm Re-Fight', 21, 1),
(7, 'Turtle Rock Map + Compass', 20, 1),
(8, 'Lanmolas Refight', 20, 1),
(9, 'Armos Refight', 19, 1),
(10, 'Red Mail', 19, 1),
(11, 'Mirror Shield', 18, 1),
(12, 'Cane of Byrna', 14, 1),
(13, 'Dark DM Island HP', 11, 1),
(14, 'Defeat 3 Lynels', 11, 1),
(15, 'Mid TRock HP', 9, 1),
(16, 'Pendant of Wisdom', 8, 1),
(17, 'Ether', 7, 1),
(18, 'Moon Pearl', 4, 1),
(19, 'Spectacle Rock HP', 4, 1),
(20, 'Death Mtn Cave HP', 4, 1),
(21, 'Hera Map + Compass', 3, 1),
(22, '3 Shields', 19, 2),
(23, '3 Medallions', 18, 2),
(24, '2 Canes', 17, 2),
(25, 'Zora''s HP', 14, 2),
(26, 'Quake', 11, 2),
(27, 'Flippers', 10, 2),
(28, 'Get two Zeldas inside Sanctuary', 10, 2),
(29, 'Fire Shield', 9, 2),
(30, 'Powder', 7, 2),
(31, 'Magic Boomerang', 6, 2),
(32, 'Blue Potion', 3, 2),
(33, 'Red Potion', 2, 2),
(34, 'Green Potion', 2, 2),
(35, '3rd Crystal, no Moon Pearl', 19, 3),
(36, '3rd Crystal', 17, 3),
(37, 'Lumberjack''s HP', 17, 3),
(38, '4th Crystal', 16, 3),
(39, 'Skull Map + Compass', 16, 3),
(40, 'Fire Rod, no Bombs', 14, 3),
(41, 'Master Sword', 13, 3),
(42, 'Digging Game HP', 13, 3),
(43, 'Chest Game HP', 12, 3),
(44, 'Fire Rod', 11, 3),
(45, 'Tempered Sword', 10, 3),
(46, 'Blue Shield', 10, 3),
(47, '1/2 Magic', 10, 3),
(48, 'Cape', 8, 3),
(49, 'Cape HP', 9, 3),
(50, 'Peg HP', 8, 3),
(51, 'Titan''s Mitts', 7, 3),
(52, 'Thieves'' Map + Compass', 7, 3),
(53, 'Graveyard HP', 7, 3),
(54, 'Perfect Arrow Mini-Game', 4, 3),
(55, 'Sanctuary HP', 4, 3),
(56, '300 Rupees from Chest Game', 3, 3),
(57, 'Net', 2, 3),
(58, 'Lost Woods HP', 2, 3),
(59, 'Hideout HP', 2, 3),
(60, 'Well HP', 1, 3),
(61, 'Race HP', 1, 3),
(62, 'Big Blue Pig', 24, 4),
(63, 'Open Pyramid Cracked Wall', 24, 4),
(64, '4 Swords', 21, 4),
(65, 'Boomerang after Agahnim', 17, 4),
(66, 'Close the Castle', 16, 4),
(67, 'Kill a Boss with 3+ Keys On-Hand', 15, 4),
(68, 'Gold Sword + Silver Arrows', 13, 4),
(69, 'Flute', 11, 4),
(70, 'Houlihan Room', 8, 4),
(71, 'Pyramid HP', 6, 4),
(72, 'South of Flute Grotto HP', 5, 4),
(73, 'Buy Shield', 5, 4),
(74, 'Hyrule Castle Map', 1, 4),
(75, 'Darkness or Skull, No Statues', 22, 5),
(76, 'Light World Pendants in Reverse', 20, 5),
(77, 'Darkness BK, no Bombs', 20, 5),
(78, '1st Crystal', 18, 5),
(79, 'Darkness Map + Compass', 17, 5),
(80, 'Blue Rupee Room in a DW Dungeon', 15, 5),
(81, 'Open Darkness', 11, 5),
(82, 'Hammer', 6, 5),
(83, 'Bridge Bottle', 7, 5),
(84, 'Pendant of Courage', 3, 5),
(85, 'Eastern Map + Compass', 5, 5),
(86, 'Bow', 2, 5),
(87, '6th Crystal', 23, 6),
(88, 'Mire Compass, no Switches', 23, 6),
(89, 'Mire Map + Compass', 21, 6),
(90, 'Cane of Somaria', 15, 6),
(91, 'Bombos', 12, 6),
(92, 'End Mire Rain', 9, 6),
(93, 'Pendant of Power', 8, 6),
(94, 'Power Gloves', 6, 6),
(95, 'Desert Map + Compass', 6, 6),
(96, 'NE Desert HP', 6, 6),
(97, 'Mire HP', 6, 6),
(98, 'Mid-Desert HP', 5, 6),
(99, 'Aginah HP', 3, 6),
(100, 'Darkness or Skull, No Statues', 22, 7),
(101, '2nd Crystal', 21, 7),
(102, 'Hookshot', 19, 7),
(103, 'Swamp Map + Compass', 18, 7),
(104, '4 Magic Consuming Items', 17, 7),
(105, 'Blue Rupee Room in DW Dungeon', 15, 7),
(106, 'Red Rupee from a Dungeon Chest', 15, 7),
(107, 'Purple Chest Bottle', 12, 7),
(108, '$ Pulled From 4 Different Objects', 9, 7),
(109, '6 Different 50 Rupee Chests', 8, 7),
(110, 'Cape, no Mirror', 8, 7),
(111, 'Sell Fish to Merchant', 2, 7),
(112, 'Swamp Floodgate HP', 1, 7),
(113, '3 Armors', 25, 8),
(114, '5th Crystal', 23, 8),
(115, 'Blue Mail, no Bombs', 22, 8),
(116, 'Blue Mail', 20, 8),
(117, 'Ice Map + Compass', 21, 8),
(118, 'Kill a Boss with Silver Arrows', 16, 8),
(119, 'Use Silver Bee in a Boss Battle', 15, 8),
(120, 'Lake Hylia HP', 12, 8),
(121, 'Talk to the Hand', 5, 8),
(122, 'Ice Rod', 4, 8),
(123, '5 Equips from NPCs', 4, 8),
(124, 'Buy a Bee', 2, 8),
(125, 'Have Fortune Told', 1, 8);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
