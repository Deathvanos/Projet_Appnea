-- *******************************************************
-- APP - Projet Système Numérique - Composante Informatique
-- ISEP - A1 - G7C
-- Semestre 2
-- Auteur : - MAILLEY_Charles 
--          - MAIZA_Fares
--          - MARTINEZ_Eliot
--          - PAVIOT-ADET_Flore
--          - SPASOJEVIC_Fanny
--          - VINGADASSAMY_Prasanaa
-- Date de rendu  : 05/06/2023
-- *******************************************************

-- version de phpMyAdmin SQL Dump : 5.2.0
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0


--
-- Base de données : `appnea`
--


-- On peut pas faire les jointures tant que les tables n'ont pas été toutes créée
-- UNSIGNED : seul les nombres >= 0 sont possible


-- ---------------------------------------------------------------------
-- ------------------------- Creation des tables -----------------------
-- ---------------------------------------------------------------------

-- Structure de la table `sensorBox`
CREATE TABLE sensorBox (
  `id_Box` varchar(31) NOT NULL PRIMARY KEY
);


-- Structure de la table `utilisateur`
CREATE TABLE utilisateur (
  `id_utilisateur` int(31) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `typeUser` enum('User','Modo','Admin') NOT NULL,
  `photo` longblob DEFAULT NULL,
  `firstName` varchar(31) NOT NULL,
  `lastName` varchar(31) NOT NULL,
  `birthday` date NOT NULL,
  `phoneNumber` varchar(20) NOT NULL UNIQUE,
  `mail` varchar(63) NOT NULL UNIQUE,
  `password` varchar(127) NOT NULL,
  `country` varchar(31) NOT NULL,
  `city` varchar(31) NOT NULL,
  `codePostal` int(7) DEFAULT NULL,
  `address` varchar(63) NOT NULL,
  `id_Box` VARCHAR(31) DEFAULT NULL UNIQUE,
  FOREIGN KEY (`id_Box`) REFERENCES sensorBox(`id_Box`) ON DELETE SET NULL ON UPDATE CASCADE
);


-- Structure de la table `sensor`
CREATE TABLE sensor (
  `id_sensor` varchar(31) NOT NULL PRIMARY KEY,
  `id_Box` varchar(31) NOT NULL,
  `typeSensor` enum('temperatureSensor','heartSensor','humiditySensor', 'soundSensor') NOT NULL,
  `isUsed` BOOLEAN DEFAULT TRUE,
  `isNotBroken` BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (`id_Box`) REFERENCES sensorbox(`id_Box`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Structure de la table `dataSensor`
CREATE TABLE dataSensor (
  `id_data` VARCHAR(31) NOT NULL PRIMARY KEY,
  `id_sensor` VARCHAR(31) NOT NULL,
  `dataFile` JSON,
  `date_start` TIMESTAMP DEFAULT NOW(),
  `date_end` TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (`id_sensor`) REFERENCES sensor(`id_sensor`) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Structure de la table `FAQ`
CREATE TABLE FAQ (
  `id_question` INT(31) NOT NULL PRIMARY KEY,
  `question` TEXT NOT NULL,
  `response` TEXT NOT NULL
);

-- ---------------------------------------------------------------------
-- -------------------- Déchargement des données -----------------------
-- ---------------------------------------------------------------------

-- ATENTION : on peut assigner une valeur FOREIGN KEY seulement si cette valeur existe dans l'autre table
-- On commence par la table sensorBox car elle ne contient pas de FOREIGN KEY
INSERT INTO sensorBox (id_Box) VALUES
('box1'),
('box2'),
('box3'),
('box4'),
('box5');


INSERT INTO utilisateur (id_utilisateur, typeUser, firstName, lastName, birthday, phoneNumber, mail, password, country, city, address, id_Box) VALUES 
(1, 'User', 'Jean', 'Bon', '1984-04-12', '147258369', 'jeanbon@yahoo.fr', 'jeanbon123ABC!!!', 'France', 'Toulouse', 'avenue de la boucherie', NULL),
(2, 'Admin', 'admin', 'thebest', '2000-01-01', '+33 7123456789', 'adminthebest@gmail.com', 'admin123ABC!!!', 'France', 'Paris', 'ISEP', NULL),
(3, 'Modo', 'modo', 'theworth', '2023-03-14', '666666666', 'modothwoth@yahoo.fr', 'modo123ABC!!!', 'France', 'Perpignan', 'à la rue', NULL),
(4, 'User', 'pin', 'pon', '1945-06-04', '1418118112', 'pinpon@lespompiers.fr', 'user123ABC!!!', 'US', 'New York', 'wall street', NULL),
(5, 'User', 'bob', 'leponge', '2015-03-10', '789456123', 'bobleponge@lamere.fr', 'bob123ABC!!!', 'UK', 'london', 'bridge', NULL),
(6, 'User', 'John', 'Doe', '1990-01-01', '0612345678', 'john.doe@mail.com', 'M0tD3P@ss3', 'France', 'Paris', '10 rue de la Paix', 'box1'),
(7, 'User', 'Jane', 'Doe', '1995-02-14', '0623456789', 'jane.doe@mail.com', 'P@ssw0rd', 'France', 'Lyon', '5 rue de la Liberté', 'box2'),
(8, 'Modo', 'Bob', 'Smith', '1985-05-12', '0634567890', 'bob.smith@mail.com', 'Secur3P@ss', 'USA', 'New York', '123 Main St', NULL),
(9, 'Admin', 'Alice', 'Brown', '1980-07-04', '0645678901', 'alice.brown@mail.com', 'Adm1nP@ss', 'Canada', 'Toronto', '1 Yonge St', NULL),
(10,'User', 'Tom', 'Wilson', '2000-10-22', '0656789012', 'tom.wilson@mail.com', 'T0mmyP@ss', 'Australia', 'Sydney', '42 Wallaby Way', 'box3');


INSERT INTO sensor (id_sensor, id_Box, typeSensor) VALUES 
('sensor1', 'box1', 'temperatureSensor'),
('sensor2', 'box1', 'heartSensor'),
('sensor3', 'box2', 'humiditySensor'),
('sensor4', 'box2', 'soundSensor'),
('sensor5', 'box3', 'temperatureSensor');


-- 1 fichier JSON contient 1h de données
-- l'intervalle entre chaque valeurs depend du capteur
-- Le fichier JSON peut donc contenir qu'une suite de valeurs
-- Les deux colonnes TIMESTAMP permet de connaitre l'heure de début  et de fin de la captation des données 
INSERT INTO dataSensor (id_data, id_sensor, dataFile, date_start, date_end) VALUES
('1', 'sensor1', '{"values":[23.5,23.6,23.7,23.8,23.9]}', '2022-01-01 12:00:00', '2022-01-01 12:10:00'),
('2', 'sensor2', '{"values":[70,71,72,73,74]}', '2022-01-02 14:00:00', '2022-01-02 14:10:00'),
('3', 'sensor3', '{"values":[45.6,45.8,45.9,46.1,46.2]}', '2022-01-03 09:30:00', '2022-01-03 09:40:00'),
('4', 'sensor2', '{"values":[75,76,76,77,78]}', '2022-01-04 18:00:00', '2022-01-04 18:10:00'),
('5', 'sensor4', '{"values":[56.7,56.9,57.1,57.3,57.5]}', '2022-01-05 07:15:00', '2022-01-05 07:25:00');


INSERT INTO FAQ (`id_question`, `question`, `response`) VALUES
(1, 'Qu''est-ce que la box IoT ?', 'La box IoT est un système de communication qui permet de connecter des objets à internet et d''interagir avec eux à distance.'),
(2, 'Quels sont les capteurs compatibles avec la box IoT ?', 'La box IoT est compatible avec différents types de capteurs tels que les capteurs de température, d''humidité, de pression, de bruit, etc.'),
(3, 'Comment installer la box IoT ?', 'Pour installer la box IoT, vous devez la brancher à une source d''alimentation et à votre réseau internet, puis suivre les instructions fournies dans le manuel d''utilisation.'),
(4, 'Est-ce que la box IoT est sécurisée ?', 'Oui, la box IoT intègre des fonctionnalités de sécurité avancées pour protéger les données échangées entre les objets connectés et le système central.'),
(5, 'Comment puis-je accéder aux données collectées par la box IoT ?', 'Vous pouvez accéder aux données collectées par la box IoT via une interface web ou une application mobile dédiée, en utilisant les identifiants fournis lors de l''installation de la box.');



