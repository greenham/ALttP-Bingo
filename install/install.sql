-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2016 at 10:27 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alttp`
--

-- --------------------------------------------------------

--
-- Table structure for table `bingo_goals`
--

CREATE TABLE `bingo_goals` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `difficulty` tinyint(3) UNSIGNED NOT NULL,
  `exclusion_group` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bingo_goals`
--

INSERT INTO `bingo_goals` (`id`, `name`, `difficulty`, `exclusion_group`) VALUES
(1, 'Freeze and then burn an enemy', 1, 1),
(2, 'Translate all 4 pieces of Hylian text', 1, 2),
(3, 'Collect both types of bee', 1, 3),
(4, 'Perfect archery mini-game', 1, 4),
(5, 'Buy and sell wares with the merchant', 1, 5),
(6, '4 LW maps', 2, 1),
(7, 'Faerie room in each LW dungeon', 2, 2),
(8, 'Hera Big Key, no lamp', 2, 3),
(9, '3 LW compasses', 2, 4),
(10, 'Lanmolas'', no sword or bow', 2, 5),
(11, 'Buy 2 different shields', 3, 1),
(12, 'Destroy both Hylian stone tablets', 3, 2),
(13, '4 bottles', 3, 3),
(14, 'Cane of Byrna, no Bug Net or Magic Cape', 3, 4),
(15, 'Unlock the purple chest', 3, 5),
(16, '8 heart pieces', 4, 1),
(17, '3 medallions', 4, 2),
(18, 'All 3 potions', 4, 3),
(19, '2 different potions, no potion shop', 4, 4),
(20, 'Defeat 4 bosses', 4, 5),
(21, '6 50 rupee chests', 5, 1),
(22, '6 bomb chests, no gambling', 5, 2),
(23, '300 rupees from 5 chests/NPC''s', 5, 3),
(24, 'All 6 types of rupee chest', 5, 4),
(25, 'Healed by 5 Great Faeries', 5, 5),
(26, '12 heart pieces', 6, 1),
(27, '7 DW heart pieces', 6, 2),
(28, '7 LW overworld heart pieces', 6, 3),
(29, '10 hearts', 6, 4),
(30, '6 bosses', 6, 5),
(31, '1 crystal, no Magic Mirror', 7, 1),
(32, '2 Big Chests, swordless', 7, 2),
(33, '1 crystal, no Moon Pearl', 7, 3),
(34, 'Magic Cape, no Magic Mirror', 7, 4),
(35, 'Flute, no Moon Pearl', 7, 5),
(36, 'Crystal #1', 8, 1),
(37, 'Blue rupee room, DW dungeon', 8, 2),
(38, 'Defeat 15 turtles', 8, 3),
(39, 'Darkness map and compass', 8, 4),
(40, '10 small chests in Darkness', 8, 5),
(41, 'Crystal #4', 9, 1),
(42, 'Downgrade Titan''s Mitts', 9, 2),
(43, 'Blind, swordbeams only', 9, 3),
(44, '6 blue warps underneath rocks', 9, 4),
(45, 'Blind, no sword/hammer', 9, 5),
(46, '5 arrow chests, no gambling', 10, 1),
(47, '3 telepathy tiles outside of dungons', 10, 2),
(48, 'Downgrade a sword', 10, 3),
(49, '4 NPC''s have followed Link', 10, 4),
(50, 'Die in 1 hit at full health', 10, 5),
(51, 'Crystal #3', 11, 1),
(52, 'Skull Woods, no moving statues', 11, 2),
(53, 'Defeat a boss, rods only', 11, 3),
(54, 'Mothula, swordless', 11, 4),
(55, 'Mothula, Cane of Somaria', 11, 5),
(56, 'All 4 swords', 12, 1),
(57, 'Use different swords to collect Bombos/Ether', 12, 2),
(58, 'Defeat a boss, Master Sword only', 12, 3),
(59, 'Defeat a Lynel, Gold Sword', 12, 4),
(60, 'Gold Sword twice', 12, 5),
(61, 'Crystal #6', 13, 1),
(62, 'Mire 100% map completion', 13, 2),
(63, 'Vitreous, bow only (either arrows)', 13, 3),
(64, 'Mire map and compass', 13, 4),
(65, 'Mire, both blue rupee rooms', 13, 5),
(66, 'Crystal #2', 14, 1),
(67, 'Hookshot', 14, 2),
(68, 'Arrghus, swordless', 14, 3),
(69, 'Swamp map and compass', 14, 4),
(70, 'Catch a faerie, DM 4 faerie cave', 14, 5),
(71, 'Defeat the one and only Usain Bolt', 15, 1),
(72, 'Collect 4 small keys from Agahnim''s Tower', 15, 2),
(73, 'Lumberjack heart piece', 15, 3),
(74, 'Agahnim 1, swordless', 15, 4),
(75, 'Defeat a blue tektike by Spectacle Rock', 15, 5),
(76, '3 rows of Y-items', 16, 1),
(77, 'Top row of Y-items, max upgrades', 16, 2),
(78, '7 blue Y-items', 16, 3),
(79, '8 magic consuming items', 16, 4),
(80, '3 columns of Y-items', 16, 5),
(81, 'Crystal #5', 17, 1),
(82, '3 telepathy tiles in Ice Palace', 17, 2),
(83, 'Kholdstare, no Fire Rod', 17, 3),
(84, 'Ice Palace map and compass', 17, 4),
(85, 'Blue Sword, Blue Shield, Blue Mail', 17, 5),
(86, 'Open the entrances to all crystal dungeons', 18, 1),
(87, '8 Big Chests', 18, 2),
(88, 'Defeat a boss with 3+ small keys, no dupes', 18, 3),
(89, 'Finish 1 DW dungeon without its Big Key', 18, 4),
(90, 'Open Pyramid cracked wall', 18, 5),
(91, '4 DW maps', 19, 1),
(92, 'Touch a bumper in 4 dungeons', 19, 2),
(93, 'Defeat a mini-helmasaur in 3 dungeons', 19, 3),
(94, '4 DW compasses', 19, 4),
(95, 'Open any rupee chest in 4 DW dungeons', 19, 5),
(96, 'Crystal #7', 20, 1),
(97, 'Trinexx, no Tempered/Gold Sword', 20, 2),
(98, 'All 3 shields', 20, 3),
(99, 'Turtle Rock map and compass', 20, 4),
(100, 'Turtle Rock 100% map completion', 20, 5),
(101, 'Make 2 chests spawn in 3 DW dungeons', 21, 1),
(102, 'Move 3 walls', 21, 2),
(103, 'Defeat a wizzrobe in 2 dungeons', 21, 3),
(104, 'Use an orange warp tile in 3 DW dungeons', 21, 4),
(105, 'Completely destroy 2 walls', 21, 5),
(106, '2 refights in Ganon''s Tower', 22, 1),
(107, 'Ganon''s Tower 100% map completion', 22, 2),
(108, 'Agahnim 2, Bug Net only', 22, 3),
(109, 'Ganon''s Tower map and compass', 22, 4),
(110, 'Red Sword, Red Shield, Red Mail', 22, 5),
(111, 'Defeat Moldorm with all 4 swords', 23, 1),
(112, 'Open every Big Chest', 23, 2),
(113, 'Defeat Ganon', 23, 3),
(114, 'Collect each pendant, swordless', 23, 4),
(115, 'Yellow Sword, Yellow Shield, Yellow Hat', 23, 5),
(116, '6 heart pieces in the rain', 24, 1),
(117, 'Reveal 4 hidden floors with Ether', 24, 2),
(118, 'Defeat Ganon with the Master Sword', 24, 3),
(119, '15 hearts', 24, 4),
(120, '3 Mails', 24, 5),
(121, '3 crystals, no boots', 25, 1),
(122, 'LW Big Chests in reverse order', 25, 2),
(123, 'Gold bee, no boots', 25, 3),
(124, 'Finish 3 dungeons without their Big Keys', 25, 4),
(125, 'Defeat 4 bosses with canes', 25, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bingo_settings`
--

CREATE TABLE `bingo_settings` (
  `setting` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bingo_settings`
--

INSERT INTO `bingo_settings` (`setting`, `value`) VALUES
('rules_markdown', '- All Glitches are allowed.\r\n- Use of Japanese v1.0 is recommended, but all official versions are allowed. [SRL emulator rules](http://www.speedrunslive.com/races/game/#!/alttp/1) apply.\r\n- You must load a dungeon properly to complete it, as well as obtain its map, compass, big key, and small keys.\r\n- Swordless goals only prohibit the possession of a sword within the boss room of the dungeon.');

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
-- Indexes for table `bingo_settings`
--
ALTER TABLE `bingo_settings`
  ADD PRIMARY KEY (`setting`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `bingo_users`
--
ALTER TABLE `bingo_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
