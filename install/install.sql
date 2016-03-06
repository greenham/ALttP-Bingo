-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2016 at 11:15 PM
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
(3, '3 Armors', 25, 8),
(4, 'Light World Pendants in Reverse', 25, 5),
(5, 'Big Blue Pig, no Tempered', 25, 4),
(6, 'Trinexx, no Tempered', 25, 1),
(7, 'Ganon''s Tower', 24, 1),
(8, 'Big Blue Pig', 24, 4),
(9, 'Open Pyramid Cracked Wall', 24, 4),
(10, '10 Hearts', 24, 7),
(11, 'Ice Rod with Super Bomb', 24, 8),
(12, 'Swap a Big Chest into a Small Chest', 23, 5),
(13, '6th Crystal', 23, 6),
(14, 'Mire Compass, no Switches', 23, 6),
(15, '5th Crystal', 23, 8),
(16, 'Blind, no B Button', 22, 3),
(17, 'Ganon''s Tower Map + Compass', 22, 1),
(18, 'Cane of Byrna, no Cape', 22, 1),
(19, 'Darkness or Skull, No Statues', 22, 5),
(20, 'Darkness or Skull, No Statues', 22, 7),
(21, 'Blue Mail, no Bombs', 22, 8),
(22, 'Moldorm Re-Fight', 21, 1),
(23, '4 Swords', 21, 4),
(24, 'Mire Map + Compass', 21, 6),
(25, '2nd Crystal', 21, 7),
(26, 'Ice Map + Compass', 21, 8),
(27, 'Turtle Rock Map + Compass', 20, 1),
(28, 'Lanmolas Refight', 20, 1),
(29, 'Darkness BK, no Bombs', 20, 5),
(30, 'Pendant of Courage, Swordless', 20, 5),
(31, 'Blue Mail', 20, 8),
(32, 'Armos Refight', 19, 1),
(33, 'Red Mail', 19, 1),
(34, '3 Shields', 19, 2),
(35, '3rd Crystal, no Moon Pearl', 19, 3),
(36, 'Hookshot', 19, 7),
(37, 'Move 3 Walls', 19, 6),
(38, 'LSD Blind', 18, 3),
(39, 'Mirror Shield', 18, 1),
(40, '3 Medallions', 18, 2),
(41, '1st Crystal', 18, 5),
(42, 'Swamp Map + Compass', 18, 7),
(43, '2 Canes', 17, 2),
(44, '3rd Crystal', 17, 3),
(45, 'Lumberjack''s HP', 17, 3),
(46, 'Boomerang after Agahnim', 17, 4),
(47, 'Darkness Map + Compass', 17, 5),
(48, '4 Magic Consuming Items', 17, 7),
(49, '4th Crystal', 16, 3),
(50, 'Skull Map + Compass', 16, 3),
(51, 'Hyrule Castle + Aga Tower, no EG', 16, 4),
(52, 'Close the Castle', 16, 4),
(53, 'Kill a Boss with Silver Arrows', 16, 8),
(54, 'Kill a Boss with 3+ Keys On-Hand', 15, 4),
(55, 'Blue Rupee Room in a DW Dungeon', 15, 5),
(56, 'Cane of Somaria', 15, 6),
(57, 'Blue Rupee Room in DW Dungeon', 15, 7),
(58, 'Red Rupee from a Dungeon Chest', 15, 7),
(59, 'Use Silver Bee in a Boss Battle', 15, 8),
(60, 'Cane of Byrna', 14, 1),
(61, 'Zora''s HP', 14, 2),
(62, 'Master Sword', 14, 3),
(63, 'Flute, no Moon Pearl', 14, 4),
(64, 'Pendant of Power, no Gloves', 14, 6),
(65, 'Hera BK, no Lamp', 13, 1),
(66, 'Fire Rod, no Bombs', 13, 3),
(67, 'Digging Game HP', 13, 3),
(68, 'Gold Sword + Silver Arrows', 13, 4),
(69, 'Chest Game HP', 12, 3),
(70, 'Bombos', 12, 6),
(71, 'Purple Chest Bottle', 12, 7),
(72, 'Lake Hylia HP', 12, 8),
(73, 'Dark DM Island HP', 11, 1),
(74, 'Defeat 3 Lynels', 11, 1),
(75, 'Quake', 11, 2),
(76, 'Fire Rod', 11, 3),
(77, 'Flute', 11, 4),
(78, 'Open Darkness', 11, 5),
(79, 'Flippers', 10, 2),
(80, 'Get two Zeldas inside Sanctuary', 10, 2),
(81, 'Tempered Sword', 10, 3),
(82, 'Blue Shield', 10, 3),
(83, '1/2 Magic', 10, 3),
(84, 'Mid TRock HP', 9, 1),
(85, 'Pendant of Wisdom, no Mirror', 9, 1),
(86, 'Fire Shield', 9, 2),
(87, 'Cape HP', 9, 3),
(88, 'End Mire Rain', 9, 6),
(89, '$ From 4 Unique Types of Objects', 9, 7),
(90, 'Pendant of Wisdom', 8, 1),
(91, 'Cape', 8, 3),
(92, 'Peg HP', 8, 3),
(93, 'Houlihan Room', 8, 4),
(94, 'Pendant of Power', 8, 6),
(95, '6 Different 50 Rupee Chests', 8, 7),
(96, 'Cape, no Mirror', 8, 7),
(97, 'Ether', 7, 1),
(98, 'Powder', 7, 2),
(99, 'Titan''s Mitts', 7, 3),
(100, 'Thieves'' Map + Compass', 7, 3),
(101, 'Graveyard HP', 7, 3),
(102, 'Bridge Bottle', 7, 5),
(103, 'Pendant of Power, no Mudora', 7, 6),
(104, 'Magic Boomerang', 6, 2),
(105, 'Pyramid HP', 6, 4),
(106, 'Hammer', 6, 5),
(107, 'Power Gloves', 6, 6),
(108, 'Desert Map + Compass', 6, 6),
(109, 'NE Desert HP', 6, 6),
(110, 'Mire HP', 6, 6),
(111, 'South of Flute Grotto HP', 5, 4),
(112, 'Buy Shield', 5, 4),
(113, 'Eastern Map + Compass', 5, 5),
(114, 'Mid-Desert HP', 5, 6),
(115, 'Talk to the Hand', 5, 8),
(116, 'Single Arrow Chest', 5, 5),
(117, 'Hit Crystal Switch in a Cave', 5, 1),
(118, 'Moon Pearl', 4, 1),
(119, 'Spectacle Rock HP', 4, 1),
(120, 'Death Mtn Cave HP', 4, 1),
(121, 'Perfect Arrow Mini-Game', 4, 3),
(122, 'Sanctuary HP', 4, 3),
(123, 'Ice Rod', 4, 8),
(124, '5 Equips from NPCs', 4, 8),
(125, 'Hera Map + Compass', 3, 1),
(126, 'Blue Potion', 3, 2),
(127, '300 Rupees from Chest Game', 3, 3),
(128, 'Pendant of Courage', 3, 5),
(129, 'Aginah HP', 3, 6),
(130, 'Red Potion', 2, 2),
(131, 'Green Potion', 2, 2),
(132, 'Net', 2, 3),
(133, 'Lost Woods HP', 2, 3),
(134, 'Hideout HP', 2, 3),
(135, 'Bow', 2, 5),
(136, 'Sell Fish to Merchant', 2, 7),
(137, 'Buy a Bee', 2, 8),
(138, 'Well HP', 1, 3),
(139, 'Race HP', 1, 3),
(140, 'Hyrule Castle Map', 1, 4),
(141, 'Swamp Floodgate HP', 1, 7),
(142, 'Have Fortune Told', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `bingo_users`
--

CREATE TABLE `bingo_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bingo_goals`
--
ALTER TABLE `bingo_goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bingo_users`
--
ALTER TABLE `bingo_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bingo_goals`
--
ALTER TABLE `bingo_goals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `bingo_users`
--
ALTER TABLE `bingo_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
