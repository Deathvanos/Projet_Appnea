<?php

function modoFAQ() {
    // Création de la connection à la base de données
    require_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    // Regarde si le mail et le mdp existent dans la base de données
    $sql =  'SELECT * FROM faq'; 
    $commande = $conn->prepare($sql);
    $bool = $commande->execute();
    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    // Fermeture de la base de données
    $conn = null;
    return $resultat;
}

function createNewFAQ($frQ, $frR, $usQ, $usA) {
    echo "<br>2--".$frQ, $frR. $usQ. $usA;
    // Création de la connection à la base de données
    require_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    // Regarde si le mail et le mdp existent dans la base de données
    $sql =  'INSERT INTO faq (`fr_question`, `fr_response`, `us_question`, `us_response`) VALUES (:frQ, :frR, :usQ, :usA)'; 
    $commande = $conn->prepare($sql);
    $commande->bindParam(':frQ', $frQ);
    $commande->bindParam(':frR', $frR);
    $commande->bindParam(':usQ', $usQ);
    $commande->bindParam(':usA', $usA);
    $bool = $commande->execute();

    // Fermeture de la base de données
    $conn = null;
}


function removeFAQ($numFAQ) {
    // Début Connection BdD
    include_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    // Requete : Suppression de l'utilisateur
    $query = $conn->prepare("DELETE FROM faq WHERE id_question = :numFAQ");
    $query->bindParam(':numFAQ', $numFAQ);
    $query->execute();
    // Fin Connection BdD
    $conn = null;
}


function modifFAQ($numFAQ, $frQ, $frR, $usQ, $usA) {
    // Début Connection BdD
    include_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    # Requete SQL
    $sql =  "UPDATE faq 
             SET fr_question = :frQ, 
                 fr_response = :frR, 
                 us_question = :usQ, 
                 us_response = :usA
             WHERE id_question = :numFAQ";
    $query = $conn->prepare($sql);
    $query->bindParam(':frQ', $frQ);
    $query->bindParam(':frR', $frR);
    $query->bindParam(':usQ', $usQ);
    $query->bindParam(':usA', $usA);
    $query->bindParam(':numFAQ', $numFAQ);
    $query->execute();
    // Fin Connection BdD
    $conn = null;
}


function faqExist($numFAQ) {
    // Début Connection BdD
    include_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    # Requete SQL
    $sql =  "SELECT * FROM faq WHERE id_question = :numFAQ";
    $query = $conn->prepare($sql);
    $query->bindParam(':numFAQ', $numFAQ);
    $bool = $query->execute();
    $resultat = $query->fetch(PDO::FETCH_ASSOC);
    // Fin Connection BdD
    $conn = null;
     // La question existe dans la table faq
    if ($resultat) {return true;} 
    // La question n'existe pas dans la table faq
    else {return false;}
}

?>