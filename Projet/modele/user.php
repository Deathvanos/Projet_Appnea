<?php

function getProfil($mail){
    $sql = "SELECT firstName, lastName, birthday, phoneNumber, mail, country, city, localisation FROM user
            WHERE mail = :mail";
    try{
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':mail', $mail, PDO::PARAM_STR);
        $bool->excute($commande);
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