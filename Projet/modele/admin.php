<?php 


    /**
     * Suppression d'un utilisateur
     */
    function removeUser() {
        echo '<div style="color:white;">Confirmation de la suppresion : '.$_POST['delUser'].'</div>';
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : Suppression de l'utilisateur
        $query = $conn->prepare("DELETE FROM utilisateur WHERE mail = :mail");
        $query->bindParam(':mail', $_POST['delUser']);
        $query->execute();

        // Fin Connection BdD
        $conn = null;
    }
