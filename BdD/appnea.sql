-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 23 juin 2023 à 17:35
-- Version du serveur : 10.5.18-MariaDB-0+deb11u1
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `appnea`
--

-- --------------------------------------------------------

--
-- Structure de la table `datasensor`
--

CREATE TABLE `datasensor` (
  `id_data` varchar(31) NOT NULL,
  `id_sensor` varchar(31) NOT NULL,
  `dataFile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dataFile`)),
  `date_start` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_end` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `datasensor`
--

INSERT INTO `datasensor` (`id_data`, `id_sensor`, `dataFile`, `date_start`, `date_end`) VALUES
('302202306231132', '02', '{\"values\":[27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,28,28,28,28,28,28,28,28,28,28]}', '2023-06-23 09:32:18', '2023-06-23 09:57:32'),
('302202306231231', '02', '{\"values\":[26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,28,28,29,29,29,30,30,30,30,31,31,31,31,31,31,31,30,30,30,30,30,29,29,29,29,29,29,29,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28,28]}', '2023-06-23 10:31:15', '2023-06-23 10:50:41'),
('302202306231310', '02', '{\"values\":[26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,26,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,27,28,28,27,27,27]}', '2023-06-23 11:10:36', '2023-06-23 11:15:51'),
('302202306231337', '02', '{\"values\":[26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27]}', '2023-06-23 11:37:19', '2023-06-23 11:42:19'),
('403202306231132', '03', '{\"values\":[47,47,47,47,46,47,47,47,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,45,46,46,46,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,45,55,54,52,50,48,47,46,46,46,46,45,45,45,45,45,45,45,45,45,46,46,46,45,45,45,45,45,45,54,64,71,66,62,56,52,50,48,47,46,46,56,64,71,68,62,57,53,50,48,46,45,45,44,44,44,43,43,43,43,43,43,43,43]}', '2023-06-23 09:32:18', '2023-06-23 09:57:32'),
('403202306231231', '03', '{\"values\":[45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,44,44,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,45,48,55,61,63,64,64,64,64,65,65,65,65,64,64,63,64,60,53,48,43,41,40,38,37,37,37,37,37,37,38,38,38,38,38,39,39,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,43,43,42,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,44,44,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,43,46,53,53,50,46,44,43,42,41,41,41,40,40,41,41,41,41,41,41,41,41,41,41,41,41,41,41,41]}', '2023-06-23 10:31:15', '2023-06-23 10:50:41'),
('403202306231310', '03', '{\"values\":[46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,46,45,45,45,45,45,45,45,45,46,46,53,65,72,73,69,63,58,54,51,49,48,47]}', '2023-06-23 11:10:36', '2023-06-23 11:15:51'),
('403202306231337', '03', '{\"values\":[45,47,47,47,47,47,47,46,46,47,46,46,46,46,46,46,46,46,55,62,67,71,73,70,65,62,58,55,53,51,50,50,49,49,48,48,48,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,53,61,63,60,56,53]}', '2023-06-23 11:37:19', '2023-06-23 11:42:19'),
('704202306231132', '04', '{\"values\":[3,4,4,4,3,4,3,4,3,3,4,3,4,4,3,3,3,4,3,3,3,3,4,4,4,3,3,3,3,3,4,3,4,3,3,3,4,3,4,3,3,3,3,3,3,3,3,3,4,3,3,3,3,4,3,3,4,3,3,3,3,3,3,3,3,3,3,4,3,3,3,3,3,4,3,4,4,3,3,3,3,4,3,3,3,3,3,4,3,3,4,3,4,3,3,3,3,3,4,3,3,3,3,4,4,3,3,3,3,3,3,3,4,3,3,3,4,4,4,3,3,3,4,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,3,3,4,3,4,4,3,4,3,3,4,3,3,3,3,3,4,3,3,3,3,3,4,3,4,4,3,3,4,3,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,4,3,3,3,3,4,3,3,3,3,3,3,3,4,3,3,3,3,3,4,3,4,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,3,2,2,2,3,3,2,2,3,2,3,3,2,3,3,2,3,2,2,3,3,3,3,3,2,3,3,2,3,3,3,3,2,3,3,3,3,3,2,3,3,2,3,2,3,2,3,2,2,3,2,3,3,3,2,3,3,3,3,3,3,3,2,3,2,2,2,3,3,2,2,3,3,3,2,3,3,3,3,2,3,3,3,3,3,2,3,3,2,3,3,3,3,3,3,3,3,3,3,2,2,3,2,3,3,2,2,2,3,3,3,3,3,2,2,2,2,3,3,3,3,3,3,2,2,3,2,2,3,2,3,2,2,3,2,2,2,3,2,3,3,3,3,3,2,3,3,3,2,3,2,2,3,3,2,2,2,3,3,2,2,3,3,2,3,2,3,2,2,2,2,2,2,2,2,2,2,3,2,3,2,2,3,2,2,3,2,2,2,2,2,3,3,2,3,2,2,2,2,2,2,3,2,2,3,3,2,3,3,2,2,2,3,3,2,3,2,3,2,3,3,2,2,3,3,2,3,2,2,2,2,2,2,2,2,2,3,3,2,3,3,2,2,3,2,2,2,2,3,2,2,2,3,3,2,3,3,3,2,2,3,3,3,2,2,2,2,2,2,2,2,3]}', '2023-06-23 09:32:18', '2023-06-23 09:57:32'),
('704202306231231', '04', '{\"values\":[3,3,3,2,3,3,8,16,31,30,3,2,3,3,2,3,3,2,2,3,3,3,2,3,3,2,3,3,2,3,2,2,3,2,3,2,2,3,2,2,3,3,3,3,3,3,3,3,2,3,3,2,3,3,2,2,3,3,3,2,3,2,3,3,2,2,2,3,3,3,2,2,2,2,2,2,3,3,2,2,2,2,2,2,3,3,3,3,3,2,2,2,3,3,3,3,3,3,2,2,2,2,3,3,2,3,2,3,2,2,2,3,3,3,3,2,2,3,2,2,3,3,3,2,2,2,2,2,3,2,2,3,3,2,2,3,2,3,2,3,2,2,3,2,3,3,3,3,2,2,2,2,3,2,3,2,2,2,3,2,2,3,3,2,2,3,2,2,3,2,2,3,3,3,2,2,2,2,3,3,2,3,2,3,3,2,3,3,2,2,2,3,2,2,2,2,2,3,2,2,2,2,2,3,2,2,2,2,2,2,3,2,2,2,3,3,2,3,3,3,3,2,2,2,3,2,2,2,3,3,2,2,2,2,2,2,2,2,2,2,2,3,2,3,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,3,2,2,3,2,2,2,2,3,2,2,2,2,2,3,3,2,3,3,2,3,2,2,2,3,2,2,3,3,2,3,3,2,2,2,3,3,2,2,3,3,2,3,2,2,3,2,3,2,2,2,3,2,2,2,3,2,2,2,2,3,2,3,3,3,3,3,2,3,3,2,3,2,2,2,3,2,2,2,2,2,2,2,2,2,2,3,2,3,2,3,2,3,2,3,3,2,2,3,3,2,2,2,3,3,2,2,3,3,2,2,3,2,3,3,3,2,3,3,2,3,3,2,2,2,3,2,2,3,2,2,2,2,3,2,2,2,3,3,3,3,3,2,2,3,2,2,3,3,3,2,2,2,3,2,3,2,3,3,3,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,3,3,3,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,3,2,3,3,2,2,2,2,2,2,2,2,2,2,3,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,3,3,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,3,3,2,2,2,3,2,2,2,2,2,2,3,2,2,2,2,2,3,2,2,2,3,2,3,3,2,2,2,2,2,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,3,2,2,2,2,2,2,2,2,3,3,2,2,2,3,2,3,2,2,2,2,2,2,2,2,2,2,3,2,3,2,2,3,2,2,3,2,3,2,2,2,2,2,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,3,3,2,2,2,2,2,2,2,3,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,3,2,2,3,2,2,2,2,2,3,2,2,2,3,2,2,2,2,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,3,2,3,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,3,2,2,3,2,2,2,2,2,3,2,2,2,2,3,2,2,2,2,2,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,3,2,2,2,2,2,2,3,2,2,2,2,2,2,2,3,2,2,2,2,2,2,2,2]}', '2023-06-23 10:31:16', '2023-06-23 10:50:42'),
('704202306231310', '04', '{\"values\":[5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]}', '2023-06-23 11:10:37', '2023-06-23 11:15:53'),
('704202306231337', '04', '{\"values\":[4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,3,4,3,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,3,3,3,3,3,3,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]}', '2023-06-23 11:37:20', '2023-06-23 11:42:20'),
('905202306231013', '05', '{\"values\":[1,78,77,0,88,85,89,90,84,18,83,82,84,81,90,39,81,82,86,81,88]}', '2023-06-23 08:13:06', '2023-06-23 09:56:46'),
('905202306231231', '05', '{\"values\":[18,85,72,76,72,76,73,78,80,80,83,76,75,79,75,77,70,73,75,66]}', '2023-06-23 10:31:25', '2023-06-23 10:50:25'),
('905202306231310', '05', '{\"values\":[0,84,91,93,89,94]}', '2023-06-23 11:10:36', '2023-06-23 11:15:36'),
('905202306231337', '05', '{\"values\":[0,89,82,83,78,54]}', '2023-06-23 11:37:19', '2023-06-23 11:42:19'),
('data1', 'sensor1', '{ \"values\": [23.4, 23.6, 23.8, 24.1, 23.9] }', '2022-01-01 11:00:00', '2022-01-01 12:00:00'),
('data10', 'sensor4', '{\"values\":[60, 70, 80, 90, 100]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data11', 'sensor4', '{\"values\":[70, 80, 90, 100, 110]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data12', 'sensor4', '{\"values\":[50, 60, 70, 80, 90]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data13', 'sensor4', '{\"values\":[40, 50, 60, 70, 80]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data13_1', 'sensor33', '{\"value\": 23.5, \"unit\": \"Celsius\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data14', 'sensor4', '{\"values\":[30, 40, 50, 60, 70]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data14_1', 'sensor34', '{\"value\": 72, \"unit\": \"bpm\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data15', 'sensor4', '{\"values\":[20, 30, 40, 50, 60]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data15_1', 'sensor35', '{\"value\": 50, \"unit\": \"%\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data16_1', 'sensor36', '{\"value\": 70, \"unit\": \"dB\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data17_1', 'sensor37', '{\"value\": 25.1, \"unit\": \"Celsius\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data18', 'sensor31', '{\"values\": [24, 25, 26, 25, 23]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data18_1', 'sensor38', '{\"value\": 68, \"unit\": \"bpm\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data19', 'sensor32', '{\"values\": [38, 39, 40, 41, 42]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data19_1', 'sensor39', '{\"value\": 48, \"unit\": \"%\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data2', 'sensor1', '{ \"values\": [23.9, 24.2, 24.5, 24.1, 23.8] }', '2022-01-02 11:00:00', '2022-01-02 12:00:00'),
('data20_1', 'sensor40', '{\"value\": 67, \"unit\": \"dB\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data21_1', 'sensor41', '{\"value\": 23, \"unit\": \"°C\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data22_1', 'sensor42', '{\"value\": 78, \"unit\": \"%\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data23_1', 'sensor43', '{\"value\": 12, \"unit\": \"bpm\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data24_1', 'sensor44', '{\"value\": 75, \"unit\": \"%\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data25_1', 'sensor45', '{\"value\": 30, \"unit\": \"°C\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data26_1', 'sensor46', '{\"value\": 65, \"unit\": \"dB\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data27_1', 'sensor47', '{\"value\": 70, \"unit\": \"bpm\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data28_1', 'sensor48', '{\"value\": 54, \"unit\": \"%\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data29_1', 'sensor49', '{\"value\": 22, \"unit\": \"°C\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data3', 'sensor1', '{ \"values\": [22.8, 22.9, 22.5, 22.7, 22.6] }', '2022-01-03 11:00:00', '2022-01-03 12:00:00'),
('data30_1', 'sensor50', '{\"value\": 70, \"unit\": \"dB\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data31_1', 'sensor51', '{\"value\": 80, \"unit\": \"bpm\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data32_1', 'sensor52', '{\"value\": 42, \"unit\": \"%\"}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data33_1', 'sensor53', '{\"value\": 20}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('data4', 'sensor2', '{ \"values\": [71, 68, 75, 79, 82] }', '2022-01-01 11:00:00', '2022-01-01 12:00:00'),
('data5', 'sensor2', '{ \"values\": [75, 77, 73, 69, 72] }', '2022-01-02 11:00:00', '2022-01-02 12:00:00'),
('data6', 'sensor2', '{ \"values\": [80, 81, 84, 78, 81] }', '2022-01-03 11:00:00', '2022-01-03 12:00:00'),
('data7', 'sensor3', '{ \"values\": [52.3, 50.6, 53.1, 54.8, 51.9] }', '2022-01-01 11:00:00', '2022-01-01 12:00:00'),
('data8', 'sensor3', '{ \"values\": [50.2, 49.7, 48.9, 50.6, 50.3] }', '2022-01-02 11:00:00', '2022-01-02 12:00:00'),
('data9', 'sensor3', '{ \"values\": [51.2, 50.9, 50.5, 52.1, 51.8] }', '2022-01-03 11:00:00', '2022-01-03 12:00:00'),
('dataFD_10', 'sensorFD2_sound', '{\"values\": [40.38, 40.2, 39.65, 38.65, 37.41, 36.15, 35.11, 34.51, 34.23, 34.29, 34.67, 35.43, 36.4, 37.41, 38.29, 38.84, 39.19, 39.32, 39.26, 39.22, 39.06, 38.64, 37.9, 36.85, 35.33, 33.32, 30.83, 27.06, 22.98, 19.44, 17.16, 16.77, 18.29, 21.79, 27.2, 35.07, 44.21, 53.42, 61.48, 67.14, 71.09, 73.23, 73.64, 72.32, 69.85, 66.91, 64.29, 62.89, 61.97, 61.55, 61.62, 62.46, 63.62, 64.68, 65.22, 64.87, 63.74, 61.81, 59.11, 55.17, 50.72, 46.44, 42.98, 40.94, 40.12, 40.58, 42.27, 45.36, 49.28, 53.37, 56.97, 59.37, 61.03, 61.92, 62.07, 61.58, 60.6, 59.34, 58.07, 57.12, 56.15, 55.16, 54.15, 53.17, 52.18, 51.14, 50.05, 48.88, 47.61, 46.25, 44.79, 43.1, 41.34, 39.67, 38.24, 37.15, 36.41, 36.03, 36.0, 36.32, 36.87, 37.51, 38.08, 38.39, 38.59, 38.68, 38.65, 38.68, 38.63, 38.42, 37.99, 37.34, 36.37, 35.07, 33.13, 30.9, 28.73, 26.9, 25.69, 25.33]}', '2023-04-21 22:10:00', '2023-04-22 06:10:00'),
('dataFD_11', 'sensorFD3_temp', '{\"values\": [37.453, 37.47, 37.486, 37.505, 37.523, 37.54, 37.554, 37.565, 37.571, 37.573, 37.57, 37.56, 37.548, 37.537, 37.531, 37.535, 37.547, 37.568, 37.597, 37.642, 37.692, 37.739, 37.775, 37.791, 37.789, 37.77, 37.733, 37.676, 37.608, 37.536, 37.471, 37.422, 37.383, 37.353, 37.333, 37.317, 37.307, 37.304, 37.307, 37.315, 37.332, 37.359, 37.396, 37.447, 37.505, 37.561, 37.608, 37.638, 37.654, 37.655, 37.642, 37.611, 37.57, 37.529, 37.498, 37.486, 37.488, 37.505, 37.537, 37.586, 37.646, 37.706, 37.759, 37.795, 37.821, 37.835, 37.838, 37.833, 37.821, 37.803, 37.782, 37.763, 37.74, 37.712, 37.68, 37.642, 37.602, 37.561, 37.525, 37.494, 37.469, 37.449, 37.435, 37.424, 37.417, 37.413, 37.409, 37.403, 37.399, 37.396, 37.394, 37.394, 37.394, 37.394, 37.393, 37.39, 37.386, 37.379, 37.371, 37.358, 37.344, 37.332, 37.324, 37.323, 37.328, 37.34, 37.358, 37.381, 37.409, 37.439, 37.47, 37.499, 37.528, 37.557, 37.588, 37.619, 37.65, 37.682, 37.713, 37.744]}', '2023-04-21 22:10:00', '2023-04-22 06:10:00'),
('dataFD_12', 'sensorFD4_heart', '{\"values\": [15.3, 20.0, 24.8, 30.1, 35.5, 40.3, 44.4, 47.4, 49.2, 49.8, 49.2, 47.4, 44.8, 41.8, 39.1, 37.1, 35.4, 34.0, 32.9, 31.8, 31.0, 30.4, 29.9, 29.6, 29.6, 29.9, 30.5, 31.2, 32.1, 33.2, 34.5, 36.0, 37.8, 40.0, 42.5, 45.8, 49.3, 52.6, 55.1, 56.4, 56.7, 55.8, 53.8, 50.2, 45.9, 41.6, 38.2, 36.5, 36.1, 37.1, 39.4, 43.2, 47.8, 52.7, 57.1, 60.4, 62.9, 64.7, 65.9, 66.5, 66.7, 66.6, 66.2, 66.0, 65.4, 64.6, 63.5, 62.3, 60.8, 59.2, 57.5, 55.7, 53.7, 51.5, 49.1, 46.1, 43.1, 40.2, 37.9, 36.4, 35.6, 35.7, 36.6, 38.5, 40.9, 43.4, 45.3, 46.2, 46.3, 45.7, 44.3, 41.9, 39.0, 36.0, 33.5, 32.0, 31.1, 30.9, 31.4, 32.5, 34.0, 35.8, 37.5, 38.8, 40.0, 41.2, 42.2, 43.2, 44.1, 45.0, 45.9, 46.9, 47.9, 49.0, 50.2, 51.4, 52.6, 53.8, 55.1, 56.3]}', '2023-04-21 22:10:00', '2023-04-22 06:10:00'),
('dataFD_5', 'sensorFD1_hum', '{\"values\": [33.468, 33.233, 32.546, 31.118, 29.39, 27.775, 26.664, 26.421, 26.934, 28.235, 30.291, 33.528, 37.269, 40.868, 43.71, 45.213, 45.581, 44.767, 42.818, 39.495, 35.416, 31.222, 27.582, 25.189, 23.625, 22.927, 23.059, 23.991, 25.476, 27.212, 28.842, 29.949, 30.896, 31.676, 32.294, 32.772, 33.143, 33.453, 33.763, 34.146, 34.527, 34.908, 35.289, 35.748, 36.208, 36.601, 36.878, 37.002, 36.951, 36.718, 36.311, 35.563, 34.699, 33.922, 33.418, 33.352, 33.694, 34.462, 35.639, 37.446, 39.526, 41.536, 43.15, 44.055, 44.367, 44.059, 43.156, 41.551, 39.55, 37.475, 35.664, 34.472, 33.676, 33.293, 33.306, 33.847, 34.652, 35.458, 35.999, 36.013, 35.63, 34.836, 33.645, 32.11, 30.312, 28.363, 26.41, 24.635, 22.854, 21.067, 19.275, 17.134, 14.99, 13.125, 11.762, 11.058, 11.107, 11.938, 13.52, 15.925, 18.83, 21.883, 24.698, 26.856, 28.656, 30.083, 31.153, 32.042, 32.692, 33.1, 33.317, 33.447, 33.289, 32.832, 31.908, 30.733, 29.513, 28.446, 27.72, 27.517]}', '2023-04-22 21:10:00', '2023-04-23 05:10:00'),
('dataFD_6', 'sensorFD2_sound', '{\"values\": [32.06, 35.27, 38.48, 41.93, 45.37, 48.62, 51.53, 53.99, 55.93, 57.34, 58.23, 58.66, 58.74, 58.64, 58.57, 58.77, 59.0, 59.27, 59.58, 60.37, 61.19, 61.65, 61.46, 60.39, 58.33, 55.25, 51.19, 45.42, 38.99, 32.89, 28.02, 25.21, 24.24, 25.19, 27.98, 33.03, 39.3, 45.74, 51.26, 54.72, 56.8, 57.44, 56.69, 54.37, 51.12, 47.66, 44.71, 43.09, 42.26, 42.24, 43.01, 44.68, 46.87, 49.19, 51.2, 52.45, 53.25, 53.57, 53.44, 52.82, 51.9, 50.88, 49.99, 49.48, 49.16, 49.05, 49.13, 49.32, 49.64, 50.08, 50.62, 51.18, 51.89, 52.73, 53.72, 55.16, 56.69, 57.99, 58.81, 58.93, 58.31, 56.93, 54.82, 51.71, 48.12, 44.54, 41.47, 39.4, 38.08, 37.56, 37.8, 38.45, 39.61, 41.26, 43.29, 45.45, 48.17, 51.47, 55.33, 60.22, 65.47, 70.5, 74.74, 77.69, 79.46, 80.0, 79.36, 77.49, 74.83, 71.9, 69.25, 67.52, 66.22, 65.37, 64.96, 64.92, 65.17, 65.58, 65.99, 66.2]}', '2023-04-22 21:10:00', '2023-04-23 05:10:00'),
('dataFD_7', 'sensorFD3_temp', '{\"values\": [37.158, 37.244, 37.331, 37.429, 37.527, 37.615, 37.688, 37.738, 37.764, 37.765, 37.741, 37.689, 37.621, 37.549, 37.486, 37.446, 37.419, 37.407, 37.408, 37.424, 37.449, 37.477, 37.499, 37.509, 37.511, 37.506, 37.493, 37.471, 37.444, 37.416, 37.392, 37.375, 37.363, 37.357, 37.355, 37.361, 37.37, 37.378, 37.383, 37.38, 37.372, 37.357, 37.337, 37.308, 37.275, 37.243, 37.215, 37.196, 37.184, 37.179, 37.182, 37.191, 37.204, 37.22, 37.235, 37.246, 37.256, 37.265, 37.272, 37.277, 37.281, 37.286, 37.294, 37.306, 37.323, 37.343, 37.369, 37.4, 37.433, 37.467, 37.498, 37.523, 37.543, 37.559, 37.571, 37.58, 37.586, 37.59, 37.591, 37.591, 37.587, 37.581, 37.57, 37.555, 37.537, 37.519, 37.505, 37.496, 37.491, 37.491, 37.496, 37.509, 37.525, 37.538, 37.545, 37.54, 37.525, 37.498, 37.461, 37.408, 37.348, 37.289, 37.24, 37.21, 37.194, 37.195, 37.21, 37.243, 37.285, 37.33, 37.371, 37.397, 37.416, 37.427, 37.429, 37.424, 37.416, 37.406, 37.398, 37.397]}', '2023-04-22 21:10:00', '2023-04-23 05:10:00'),
('dataFD_8', 'sensorFD4_heart', '{\"values\": [32.2, 33.4, 34.5, 35.8, 37.0, 38.2, 39.3, 40.3, 41.2, 42.0, 42.7, 43.2, 43.7, 44.1, 44.6, 45.2, 45.9, 46.6, 47.3, 48.1, 49.0, 49.9, 50.8, 51.7, 52.6, 53.7, 54.7, 55.9, 57.0, 58.2, 59.3, 60.2, 61.1, 61.9, 62.6, 63.6, 64.6, 65.2, 65.0, 64.0, 61.8, 58.6, 54.2, 48.1, 41.2, 34.6, 29.3, 26.1, 24.9, 25.6, 28.3, 33.3, 39.6, 46.0, 51.3, 54.4, 55.9, 55.7, 53.9, 50.2, 45.5, 40.6, 36.4, 33.9, 32.5, 32.2, 33.0, 35.0, 37.7, 40.7, 43.4, 45.2, 46.6, 47.5, 48.0, 47.8, 47.4, 47.0, 46.9, 47.6, 48.7, 50.5, 52.7, 56.1, 59.7, 63.1, 65.7, 66.9, 66.9, 65.5, 62.9, 58.8, 53.8, 48.7, 44.2, 40.9, 38.5, 37.0, 36.3, 36.3, 36.8, 37.7, 38.7, 39.4, 40.2, 41.2, 42.2, 43.7, 45.2, 46.6, 47.5, 47.7, 47.3, 46.3, 44.1, 41.4, 38.6, 36.2, 34.5, 34.0]}', '2023-04-22 21:10:00', '2023-04-23 05:10:00'),
('dataFD_9', 'sensorFD1_hum', '{\"values\": [16.7, 17.789, 18.878, 20.159, 21.44, 22.564, 23.409, 23.888, 23.95, 23.575, 22.783, 21.432, 19.803, 18.174, 16.825, 16.035, 15.664, 15.731, 16.218, 16.79, 17.642, 18.882, 20.533, 22.53, 25.143, 28.398, 32.269, 37.32, 42.783, 47.951, 52.186, 54.913, 56.241, 56.111, 54.58, 51.44, 47.367, 43.084, 39.36, 37.012, 35.504, 34.87, 35.076, 36.116, 37.716, 39.549, 41.236, 42.346, 43.239, 43.903, 44.349, 44.905, 45.315, 45.396, 45.039, 44.205, 42.713, 40.534, 37.697, 33.655, 29.173, 24.959, 21.661, 19.868, 19.449, 20.461, 22.848, 27.151, 32.37, 37.52, 41.631, 43.748, 44.307, 43.243, 40.62, 36.174, 30.689, 24.996, 19.97, 16.534, 14.1, 12.709, 12.319, 12.902, 14.152, 15.699, 17.105, 17.868, 18.421, 18.755, 18.878, 18.85, 18.682, 18.407, 18.084, 17.794, 17.431, 16.993, 16.481, 15.646, 14.763, 14.065, 13.744, 13.951, 14.724, 16.086, 18.014, 20.775, 23.913, 26.986, 29.568, 31.245, 32.185, 32.357, 31.54, 30.077, 28.329, 26.671, 25.496, 25.209]}', '2023-04-21 22:10:00', '2023-04-22 06:10:00'),
('dataHumid1', 'sensor9', '{\"values\": [50, 45, 46, 48, 47, 50, 55, 52, 58, 60], \"unit\": \"%\"}', '2022-03-01 09:00:00', '2022-03-01 09:10:00'),
('dataHumid2', 'sensor9', '{\"values\": [55, 50, 52, 53, 56, 58, 60, 59, 63, 62], \"unit\": \"%\"}', '2022-03-01 09:10:00', '2022-03-01 09:20:00'),
('dataHumid3', 'sensor9', '{\"values\": [61, 65, 63, 68, 70, 69, 72, 71, 70, 68], \"unit\": \"%\"}', '2022-03-01 09:20:00', '2022-03-01 09:30:00'),
('dataTemp1', 'sensor10', '{\"values\": [22.3, 22.5, 23.1, 23.6, 23.9, 23.7, 23.2, 22.8, 22.5, 22.2], \"unit\": \"C\"}', '2022-03-01 09:00:00', '2022-03-01 09:10:00'),
('dataTemp2', 'sensor10', '{\"values\": [22.2, 22.1, 22.5, 23.1, 23.5, 23.9, 24.0, 23.8, 23.5, 23.1], \"unit\": \"C\"}', '2022-03-01 09:10:00', '2022-03-01 09:20:00'),
('dataTemp3', 'sensor10', '{\"values\": [23.1, 23.4, 23.8, 23.9, 24.1, 23.9, 23.4, 23.0, 22.6, 22.3], \"unit\": \"C\"}', '2022-03-01 09:20:00', '2022-03-01 09:30:00'),
('heart1', 'sensor6', '{\"values\":[76, 79, 81, 83, 80, 76, 72, 69]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('heart2', 'sensor6', '{\"values\":[64, 67, 71, 73, 70, 67, 63, 60]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('heart3', 'sensor6', '{\"values\":[82, 85, 87, 89, 86, 82, 78, 75]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('heart4', 'sensor6', '{\"values\":[91, 94, 96, 98, 95, 91, 87, 84]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('heart5', 'sensor6', '{\"values\":[62, 65, 68, 70, 67, 63, 60, 57]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('humidity1', 'sensor7', '{\"values\":[56, 53, 50, 49, 52, 55, 58, 61]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('humidity2', 'sensor7', '{\"values\":[63, 60, 57, 55, 58, 61, 64, 67]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('humidity3', 'sensor7', '{\"values\":[48, 45, 42, 40, 43, 46, 49, 52]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('humidity4', 'sensor7', '{\"values\":[70, 67, 64, 62, 65, 68, 71, 74]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('humidity5', 'sensor7', '{\"values\":[38, 35, 32, 30, 33, 36, 39, 42]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('temp1', 'sensor5', '{\"values\":[23.5, 23.8, 24.1, 24.2, 23.9, 23.6, 23.2, 22.9]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('temp2', 'sensor5', '{\"values\":[22.1, 22.4, 22.7, 22.9, 22.6, 22.3, 22.1, 21.9]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('temp3', 'sensor5', '{\"values\":[20.2, 20.6, 21.0, 21.3, 21.1, 20.8, 20.5, 20.2]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('temp4', 'sensor5', '{\"values\":[17.8, 18.1, 18.5, 18.8, 18.6, 18.2, 17.9, 17.6]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10'),
('temp5', 'sensor5', '{\"values\":[19.3, 19.7, 20.1, 20.3, 20.0, 19.6, 19.3, 19.0]}', '2022-01-01 11:00:00', '2022-01-01 11:00:10');

-- --------------------------------------------------------

--
-- Structure de la table `faq`
--

CREATE TABLE `faq` (
  `id_question` int(31) NOT NULL,
  `fr_question` text NOT NULL,
  `fr_response` text NOT NULL,
  `us_question` text NOT NULL,
  `us_response` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `faq`
--

INSERT INTO `faq` (`id_question`, `fr_question`, `fr_response`, `us_question`, `us_response`) VALUES
(1, 'Combien de temps dois-je dormir chaque nuit ?', 'Les adultes devraient viser à dormir environ 7 à 8 heures chaque nuit.', 'How long should I sleep each night?', 'Adults should aim to sleep around 7-8 hours each night.'),
(2, 'Est-il normal de se réveiller plusieurs fois la nuit ?', 'Il est normal de se réveiller brièvement plusieurs fois par nuit, mais si vous avez du mal à vous rendormir, cela peut indiquer un problème de sommeil.', 'Is it normal to wake up several times during the night?', 'It is normal to wake up briefly several times a night, but if you have trouble getting back to sleep, it may indicate a sleep problem.'),
(3, 'Comment puis-je améliorer la qualité de mon sommeil ?', 'Vous pouvez améliorer la qualité de votre sommeil en suivant une routine de sommeil régulière, en créant un environnement de sommeil calme et confortable, en évitant les écrans avant de dormir et en faisant de lexercice régulièrement.', 'How can I improve the quality of my sleep?', 'You can improve the quality of your sleep by following a regular sleep routine, creating a calm and comfortable sleeping environment, avoiding screens before sleeping and exercising regularly.'),
(4, 'Est-ce que la sieste est bénéfique pour la santé ?', 'Les siestes peuvent être bénéfiques pour la santé si elles sont courtes et bien chronométrées, mais des siestes trop longues ou trop fréquentes peuvent interférer avec le sommeil nocturne.', 'Is napping beneficial to health?', 'Naps can be beneficial to health if they are short and well timed, but naps that are too long or too frequent can interfere with nighttime sleep.'),
(5, 'Comment puis-je savoir si jai un trouble du sommeil ?', 'Si vous avez des difficultés à vous endormir, à rester endormi ou si vous vous réveillez fatigué malgré une nuit de sommeil complète, vous pourriez avoir un trouble du sommeil. Parlez-en à votre médecin si vous êtes préoccupé par la qualité de votre sommeil.', 'Is napping beneficial to health?', 'Naps can be beneficial to health if they are short and well timed, but naps that are too long or too frequent can interfere with nighttime sleep.'),
(6, 'Comment puis-je améliorer la qualité de mon sommeil ?', 'Il existe plusieurs façons d\'améliorer la qualité de votre sommeil, notamment en créant une routine de sommeil régulière, en limitant la consommation de caféine et d\'alcool, en évitant les écrans avant le coucher, en créant un environnement de sommeil confortable et en pratiquant la relaxation.', 'How can I improve the quality of my sleep?', 'There are many ways to improve the quality of your sleep, including creating a regular sleep routine, limiting caffeine and alcohol intake, avoiding screens before bedtime, creating a comfortable sleep environment and practicing relaxation.'),
(7, 'Combien d\'heures de sommeil devrais-je avoir chaque nuit ?', 'La quantité de sommeil dont vous avez besoin dépend de votre âge et de votre style de vie. En général, les adultes ont besoin de 7 à 9 heures de sommeil chaque nuit pour se sentir reposés et alertes.', 'How many hours of sleep should I get each night?', 'The amount of sleep you need depends on your age and lifestyle. In general, adults need 7-9 hours of sleep every night to feel rested and alert.'),
(8, 'Comment puis-je savoir si j\'ai un trouble du sommeil ?', 'Les troubles du sommeil peuvent être diagnostiqués par un professionnel de la santé. Si vous avez des difficultés à vous endormir, à rester endormi ou si vous vous réveillez fatigué, vous pourriez avoir un trouble du sommeil. Parlez-en à votre médecin si vous êtes préoccupé par votre sommeil.', 'How do I know if I have a sleep disorder?', 'Sleep disorders can be diagnosed by a medical professional. If you have difficulty falling asleep, staying asleep, or waking up tired , you may have a sleep disorder. Speak to your doctor if you are concerned about your sleep.'),
(9, 'Les somnifères sont-ils une solution sûre pour les problèmes de sommeil ?', 'Les somnifères peuvent aider à traiter les problèmes de sommeil à court terme, mais ils ne sont généralement pas recommandés pour une utilisation à long terme car ils peuvent causer des effets secondaires et des problèmes de dépendance.', 'Are sleeping pills a safe solution for sleep problems?', 'Sleeping pills can help with short-term sleep problems, but they are generally not recommended for long-term use because they can cause side effects and addiction issues.'),
(10, 'Le ronflement est-il un signe de trouble du sommeil ?', 'Le ronflement peut être un signe de trouble du sommeil, notamment de l\'apnée du sommeil. Si vous ronflez régulièrement ou si vous vous réveillez souvent fatigué, vous pourriez avoir un trouble du sommeil. Parlez-en à votre médecin si vous êtes préoccupé par votre sommeil.', 'Is snoring a sign of a sleep disorder?', 'Snoring can be a sign of a sleep disorder, including sleep apnea. If you snore regularly or often wake up tired, you may have a sleep disorder. Talk to your doctor if you are concerned about your sleep.');

-- --------------------------------------------------------

--
-- Structure de la table `sensor`
--

CREATE TABLE `sensor` (
  `id_sensor` varchar(31) NOT NULL,
  `id_Box` varchar(31) DEFAULT NULL,
  `typeSensor` enum('temperatureSensor','heartSensor','humiditySensor','soundSensor') NOT NULL,
  `isUsed` tinyint(1) DEFAULT 1,
  `isNotBroken` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `sensor`
--

INSERT INTO `sensor` (`id_sensor`, `id_Box`, `typeSensor`, `isUsed`, `isNotBroken`) VALUES
('02', 'boitier_reel', 'temperatureSensor', 1, 1),
('03', 'boitier_reel', 'humiditySensor', 1, 1),
('04', 'boitier_reel', 'soundSensor', 1, 1),
('05', 'boitier_reel', 'heartSensor', 1, 1),
('1', NULL, 'temperatureSensor', 1, 1),
('A1', 'BoxA', 'temperatureSensor', 1, 1),
('A2', 'BoxA', 'humiditySensor', 0, 1),
('A3', 'BoxA', 'soundSensor', 1, 1),
('A4', NULL, 'heartSensor', 1, 1),
('sensor1', 'box1', 'temperatureSensor', 1, 1),
('sensor10', 'box5', 'heartSensor', 1, 1),
('sensor2', 'box1', 'heartSensor', 1, 1),
('sensor3', 'box2', 'humiditySensor', 1, 1),
('sensor31', 'box6', 'temperatureSensor', 1, 1),
('sensor32', 'box6', 'heartSensor', 1, 1),
('sensor33', 'box6', 'humiditySensor', 1, 1),
('sensor34', 'box7', 'temperatureSensor', 1, 1),
('sensor35', 'box7', 'heartSensor', 1, 1),
('sensor36', 'box7', 'humiditySensor', 1, 1),
('sensor37', 'box8', 'temperatureSensor', 1, 1),
('sensor38', 'box8', 'heartSensor', 1, 1),
('sensor39', 'box8', 'humiditySensor', 1, 1),
('sensor4', 'box2', 'soundSensor', 1, 1),
('sensor40', 'box9', 'temperatureSensor', 1, 1),
('sensor41', 'box9', 'heartSensor', 1, 1),
('sensor42', 'box9', 'humiditySensor', 1, 1),
('sensor43', 'box10', 'temperatureSensor', 1, 1),
('sensor44', 'box10', 'heartSensor', 1, 1),
('sensor45', 'box10', 'humiditySensor', 1, 1),
('sensor46', 'f1', 'heartSensor', 1, 1),
('sensor47', 'client', 'humiditySensor', 1, 1),
('sensor48', NULL, 'soundSensor', 1, 1),
('sensor49', 'box16', 'temperatureSensor', 1, 1),
('sensor5', 'box3', 'temperatureSensor', 1, 1),
('sensor50', 'box16', 'heartSensor', 1, 1),
('sensor51', 'box16', 'humiditySensor', 1, 1),
('sensor52', 'box17', 'soundSensor', 1, 1),
('sensor53', 'box17', 'temperatureSensor', 1, 1),
('sensor54', 'box17', 'heartSensor', 1, 1),
('sensor55', 'box18', 'humiditySensor', 1, 1),
('sensor56', 'box18', 'soundSensor', 1, 1),
('sensor57', 'box18', 'temperatureSensor', 1, 1),
('sensor58', 'box19', 'heartSensor', 1, 1),
('sensor59', 'box19', 'humiditySensor', 1, 1),
('sensor6', 'box3', 'heartSensor', 1, 1),
('sensor60', 'box19', 'soundSensor', 1, 1),
('sensor61', 'box12', 'humiditySensor', 1, 1),
('sensor62', 'box12', 'soundSensor', 1, 1),
('sensor63', 'box13', 'temperatureSensor', 1, 1),
('sensor64', 'box13', 'heartSensor', 1, 1),
('sensor65', 'box13', 'humiditySensor', 1, 1),
('sensor66', 'f1', 'soundSensor', 1, 1),
('sensor7', 'box4', 'humiditySensor', 1, 1),
('sensor70', 'box16', 'soundSensor', 1, 1),
('sensor8', 'box4', 'soundSensor', 1, 1),
('sensor89', 'box20', 'humiditySensor', 1, 1),
('sensor9', 'box5', 'temperatureSensor', 1, 1),
('sensor91', 'client', 'temperatureSensor', 1, 1),
('sensor94', NULL, 'soundSensor', 1, 1),
('sensor96', 'client', 'heartSensor', 1, 1),
('sensor98', 'client', 'soundSensor', 1, 1),
('sensor99', NULL, 'temperatureSensor', 1, 1),
('sensorFD1_hum', 'boxFaresData', 'humiditySensor', 1, 1),
('sensorFD2_sound', 'boxFaresData', 'soundSensor', 1, 1),
('sensorFD3_temp', 'boxFaresData', 'temperatureSensor', 1, 1),
('sensorFD4_heart', 'boxFaresData', 'heartSensor', 1, 1),
('sensor_c2', NULL, 'heartSensor', 1, 1),
('sensor_c3', NULL, 'heartSensor', 1, 1),
('sensor_h2', 'f1', 'humiditySensor', 1, 1),
('sensor_h3', NULL, 'humiditySensor', 1, 1),
('sensor_s2', 'ggg', 'soundSensor', 1, 1),
('sensor_s3', NULL, 'soundSensor', 1, 1),
('sensor_t', 'f1', 'temperatureSensor', 1, 1),
('sensor_t2', NULL, 'temperatureSensor', 1, 1),
('sensor_t3', NULL, 'temperatureSensor', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sensorbox`
--

CREATE TABLE `sensorbox` (
  `id_Box` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `sensorbox`
--

INSERT INTO `sensorbox` (`id_Box`) VALUES
('alpha'),
('beta'),
('boitier_reel'),
('box1'),
('box10'),
('box11'),
('box12'),
('box12345'),
('box13'),
('box14'),
('box15'),
('box16'),
('box17'),
('box18'),
('box19'),
('box2'),
('box20'),
('box3'),
('box4'),
('box5'),
('box6'),
('box7'),
('box8'),
('box9'),
('BoxA'),
('boxFaresData'),
('client'),
('dispo1'),
('dispo2'),
('dispo3'),
('dispo4'),
('dispo5'),
('dispo6'),
('f1'),
('gama'),
('ggg'),
('hello'),
('pra');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(31) UNSIGNED NOT NULL,
  `typeUser` enum('User','Modo','Admin') NOT NULL,
  `photo` longblob DEFAULT NULL,
  `firstName` varchar(31) NOT NULL,
  `lastName` varchar(31) NOT NULL,
  `birthday` date NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `mail` varchar(63) NOT NULL,
  `password` varchar(127) NOT NULL,
  `country` varchar(31) NOT NULL,
  `city` varchar(31) NOT NULL,
  `codePostal` varchar(15) DEFAULT NULL,
  `address` varchar(63) NOT NULL,
  `id_Box` varchar(31) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `typeUser`, `photo`, `firstName`, `lastName`, `birthday`, `phoneNumber`, `mail`, `password`, `country`, `city`, `codePostal`, `address`, `id_Box`, `token`) VALUES
(1, 'User', NULL, 'Jean', 'Bon', '1984-04-12', '147258369', 'jeanbon@yahoo.fr', '6b3c7b317577d3f3ab699e58dbf1113d40a385b5', 'France', 'Toulouse', NULL, 'avenue de la boucherie', NULL, NULL),
(2, 'Admin', NULL, 'admin', 'thebest', '2000-01-01', '+33 7123456789', 'adminthebest@gmail.com', '6392cc0d54ad43e1b498099b3fdd4ccdf88ab62d', 'France', '75011', 'Paris', 'ISEP', NULL, NULL),
(3, 'Modo', NULL, 'modo', 'theworth', '2023-03-14', '666666666', 'modothwoth@yahoo.fr', '603fa57ffcf1b00675625fe58fd7ec36435bbd8f', 'France', 'Perpignan', NULL, 'à la rue', NULL, NULL),
(4, 'User', NULL, 'pin', 'pon', '1945-06-04', '1418118112', 'pinpon@lespompiers.fr', '08c72ee10817767b869c8212858e7f6840959631', 'US', 'New York', NULL, 'wall street', NULL, NULL),
(5, 'User', NULL, 'bob', 'leponge', '2015-03-10', '789456123', 'bobleponge@lamere.fr', 'f28aca479f6ee906ce2a73fc2ef6e0f006da1f42', 'UK', 'london', NULL, 'bridge', NULL, NULL),
(6, 'User', NULL, 'John', 'Doe', '1990-01-01', '0612345678', 'john.doe@mail.com', 'M0tD3P@ss3', 'France', 'Paris', '75008', '10 rue de la Paix', 'box1', NULL),
(8, 'Modo', NULL, 'Bob', 'Smith', '1985-05-12', '0634564890', 'bob.smith@mail.com', 'Secur3P@ss', 'USA', 'New York', NULL, '123 Main St', NULL, NULL),
(9, 'Admin', NULL, 'Alice', 'Brown', '1980-07-04', '0645178901', 'alice.brown@mail.com', 'Adm1nP@ss', 'Canada', 'Toronto', NULL, '1 Yonge St', NULL, NULL),
(10, 'User', NULL, 'Tom', 'Wilson', '2000-10-22', '0656789712', 'tom.wilson@mail.com', 'T0mmyP@ss', 'Australia', 'Sydney', NULL, '42 Wallaby Way', 'box3', NULL),
(11, 'User', NULL, 'Bob', 'Smith', '1985-07-20', '+44 1234 567890', 'bob.smith@example.com', 'password789', 'UK', 'London', 'SW1A 1AA', '10 Downing Street', NULL, NULL),
(12, 'User', NULL, 'Alice', 'Johnson', '2000-11-30', '+1 555-123-4567', 'alice.johnson@example.com', 'passwordABC', 'USA', 'New York', '10001', '123 Main St', 'box4', NULL),
(13, 'User', NULL, 'Mike', 'Lee', '1992-05-12', '+81 3-1234-5678', 'mike.lee@example.com', 'passwordDEF', 'Japan', 'Tokyo', '105-0011', '1-1 Chiyoda', 'box5', NULL),
(14, 'Modo', NULL, 'Sarah', 'Taylor', '1980-09-25', '+44 7911 123456', 'sarah.taylor@example.com', 'passwordGHI', 'UK', 'Manchester', 'M1 3BN', '5 Oxford Road', NULL, NULL),
(15, 'Modo', NULL, 'David', 'Clark', '1975-02-18', '+1 555-456-7890', 'david.clark@example.com', 'passwordJKL', 'USA', 'San Francisco', '94102', '123 Main St', NULL, NULL),
(16, 'Admin', NULL, 'Olivia', 'Martin', '1982-11-10', '+33 6 34 56 78 90', 'olivia.martin@example.com', 'passwordMNO', 'France', 'Lille', '59000', '10 Rue des Fleurs', NULL, NULL),
(17, 'Admin', NULL, 'William', 'Harris', '1978-08-08', '+44 20 7123 4567', 'william.harris@example.com', 'passwordPQR', 'UK', 'Edinburgh', 'EH1 1YZ', '10 High Street', NULL, NULL),
(18, 'User', NULL, 'Sophie', 'Baker', '1999-04-05', '+1 555-789-0123', 'sophie.baker@example.com', 'passwordSTU', 'USA', 'Chicago', '60601', '456 Elm St', 'box6', NULL),
(19, 'User', NULL, 'Pierre', 'Durand', '1995-07-15', '0602030405', 'pierre.durand@gmail.com', 'mypassword', 'France', 'Paris', '75001', '1 rue de la Paix', 'box7', NULL),
(20, 'User', NULL, 'Sophie', 'Dupont', '1989-04-30', '0612345648', 'sophie.dupont@gmail.com', 'mypassword', 'France', 'Lyon', '69001', '5 avenue des Fleurs', 'box8', NULL),
(21, 'Modo', NULL, 'Lucie', 'Martin', '1993-11-22', '0634567890', 'lucie.martin@gmail.com', 'mypassword', 'France', 'Marseille', '13001', '7 rue de la Liberté', NULL, NULL),
(22, 'User', NULL, 'Maxime', 'Girard', '1990-08-08', '0645678901', 'maxime.girard@gmail.com', 'mypassword', 'France', 'Lille', '59000', '2 place de la Gare', 'box9', NULL),
(23, 'User', NULL, 'Marie', 'Lefebvre', '1998-01-20', '0656789012', 'marie.lefebvre@gmail.com', 'mypassword', 'France', 'Nantes', '44000', '10 rue des Lilas', 'box10', NULL),
(24, 'Admin', NULL, 'Thomas', 'Lambert', '1985-06-10', '0667890123', 'thomas.lambert@gmail.com', 'mypassword', 'France', 'Toulouse', '31000', '15 avenue du Soleil', NULL, NULL),
(25, 'User', NULL, 'Amélie', 'Roux', '1987-09-12', '0678901234', 'amelie.roux@gmail.com', 'mypassword', 'France', 'Bordeaux', '33000', '9 rue du Château', NULL, NULL),
(26, 'Modo', NULL, 'Antoine', 'Fournier', '1994-12-05', '0689012345', 'antoine.fournier@gmail.com', 'mypassword', 'France', 'Strasbourg', '67000', '3 avenue de la Gare', NULL, NULL),
(27, 'User', NULL, 'Mathilde', 'Mercier', '1988-03-18', '0690123456', 'mathilde.mercier@gmail.com', 'mypassword', 'France', 'Lyon', '69002', '12 rue des Roses', NULL, NULL),
(28, 'User', NULL, 'François', 'Bertrand', '1999-02-03', '0612345578', 'francois.bertrand@gmail.com', 'mypassword', 'France', 'Paris', '75002', '8 rue des Lilas', 'box11', NULL),
(30, 'User', NULL, 'Carla', 'Perez', '1998-03-24', '+33624781523', 'carla.perez@gmail.com', 'hash123', 'France', 'Paris', '75008', '10 rue de la Paix', 'box12', NULL),
(31, 'User', NULL, 'Martin', 'Duval', '2002-11-02', '+33659547852', 'martin.duval@gmail.com', 'hash123', 'France', 'Lyon', '69007', '2 rue des Roses', 'box13', NULL),
(32, 'Modo', NULL, 'Julie', 'Lefebvre', '1989-08-14', '+33652741963', 'julie.lefebvre@gmail.com', 'hash123', 'France', 'Marseille', '13001', '25 avenue des Fleurs', NULL, NULL),
(33, 'User', NULL, 'Lena', 'Deschamps', '1995-06-08', '+33658214796', 'lena.deschamps@gmail.com', 'hash123', 'France', 'Toulouse', '31000', '45 rue des Lilas', 'box14', NULL),
(34, 'User', NULL, 'Alexandre', 'Girard', '2000-09-30', '+33695274185', 'alexandre.girard@gmail.com', 'hash123', 'France', 'Lille', '59000', '7 rue du Pont', 'box15', NULL),
(35, 'Admin', NULL, 'Marie', 'Rousseau', '1990-12-19', '+33674582145', 'marie.rousseau@gmail.com', 'hash123', 'France', 'Bordeaux', '33000', '15 avenue du Lac', NULL, NULL),
(36, 'User', NULL, 'Jules', 'Lecomte', '1997-02-28', '+33693571208', 'jules.lecomte@gmail.com', 'hash123', 'France', 'Rennes', '35000', '30 boulevard de la Liberté', 'box16', NULL),
(37, 'User', NULL, 'Chloé', 'Gautier', '2001-05-11', '+33635478696', 'chloe.gautier@gmail.com', 'hash123', 'France', 'Nice', '6000', '12 rue de la Mer', NULL, NULL),
(38, 'Modo', NULL, 'Nicolas', 'Dupont', '1992-09-22', '+33658742139', 'nicolas.dupont@gmail.com', 'hash123', 'France', 'Lyon', '69002', '8 avenue des Saules', NULL, NULL),
(39, 'User', NULL, 'Sophie', 'Laurent', '1996-11-16', '+33695637852', 'sophie.laurent@gmail.com', 'azsdfghu', 'France', 'Marseille', '13006', '21 avenue de la Plage', 'box17', NULL),
(100, 'User', NULL, 'Fares', 'fgnvnb', '2002-01-02', '+33767970763', 'faresdata.yessir@yahoo.fr', 'f13b8d6e8a6815e2376639503d9ce8ecc7203fa6', 'France', 'Paris', '75017', 'Avenue de la grand armée', 'boxFaresData', NULL),
(237, 'User', NULL, 'Fares', 'Maiza', '2023-06-02', '582828', 'maiza.fares01@gmail.com', '194866575b79938d3d70a941d891edbb77d6582c', 'France', 'Paris', '75001', 'Rue', 'f1', '648c665836df3'),
(243, 'User', NULL, 'person', 'real', '2001-11-11', '56897878', 'mini.maiza1@gmail.com', 'ded4c15afb2f487713ef06402fdaef6d68928bda', 'Ile du bonheur', 'Woippy', '25634', '2 rue de la chèvre', 'boitier_reel', '6491b7b8bafa1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `datasensor`
--
ALTER TABLE `datasensor`
  ADD PRIMARY KEY (`id_data`),
  ADD KEY `id_sensor` (`id_sensor`);

--
-- Index pour la table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id_question`);

--
-- Index pour la table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id_sensor`),
  ADD UNIQUE KEY `id_Box` (`id_Box`,`typeSensor`);

--
-- Index pour la table `sensorbox`
--
ALTER TABLE `sensorbox`
  ADD PRIMARY KEY (`id_Box`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `phoneNumber` (`phoneNumber`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `id_Box` (`id_Box`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `faq`
--
ALTER TABLE `faq`
  MODIFY `id_question` int(31) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(31) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `datasensor`
--
ALTER TABLE `datasensor`
  ADD CONSTRAINT `datasensor_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id_sensor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`id_Box`) REFERENCES `sensorbox` (`id_Box`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_Box`) REFERENCES `sensorbox` (`id_Box`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
