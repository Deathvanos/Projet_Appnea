<?php

function getProfil($mail){
    require("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT firstName, lastName, birthday, phoneNumber, mail, country, city, address, photo FROM utilisateur
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
        echo utf8_encode("Echec de la recupération du profil : " . $e->getMessage() . "\n");
        die();
    }
}


?>