-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 21 mars 2023 à 15:34
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

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
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(128) NOT NULL,
  `typeUser` enum('Admin','Modo','User') NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(32) NOT NULL,
  `birthday` date NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `mail` varchar(128) NOT NULL,
  `H_password` varchar(128) NOT NULL,
  `country` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `localisation` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `typeUser`, `firstName`, `lastName`, `birthday`, `phoneNumber`, `mail`, `H_password`, `country`, `city`, `localisation`) VALUES
(1, 'User', 'Jean', 'Bon', '1984-04-12', '147258369', 'jeanbon@yahoo.fr', 'jeanbon123ABC!!!', 'France', 'Toulouse', 'avenue de la boucherie'),
(2, 'Admin', 'admin', 'thebest', '2000-01-01', '+33 7123456789', 'adminthebest@gmail.com', 'admin123ABC!!!', 'France', 'Paris', 'ISEP'),
(3, 'Modo', 'modo', 'theworth', '2023-03-14', '666666666', 'modothwoth@yahoo.fr', 'modo123ABC!!!', 'France', 'Perpignan', 'à la rue'),
(4, 'User', 'pin', 'pon', '1945-06-04', '1418118112', 'pinpon@lespompiers.fr', 'user123ABC!!!', 'US', 'New York', 'wall street'),
(5, 'User', 'bob', 'leponge', '2015-03-10', '789456123', 'bobleponge@lamere.fr', 'bob123ABC!!!', 'UK', 'london', 'bridge');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
