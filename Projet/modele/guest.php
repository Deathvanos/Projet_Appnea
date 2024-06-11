<?php


function FAQextraction() {
        // Création de la connection à la base de données
        require_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        
        // Regarde si le mail et le mdp existent dans la base de données
        $sql =  'SELECT '.$_SESSION['lang'].'_question, '.$_SESSION['lang'].'_response FROM faq'; 
        $commande = $conn->prepare($sql);
        $bool = $commande->execute();
        $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);

        // Fermeture de la base de données
        $conn = null;

        return $resultat;
}

?>