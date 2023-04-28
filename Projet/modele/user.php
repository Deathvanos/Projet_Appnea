<?php

function getProfil($mail){
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT firstName, lastName, birthday, phoneNumber, mail, country, city, address, photo, id_utilisateur FROM utilisateur
            WHERE mail = :mail";
    try{
        $commande = $conn->prepare($sql);
        $commande->bindParam(':mail', $mail, PDO::PARAM_STR);
        $bool = $commande->execute();
        if($bool){
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
            return $resultat;
        }
    }catch(PDOException $e){
        echo utf8_encode("Echec de la récupération du profil : " . $e->getMessage() . "\n");
        die();
    }
}

function updateUser($tab, $id){
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();   
    $sql = "UPDATE utilisateur 
                SET lastName = :lastName,
                    firstName = :firstName,
                    phoneNumber = :phoneNumber,
                    mail = :mail,
                    address = :adresse,
                    city = :city,
                    country = :country,
                    photo = :photo
                WHERE id_utilisateur=:id";
    try{
        $commande = $conn->prepare($sql);
        $commande->bindParam(':lastName', $tab['Nom']);
        $commande->bindParam(':firstName', $tab['Prénom']);
        $commande->bindParam(':phoneNumber', $tab['Tel']);
        $commande->bindParam(':mail', $tab['Mail']);
        $commande->bindParam(':adresse', $tab['Adresse']);
        $commande->bindParam(':city', $tab['Ville']);
        $commande->bindParam(':country', $tab['Pays']);
        $commande->bindParam(':photo', $tab['Photo']);
        $commande->bindParam(':id', $id);
        $commande->execute();
    }catch(PDOException $e){
        echo utf8_encode("Echec de la mise à jour du profil : " . $e->getMessage() . "\n");
        die();
    }
}






function getDataTemperature() {
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT u.mail, u.id_Box, s.typeSensor, d.dataFile, d.date_start, d.date_end
                FROM utilisateur u
                LEFT JOIN sensor s ON u.id_Box=s.id_Box
                LEFT JOIN datasensor d ON s.id_sensor=d.id_sensor
                
                WHERE u.mail='faresdata.yessir@yahoo.fr'
                AND s.typeSensor='temperatureSensor'
                ORDER BY d.date_start DESC";

    $commande = $conn->prepare($sql);
    $bool = $commande->execute();

    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
    return $resultat;
}

function getDataCardiaque() {
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT u.mail, u.id_Box, s.typeSensor, d.dataFile, d.date_start, d.date_end
              FROM utilisateur u
              LEFT JOIN sensor s ON u.id_Box=s.id_Box
              LEFT JOIN datasensor d ON s.id_sensor=d.id_sensor
              
              WHERE u.mail='faresdata.yessir@yahoo.fr'
              AND s.typeSensor='heartSensor'
              ORDER BY d.date_start DESC";

    $commande = $conn->prepare($sql);
    $bool = $commande->execute();

    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
    return $resultat;
}

function getDataHumidite() {
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT u.mail, u.id_Box, s.typeSensor, d.dataFile, d.date_start, d.date_end
            FROM utilisateur u
            LEFT JOIN sensor s ON u.id_Box=s.id_Box
            LEFT JOIN datasensor d ON s.id_sensor=d.id_sensor
            
            WHERE u.mail='faresdata.yessir@yahoo.fr'
            AND s.typeSensor='humiditySensor'
            ORDER BY d.date_start DESC";

    $commande = $conn->prepare($sql);
    $bool = $commande->execute();

    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
    return $resultat;
}

function getDataSonore()
{
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT u.mail, u.id_Box, s.typeSensor, d.dataFile, d.date_start, d.date_end
            FROM utilisateur u
            LEFT JOIN sensor s ON u.id_Box=s.id_Box
            LEFT JOIN datasensor d ON s.id_sensor=d.id_sensor
            
            WHERE u.mail='faresdata.yessir@yahoo.fr'
            AND s.typeSensor='soundSensor'
            ORDER BY d.date_start DESC";

    $commande = $conn->prepare($sql);
    $bool = $commande->execute();

    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
    return $resultat;
}
?>