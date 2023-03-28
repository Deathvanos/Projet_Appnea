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
(5, 'User', 'bob', 'leponge', '2015-03-10', '789456123', 'bobleponge@lamere.fr', 'bob123ABC!!!', 'UK', 'london', 'bridge'),
(6, 'User', 'henry', 'dupon', '1999-07-02', '0607080945', 'henrydupon@gmail.com', 'Az3rt!poiu', 'FR', 'Rouen', '5 rue royal'),
(7, 'Admin', 'charlotte', 'dubois', '1980-10-25', '0033123456789', 'charlottedubois@hotmail.com', 'Admin1234!@#$%^&', 'FR', 'Lyon', '2 avenue de la paix'),
(8, 'Modo', 'luc', 'martin', '1995-03-08', '0678945612', 'lucmartin@gmail.com', 'Modo1234!@#$%^&', 'FR', 'Marseille', '14 rue des champs'),
(9, 'User', 'marie', 'claire', '1988-12-19', '0601020304', 'marieclaire@yahoo.com', 'User1234!@#$%^&', 'FR', 'Nantes', '25 avenue des fleurs'),
(10, 'User', 'pierre', 'moreau', '1979-06-30', '0654321098', 'pierremoreau@gmail.com', 'User1234!@#$%^&', 'FR', 'Clermont-ferrand', '17 boulevard du port'),
(11, 'User', 'laure', 'leclerc', '1992-04-11', '0647895632', 'laureleclerc@hotmail.com', 'User1234!@#$%^&', 'FR', 'Strasbourg', '8 rue des alouettes'),
(12, 'Admin', 'alexandre', 'clement', '1975-01-15', '0678563412', 'alexandreclement@gmail.com', 'Admin1234!@#$%^&', 'FR', 'Rennes', '12 rue du château'),
(13, 'Admin', 'Lucie', 'Girard', '1985-06-15', '+33 612345678', 'luciegirard@hotmail.com', 'admin123AZERTY!', 'France', 'Marseille', 'Boulevard des Anglais'),
(14, 'User', 'olivier', 'robert', '1990-11-06', '0623456789', 'olivierrobert@gmail.com', 'User1234!@#$%^&', 'FR', 'Bordeaux', '22 rue de la paix'),
(15, 'User', 'catherine', 'lemoine', '1983-09-20', '0657845123', 'catherinelemoine@yahoo.com', 'User1234!@#$%^&', 'FR', 'Nice', '9 rue de la gare'),
(16, 'User', 'marc', 'dubois', '1987-07-17', '0689745632', 'marcdubois@hotmail.com', 'User1234!@#$%^&', 'FR', 'Lyon', '6 avenue des étoiles'),
(17, 'User', 'Marie', 'Lemaire', '1993-07-11', '+33 6600112233', 'marielemaire@gmail.com', 'mdpMarie123!', 'France', 'Bordeaux', 'Cours du Médoc'),
(18, 'User', 'Philippe', 'Lacroix', '1980-12-05', '0678451297', 'philippelacroix@hotmail.com', 'Azerty456!mdp', 'France', 'Strasbourg', 'Rue des Fleurs'),
(19, 'Modo', 'Baptiste', 'Lefebvre', '1992-01-19', '+33 786543219', 'baptistelefebvre@yahoo.fr', 'mdpBaptiste123!', 'France', 'Montpellier', 'Avenue des Platanes'),
(20, 'User', 'Julie', 'Martin', '1995-09-15', '0656849258', 'julie.martin@gmail.com', 'julie123ABC!!!', 'France', 'Marseille', 'Rue du Paradis'),
(21, 'User', 'Kevin', 'Garnier', '2000-12-25', '+33 612345678', 'kevin.garnier@orange.fr', 'kevin123ABC!!!', 'France', 'Bordeaux', 'Rue de la Victoire'),
(22, 'User', 'Laure', 'Lefevre', '1998-05-12', '0658748965', 'laure.lefevre@yahoo.fr', 'laure123ABC!!!', 'France', 'Lyon', 'Boulevard des Belges'),
(23, 'User', 'Olivier', 'Roux', '1986-08-30', '+33 659874123', 'olivier.roux@hotmail.com', 'olivier123ABC!!!', 'France', 'Nice', 'Avenue Jean Médecin'),
(24, 'User', 'Emilie', 'Cohen', '1992-11-18', '+33 678945612', 'emilie.cohen@gmail.com', 'emilie123ABC!!!', 'France', 'Toulon', 'Place de la Liberté'),
(25, 'User', 'Léo', 'Gauthier', '1999-03-22', '0645879852', 'leo.gauthier@free.fr', 'leo123ABC!!!', 'France', 'Rennes', 'Rue de la Poterie'),
(26, 'User', 'Sophie', 'Dumont', '1990-07-07', '0601020304', 'sophie.dumont@hotmail.com', 'sophie123ABC!!!', 'France', 'Strasbourg', 'Place de la Cathédrale'),
(27, 'User', 'Romain', 'Marchand', '1994-12-05', '+33 698745231', 'romain.marchand@gmail.com', 'romain123ABC!!!', 'France', 'Montpellier', 'Rue Foch'),
(28, 'User', 'Mélanie', 'Leroy', '1985-06-19', '+33 644789123', 'melanie.leroy@laposte.net', 'melanie123ABC!!!', 'France', 'Limoges', 'Rue de la Boucherie'),
(29, 'User', 'Paul', 'André', '1997-02-28', '0601010101', 'paul.andre@yahoo.fr', 'paul123ABC!!!', 'France', 'Lille', 'Rue de Paris'),
(30, 'User', 'Julie', 'Lefebvre', '1998-02-23', '0601020304', 'julie.lefebvre@gmail.com', 'password123', 'France', 'Lyon', '3 rue de la Liberté'),
(31, 'Modo', 'Jérôme', 'Dubois', '1987-09-10', '0645367849', 'j.dubois@hotmail.fr', 'MotDePasse123', 'France', 'Marseille', '15 avenue du Vieux-Port'),
(32, 'User', 'Lucas', 'Durand', '2001-11-27', '0645382915', 'lucas.durand@outlook.fr', 'PassWord12#', 'France', 'Lille', '7 avenue des Lilas'),
(33, 'User', 'Sophie', 'Martin', '1995-07-31', '0612345678', 'sophie.martin@gmail.com', 'azerty1234', 'France', 'Bordeaux', '42 rue Sainte-Catherine'),
(34, 'Admin', 'Hugo', 'Roux', '1980-12-15', '0645789263', 'hugo.roux@admin.fr', 'Pa$$word123', 'France', 'Toulon', '25 boulevard de la Mer'),
(35, 'User', 'Laura', 'Girard', '2002-05-04', '0657891234', 'laura.girard@gmail.com', '1234abcd!', 'France', 'Nantes', '14 rue du Commerce'),
(36, 'User', 'Nicolas', 'Lemaire', '1997-08-08', '0658732190', 'nicolas.lemaire@gmail.com', 'NicolasLemaire123', 'France', 'Strasbourg', '2 rue des Roses'),
(37, 'User', 'Sylvie', 'Lefort', '1983-04-22', '0687123456', 'sylvie.lefort@hotmail.com', 'SylvieLefort1@', 'France', 'Brest', '8 avenue de la Mer'),
(38, 'Modo', 'Antoine', 'Moulin', '1991-02-14', '0612345678', 'antoine.moulin@outlook.fr', 'azerty123', 'France', 'Tours', '12 rue de la Paix'),
(39, 'User', 'Marie', 'Thibault', '1999-06-12', '0654321098', 'marie.thibault@gmail.com', 'MThibault_12', 'France', 'Rennes', '16 rue de la Liberté'),
(40, 'User', 'Laura', 'Martinez', '1998-10-21', '0666666666', 'laura.martinez@gmail.com', 'Lm@rtinez11', 'Spain', 'Barcelona', 'Plaça de Catalunya'),
(41, 'User', 'Alex', 'Lee', '1987-09-02', '0123456789', 'alex.lee@gmail.com', 'Al3x@l33', 'USA', 'New York', '5th Avenue'),
(42, 'User', 'Marie', 'Dubois', '2000-05-15', '0698745632', 'marie.dubois@hotmail.com', 'M@rieDub0is', 'France', 'Lyon', 'Boulevard des Belges'),
(43, 'User', 'Nina', 'Vasquez', '1995-12-18', '0777777777', 'nina.vasquez@gmail.com', 'Nin@Vasqu3z', 'Mexico', 'Mexico City', 'Avenida de la Reforma'),
(44, 'User', 'Satoshi', 'Nakamoto', '1975-04-05', '0801234567', 'satoshi.nakamoto@gmail.com', 'N@k@moto75', 'Japan', 'Tokyo', 'Roppongi'),
(45, 'User', 'Eva', 'Hernandez', '1989-11-12', '0623456789', 'eva.hernandez@hotmail.com', 'EvaH3rn@ndez', 'Spain', 'Madrid', 'Calle de Alcalá'),
(46, 'User', 'Lucie', 'Martin', '1995-11-27', '0623456789', 'lucie.martin@gmail.com', '3qf4jK#2Gy', 'France', 'Lyon', 'Rue des Roses'),
(47, 'User', 'Marie', 'Dupont', '2001-02-14', '0666666666', 'marie.dupont@hotmail.com', '78Ahjklm#', 'France', 'Marseille', 'Avenue des Oliviers'),
(48, 'User', 'Louis', 'Michel', '1993-07-05', '0606060606', 'louis.michel@outlook.com', '1tGh7JkL$', 'France', 'Rennes', 'Rue de la Paix'),
(49, 'User', 'Sophie', 'Girard', '1988-03-19', '0644444444', 'sophie.girard@yahoo.fr', 'Zx6tN&8dE', 'France', 'Nice', 'Boulevard des Anglais'),
(50, 'User', 'Thomas', 'Robert', '1975-10-22', '0688888888', 'thomas.robert@gmail.com', '9pO5uI#2Fg', 'France', 'Toulon', 'Avenue du Port');
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
