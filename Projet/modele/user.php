<?php


function getDataSensor($sensorName, $mailUser='faresdata.yessir@yahoo.fr') {
    include_once("./Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT u.mail, u.id_Box, s.typeSensor, d.dataFile, d.date_start, d.date_end
                FROM utilisateur u
                LEFT JOIN sensor s ON u.id_Box=s.id_Box
                LEFT JOIN datasensor d ON s.id_sensor=d.id_sensor
                WHERE s.typeSensor=:typeSensor
                AND u.mail=:mailUser
                ORDER BY d.date_start DESC";

    $commande = $conn->prepare($sql);
    $commande->bindValue(':typeSensor', $sensorName);
    $commande->bindValue(':mailUser', $mailUser);
    $bool = $commande->execute();

    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    return $resultat;
}

?>