<?php 


    function removeUser($mailUser) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : Suppression de l'utilisateur
        $query = $conn->prepare("DELETE FROM utilisateur WHERE mail = :mail");
        $query->bindParam(':mail', $mailUser);
        $query->execute();

        // Fin Connection BdD
        $conn = null;
    }

?>