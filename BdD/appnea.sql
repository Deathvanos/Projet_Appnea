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
-- --------------- Creation de la DataBase si inexistante --------------
-- ---------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `appnea` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `appnea`;




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
  `codePostal` varchar(15) DEFAULT NULL,
  `address` varchar(63) NOT NULL,
  `id_Box` VARCHAR(31) DEFAULT NULL UNIQUE,
  FOREIGN KEY (`id_Box`) REFERENCES sensorBox(`id_Box`) ON DELETE SET NULL ON UPDATE CASCADE
);


-- Structure de la table `sensor`
CREATE TABLE sensor (
  `id_sensor` varchar(31) NOT NULL PRIMARY KEY,
  `id_Box` varchar(31) DEFAULT NULL,
  `typeSensor` enum('temperatureSensor','heartSensor','humiditySensor', 'soundSensor') NOT NULL,
  `isUsed` BOOLEAN DEFAULT TRUE,
  `isNotBroken` BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (`id_Box`) REFERENCES sensorbox(`id_Box`) ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE (`id_Box`, `typeSensor`)
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
('box5'),
('box6'),
('box7'),
('box8'),
('box9'),
('box10'),
('box11'),
('box12'),
('box13'),
('box14'),
('box15'),
('box16'),
('box17'),
('box18'),
('box19'),
('box20');


INSERT INTO utilisateur (id_utilisateur, typeUser, photo, firstName, lastName, birthday, phoneNumber, mail, password, country, city, codePostal, address, id_Box) VALUES 
(1,  'User', null,  'Jean', 'Bon', '1984-04-12', '147258369', 'jeanbon@yahoo.fr', 'jeanbon123ABC!!!', 'France', 'Toulouse', NULL,  'avenue de la boucherie', NULL),
(2,  'Admin', null,  'admin', 'thebest', '2000-01-01', '+33 7123456789', 'adminthebest@gmail.com', 'admin123ABC!!!', 'France', 75011,  'Paris', 'ISEP', NULL),
(3,  'Modo', null,  'modo', 'theworth', '2023-03-14', '666666666', 'modothwoth@yahoo.fr', 'modo123ABC!!!', 'France', 'Perpignan', NULL,  'à la rue', NULL),
(4,  'User', null,  'pin', 'pon', '1945-06-04', '1418118112', 'pinpon@lespompiers.fr', 'user123ABC!!!', 'US', 'New York', NULL,  'wall street', NULL),
(5,  'User', null,  'bob', 'leponge', '2015-03-10', '789456123', 'bobleponge@lamere.fr', 'bob123ABC!!!', 'UK', 'london', NULL,  'bridge', NULL),
(6,  'User', null,  'John', 'Doe', '1990-01-01', '0612345678', 'john.doe@mail.com', 'M0tD3P@ss3', 'France', 'Paris', 75008,  '10 rue de la Paix', 'box1'),
(7,  'User', null,  'Jane', 'Doe', '1995-02-14', '0623456789', 'jane.doe@mail.com', 'P@ssw0rd', 'France', 'Lyon', NULL,  '5 rue de la Liberté', 'box2'),
(8,  'Modo', null,  'Bob', 'Smith', '1985-05-12', '0634564890', 'bob.smith@mail.com', 'Secur3P@ss', 'USA', 'New York', NULL,  '123 Main St', NULL),
(9,  'Admin', null,  'Alice', 'Brown', '1980-07-04', '0645178901', 'alice.brown@mail.com', 'Adm1nP@ss', 'Canada', 'Toronto', NULL,  '1 Yonge St', NULL),
(10, 'User', null,  'Tom', 'Wilson', '2000-10-22', '0656789712', 'tom.wilson@mail.com', 'T0mmyP@ss', 'Australia', 'Sydney', NULL,  '42 Wallaby Way', 'box3'),
(11, 'User', null, 'Bob', 'Smith', '1985-07-20', '+44 1234 567890', 'bob.smith@example.com', 'password789', 'UK', 'London', 'SW1A 1AA', '10 Downing Street', NULL),
(12, 'User', null, 'Alice', 'Johnson', '2000-11-30', '+1 555-123-4567', 'alice.johnson@example.com', 'passwordABC', 'USA', 'New York', 10001, '123 Main St', 'box4'),
(13, 'User', null, 'Mike', 'Lee', '1992-05-12', '+81 3-1234-5678', 'mike.lee@example.com', 'passwordDEF', 'Japan', 'Tokyo', '105-0011', '1-1 Chiyoda', 'box5'),
(14, 'Modo', null, 'Sarah', 'Taylor', '1980-09-25', '+44 7911 123456', 'sarah.taylor@example.com', 'passwordGHI', 'UK', 'Manchester', 'M1 3BN', '5 Oxford Road', null),
(15, 'Modo', null, 'David', 'Clark', '1975-02-18', '+1 555-456-7890', 'david.clark@example.com', 'passwordJKL', 'USA', 'San Francisco', 94102, '123 Main St', null),
(16, 'Admin', null, 'Olivia', 'Martin', '1982-11-10', '+33 6 34 56 78 90', 'olivia.martin@example.com', 'passwordMNO', 'France', 'Lille', 59000, '10 Rue des Fleurs', null),
(17, 'Admin', null, 'William', 'Harris', '1978-08-08', '+44 20 7123 4567', 'william.harris@example.com', 'passwordPQR', 'UK', 'Edinburgh', 'EH1 1YZ', '10 High Street', null),
(18, 'User', null, 'Sophie', 'Baker', '1999-04-05', '+1 555-789-0123', 'sophie.baker@example.com', 'passwordSTU', 'USA', 'Chicago', 60601, '456 Elm St', 'box6'),
(19, 'User', NULL, 'Pierre', 'Durand', '1995-07-15', '0602030405', 'pierre.durand@gmail.com', 'mypassword', 'France', 'Paris', 75001, '1 rue de la Paix', 'box7'),
(20, 'User', NULL, 'Sophie', 'Dupont', '1989-04-30', '0612345648', 'sophie.dupont@gmail.com', 'mypassword', 'France', 'Lyon', 69001, '5 avenue des Fleurs', 'box8'),
(21, 'Modo', NULL, 'Lucie', 'Martin', '1993-11-22', '0634567890', 'lucie.martin@gmail.com', 'mypassword', 'France', 'Marseille', 13001, '7 rue de la Liberté', NULL),
(22, 'User', NULL, 'Maxime', 'Girard', '1990-08-08', '0645678901', 'maxime.girard@gmail.com', 'mypassword', 'France', 'Lille', 59000, '2 place de la Gare', 'box9'),
(23, 'User', NULL, 'Marie', 'Lefebvre', '1998-01-20', '0656789012', 'marie.lefebvre@gmail.com', 'mypassword', 'France', 'Nantes', 44000, '10 rue des Lilas', 'box10'),
(24, 'Admin', NULL, 'Thomas', 'Lambert', '1985-06-10', '0667890123', 'thomas.lambert@gmail.com', 'mypassword', 'France', 'Toulouse', 31000, '15 avenue du Soleil', NULL),
(25, 'User', NULL, 'Amélie', 'Roux', '1987-09-12', '0678901234', 'amelie.roux@gmail.com', 'mypassword', 'France', 'Bordeaux', 33000, '9 rue du Château', NULL),
(26, 'Modo', NULL, 'Antoine', 'Fournier', '1994-12-05', '0689012345', 'antoine.fournier@gmail.com', 'mypassword', 'France', 'Strasbourg', 67000, '3 avenue de la Gare', NULL),
(27, 'User', NULL, 'Mathilde', 'Mercier', '1988-03-18', '0690123456', 'mathilde.mercier@gmail.com', 'mypassword', 'France', 'Lyon', 69002, '12 rue des Roses', NULL),
(28, 'User', NULL, 'François', 'Bertrand', '1999-02-03', '0612345578', 'francois.bertrand@gmail.com', 'mypassword', 'France', 'Paris', 75002, '8 rue des Lilas', 'box11'),
(30, 'User', NULL, 'Carla', 'Perez', '1998-03-24', '+33624781523', 'carla.perez@gmail.com', 'hash123', 'France', 'Paris', 75008, '10 rue de la Paix', 'box12'),
(31, 'User', NULL, 'Martin', 'Duval', '2002-11-02', '+33659547852', 'martin.duval@gmail.com', 'hash123', 'France', 'Lyon', 69007, '2 rue des Roses', 'box13'),
(32, 'Modo', NULL, 'Julie', 'Lefebvre', '1989-08-14', '+33652741963', 'julie.lefebvre@gmail.com', 'hash123', 'France', 'Marseille', 13001, '25 avenue des Fleurs', NULL),
(33, 'User', NULL, 'Lena', 'Deschamps', '1995-06-08', '+33658214796', 'lena.deschamps@gmail.com', 'hash123', 'France', 'Toulouse', 31000, '45 rue des Lilas', 'box14'),
(34, 'User', NULL, 'Alexandre', 'Girard', '2000-09-30', '+33695274185', 'alexandre.girard@gmail.com', 'hash123', 'France', 'Lille', 59000, '7 rue du Pont', 'box15'),
(35, 'Admin', NULL, 'Marie', 'Rousseau', '1990-12-19', '+33674582145', 'marie.rousseau@gmail.com', 'hash123', 'France', 'Bordeaux', 33000, '15 avenue du Lac', NULL),
(36, 'User', NULL, 'Jules', 'Lecomte', '1997-02-28', '+33693571208', 'jules.lecomte@gmail.com', 'hash123', 'France', 'Rennes', 35000, '30 boulevard de la Liberté', 'box16'),
(37, 'User', NULL, 'Chloé', 'Gautier', '2001-05-11', '+33635478696', 'chloe.gautier@gmail.com', 'hash123', 'France', 'Nice', 06000, '12 rue de la Mer', NULL),
(38, 'Modo', NULL, 'Nicolas', 'Dupont', '1992-09-22', '+33658742139', 'nicolas.dupont@gmail.com', 'hash123', 'France', 'Lyon', 69002, '8 avenue des Saules', NULL),
(39, 'User', NULL, 'Sophie', 'Laurent', '1996-11-16', '+33695637852', 'sophie.laurent@gmail.com', 'hash123', 'France', 'Marseille', 13006, '21 avenue de la Plage', 'box17');


INSERT INTO sensor (id_sensor, id_Box, typeSensor, isUsed, isNotBroken) VALUES
('sensor1', 'box1', 'temperatureSensor', 1, 1),
('sensor2', 'box1', 'heartSensor', 1, 1),
('sensor3', 'box2', 'humiditySensor', 1, 1),
('sensor4', 'box2', 'soundSensor', 1, 1),
('sensor5', 'box3', 'temperatureSensor', 1, 1),
('sensor6', 'box3', 'heartSensor', 1, 1),
('sensor7', 'box4', 'humiditySensor', 1, 1),
('sensor8', 'box4', 'soundSensor', 1, 1),
('sensor9', 'box5', 'temperatureSensor', 1, 1),
('sensor10', 'box5', 'heartSensor', 1, 1),
('sensor31', 'box6', 'temperatureSensor', 1, 1),
('sensor32', 'box6', 'heartSensor', 1, 1),
('sensor33', 'box6', 'humiditySensor', 1, 1),
('sensor34', 'box7', 'temperatureSensor', 1, 1),
('sensor35', 'box7', 'heartSensor', 1, 1),
('sensor36', 'box7', 'humiditySensor', 1, 1),
('sensor37', 'box8', 'temperatureSensor', 1, 1),
('sensor38', 'box8', 'heartSensor', 1, 1),
('sensor39', 'box8', 'humiditySensor', 1, 1),
('sensor40', 'box9', 'temperatureSensor', 1, 1),
('sensor41', 'box9', 'heartSensor', 1, 1),
('sensor42', 'box9', 'humiditySensor', 1, 1),
('sensor43', 'box10', 'temperatureSensor', 1, 1),
('sensor44', 'box10', 'heartSensor', 1, 1),
('sensor45', 'box10', 'humiditySensor', 1, 1),
('sensor46', 'box15', 'heartSensor', TRUE, TRUE),
('sensor47', 'box15', 'humiditySensor', TRUE, TRUE),
('sensor48', 'box15', 'soundSensor', TRUE, TRUE),
('sensor49', 'box16', 'temperatureSensor', TRUE, TRUE),
('sensor50', 'box16', 'heartSensor', TRUE, TRUE),
('sensor51', 'box16', 'humiditySensor', TRUE, TRUE),
('sensor52', 'box17', 'soundSensor', TRUE, TRUE),
('sensor53', 'box17', 'temperatureSensor', TRUE, TRUE),
('sensor54', 'box17', 'heartSensor', TRUE, TRUE),
('sensor55', 'box18', 'humiditySensor', TRUE, TRUE),
('sensor56', 'box18', 'soundSensor', TRUE, TRUE),
('sensor57', 'box18', 'temperatureSensor', TRUE, TRUE),
('sensor58', 'box19', 'heartSensor', TRUE, TRUE),
('sensor59', 'box19', 'humiditySensor', TRUE, TRUE),
('sensor60', 'box19', 'soundSensor', TRUE, TRUE),
('sensor61', 'box12', 'humiditySensor', 1, 1),
('sensor62', 'box12', 'soundSensor', 1, 1),
('sensor63', 'box13', 'temperatureSensor', 1, 1),
('sensor64', 'box13', 'heartSensor', 1, 1),
('sensor65', 'box14', 'humiditySensor', 1, 1),
('sensor66', 'box14', 'soundSensor', 1, 1),
('sensor70', 'box16', 'soundSensor', 1, 1),
('sensor88', 'box20', 'heartSensor', 1, 1),
('sensor89', 'box20', 'humiditySensor', 1, 1),
('sensor90', 'box20', 'soundSensor', 1, 1),
('sensor91', null, 'temperatureSensor', 1, 1),
('sensor94', null, 'soundSensor', 1, 1),
('sensor96', null, 'heartSensor', 1, 1),
('sensor98', null, 'soundSensor', 1, 1),
('sensor99', null, 'temperatureSensor', 1, 1);


-- 1 fichier JSON contient 1h de données
-- l'intervalle entre chaque valeurs depend du capteur
-- Le fichier JSON peut donc contenir qu'une suite de valeurs
-- Les deux colonnes TIMESTAMP permet de connaitre l'heure de début  et de fin de la captation des données 
INSERT INTO dataSensor (id_data, id_sensor, dataFile, date_start, date_end) VALUES
('data1', 'sensor1', '{ "values": [23.4, 23.6, 23.8, 24.1, 23.9] }', '2022-01-01 12:00:00', '2022-01-01 13:00:00'),
('data2', 'sensor1', '{ "values": [23.9, 24.2, 24.5, 24.1, 23.8] }', '2022-01-02 12:00:00', '2022-01-02 13:00:00'),
('data3', 'sensor1', '{ "values": [22.8, 22.9, 22.5, 22.7, 22.6] }', '2022-01-03 12:00:00', '2022-01-03 13:00:00'),
('data4', 'sensor2', '{ "values": [71, 68, 75, 79, 82] }', '2022-01-01 12:00:00', '2022-01-01 13:00:00'),
('data5', 'sensor2', '{ "values": [75, 77, 73, 69, 72] }', '2022-01-02 12:00:00', '2022-01-02 13:00:00'),
('data6', 'sensor2', '{ "values": [80, 81, 84, 78, 81] }', '2022-01-03 12:00:00', '2022-01-03 13:00:00'),
('data7', 'sensor3', '{ "values": [52.3, 50.6, 53.1, 54.8, 51.9] }', '2022-01-01 12:00:00', '2022-01-01 13:00:00'),
('data8', 'sensor3', '{ "values": [50.2, 49.7, 48.9, 50.6, 50.3] }', '2022-01-02 12:00:00', '2022-01-02 13:00:00'),
('data9', 'sensor3', '{ "values": [51.2, 50.9, 50.5, 52.1, 51.8] }', '2022-01-03 12:00:00', '2022-01-03 13:00:00'),
('data10', 'sensor4', '{"values":[60, 70, 80, 90, 100]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data11', 'sensor4', '{"values":[70, 80, 90, 100, 110]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data12', 'sensor4', '{"values":[50, 60, 70, 80, 90]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data13', 'sensor4', '{"values":[40, 50, 60, 70, 80]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data14', 'sensor4', '{"values":[30, 40, 50, 60, 70]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data15', 'sensor4', '{"values":[20, 30, 40, 50, 60]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("temp1", "sensor5", '{"values":[23.5, 23.8, 24.1, 24.2, 23.9, 23.6, 23.2, 22.9]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("temp2", "sensor5", '{"values":[22.1, 22.4, 22.7, 22.9, 22.6, 22.3, 22.1, 21.9]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("temp3", "sensor5", '{"values":[20.2, 20.6, 21.0, 21.3, 21.1, 20.8, 20.5, 20.2]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("temp4", "sensor5", '{"values":[17.8, 18.1, 18.5, 18.8, 18.6, 18.2, 17.9, 17.6]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("temp5", "sensor5", '{"values":[19.3, 19.7, 20.1, 20.3, 20.0, 19.6, 19.3, 19.0]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("heart1", "sensor6", '{"values":[76, 79, 81, 83, 80, 76, 72, 69]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("heart2", "sensor6", '{"values":[64, 67, 71, 73, 70, 67, 63, 60]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("heart3", "sensor6", '{"values":[82, 85, 87, 89, 86, 82, 78, 75]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("heart4", "sensor6", '{"values":[91, 94, 96, 98, 95, 91, 87, 84]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("heart5", "sensor6", '{"values":[62, 65, 68, 70, 67, 63, 60, 57]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("humidity1", "sensor7", '{"values":[56, 53, 50, 49, 52, 55, 58, 61]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("humidity2", "sensor7", '{"values":[63, 60, 57, 55, 58, 61, 64, 67]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("humidity3", "sensor7", '{"values":[48, 45, 42, 40, 43, 46, 49, 52]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("humidity4", "sensor7", '{"values":[70, 67, 64, 62, 65, 68, 71, 74]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
("humidity5", "sensor7", '{"values":[38, 35, 32, 30, 33, 36, 39, 42]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('dataHumid1', 'sensor9', '{"values": [50, 45, 46, 48, 47, 50, 55, 52, 58, 60], "unit": "%"}', '2022-03-01 10:00:00', '2022-03-01 10:10:00'),
('dataHumid2', 'sensor9', '{"values": [55, 50, 52, 53, 56, 58, 60, 59, 63, 62], "unit": "%"}', '2022-03-01 10:10:00', '2022-03-01 10:20:00'),
('dataHumid3', 'sensor9', '{"values": [61, 65, 63, 68, 70, 69, 72, 71, 70, 68], "unit": "%"}', '2022-03-01 10:20:00', '2022-03-01 10:30:00'),
('dataTemp1', 'sensor10', '{"values": [22.3, 22.5, 23.1, 23.6, 23.9, 23.7, 23.2, 22.8, 22.5, 22.2], "unit": "C"}', '2022-03-01 10:00:00', '2022-03-01 10:10:00'),
('dataTemp2', 'sensor10', '{"values": [22.2, 22.1, 22.5, 23.1, 23.5, 23.9, 24.0, 23.8, 23.5, 23.1], "unit": "C"}', '2022-03-01 10:10:00', '2022-03-01 10:20:00'),
('dataTemp3', 'sensor10', '{"values": [23.1, 23.4, 23.8, 23.9, 24.1, 23.9, 23.4, 23.0, 22.6, 22.3], "unit": "C"}', '2022-03-01 10:20:00', '2022-03-01 10:30:00'),
('data18', 'sensor31', '{"values": [24, 25, 26, 25, 23]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data19', 'sensor32', '{"values": [38, 39, 40, 41, 42]}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data13_1', 'sensor33', '{"value": 23.5, "unit": "Celsius"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data14_1', 'sensor34', '{"value": 72, "unit": "bpm"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data15_1', 'sensor35', '{"value": 50, "unit": "%"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data16_1', 'sensor36', '{"value": 70, "unit": "dB"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data17_1', 'sensor37', '{"value": 25.1, "unit": "Celsius"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data18_1', 'sensor38', '{"value": 68, "unit": "bpm"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data19_1', 'sensor39', '{"value": 48, "unit": "%"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data20_1', 'sensor40', '{"value": 67, "unit": "dB"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data21_1', 'sensor41', '{"value": 23, "unit": "°C"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data22_1', 'sensor42', '{"value": 78, "unit": "%"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data23_1', 'sensor43', '{"value": 12, "unit": "bpm"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data24_1', 'sensor44', '{"value": 75, "unit": "%"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data25_1', 'sensor45', '{"value": 30, "unit": "°C"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data26_1', 'sensor46', '{"value": 65, "unit": "dB"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data27_1', 'sensor47', '{"value": 70, "unit": "bpm"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data28_1', 'sensor48', '{"value": 54, "unit": "%"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data29_1', 'sensor49', '{"value": 22, "unit": "°C"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data30_1', 'sensor50', '{"value": 70, "unit": "dB"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data31_1', 'sensor51', '{"value": 80, "unit": "bpm"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data32_1', 'sensor52', '{"value": 42, "unit": "%"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10'),
('data33_1', 'sensor53', '{"value": 20, "unit": "°C"}', '2022-01-01 12:00:00', '2022-01-01 12:00:10');


INSERT INTO FAQ (`id_question`, `question`, `response`) VALUES
(1, 'Combien de temps dois-je dormir chaque nuit ?', 'Les adultes devraient viser à dormir environ 7 à 8 heures chaque nuit.'),
(2, 'Est-il normal de se réveiller plusieurs fois la nuit ?', 'Il est normal de se réveiller brièvement plusieurs fois par nuit, mais si vous avez du mal à vous rendormir, cela peut indiquer un problème de sommeil.'),
(3, 'Comment puis-je améliorer la qualité de mon sommeil ?', 'Vous pouvez améliorer la qualité de votre sommeil en suivant une routine de sommeil régulière, en créant un environnement de sommeil calme et confortable, en évitant les écrans avant de dormir et en faisant de lexercice régulièrement.'),
(4, 'Est-ce que la sieste est bénéfique pour la santé ?', 'Les siestes peuvent être bénéfiques pour la santé si elles sont courtes et bien chronométrées, mais des siestes trop longues ou trop fréquentes peuvent interférer avec le sommeil nocturne.'),
(5, 'Comment puis-je savoir si jai un trouble du sommeil ?', 'Si vous avez des difficultés à vous endormir, à rester endormi ou si vous vous réveillez fatigué malgré une nuit de sommeil complète, vous pourriez avoir un trouble du sommeil. Parlez-en à votre médecin si vous êtes préoccupé par la qualité de votre sommeil.'),
(6, "Comment puis-je améliorer la qualité de mon sommeil ?", "Il existe plusieurs façons d'améliorer la qualité de votre sommeil, notamment en créant une routine de sommeil régulière, en limitant la consommation de caféine et d'alcool, en évitant les écrans avant le coucher, en créant un environnement de sommeil confortable et en pratiquant la relaxation."),
(7, "Combien d'heures de sommeil devrais-je avoir chaque nuit ?", "La quantité de sommeil dont vous avez besoin dépend de votre âge et de votre style de vie. En général, les adultes ont besoin de 7 à 9 heures de sommeil chaque nuit pour se sentir reposés et alertes."),
(8, "Comment puis-je savoir si j'ai un trouble du sommeil ?", "Les troubles du sommeil peuvent être diagnostiqués par un professionnel de la santé. Si vous avez des difficultés à vous endormir, à rester endormi ou si vous vous réveillez fatigué, vous pourriez avoir un trouble du sommeil. Parlez-en à votre médecin si vous êtes préoccupé par votre sommeil."),
(9, "Les somnifères sont-ils une solution sûre pour les problèmes de sommeil ?", "Les somnifères peuvent aider à traiter les problèmes de sommeil à court terme, mais ils ne sont généralement pas recommandés pour une utilisation à long terme car ils peuvent causer des effets secondaires et des problèmes de dépendance."),
(10, "Le ronflement est-il un signe de trouble du sommeil ?", "Le ronflement peut être un signe de trouble du sommeil, notamment de l'apnée du sommeil. Si vous ronflez régulièrement ou si vous vous réveillez souvent fatigué, vous pourriez avoir un trouble du sommeil. Parlez-en à votre médecin si vous êtes préoccupé par votre sommeil.");

