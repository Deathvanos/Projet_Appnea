<?php 


    function requeteFindUser(){
        // Ceci est le milieu de la requete
        // Ne pas oublier d'ajouter le select avant l'appel de cette fonction
        // Ou un LIMIT à la fin
        return "FROM utilisateur
        WHERE typeUser like '".($_POST['typeUser']==null? '%':htmlspecialchars($_POST['typeUser']))."'
        AND firstName like '".($_POST['firstName']==null? '%':htmlspecialchars($_POST['firstName']))."%'
        AND lastName like '".($_POST['lastName']==null? '%':htmlspecialchars($_POST['lastName']))."%'
        AND mail like '".($_POST['mail']==null? '%':htmlspecialchars($_POST['mail']))."%'
        AND birthday like '".($_POST['birthday']==null? '%':htmlspecialchars($_POST['birthday']))."'
        AND phoneNumber like '".($_POST['phoneNumber']==null? '%':htmlspecialchars($_POST['phoneNumber']))."%'
        AND country like '".($_POST['country']==null? '%':htmlspecialchars($_POST['country']))."%'
        AND city like '%".($_POST['city']==null? '%':htmlspecialchars($_POST['city']))."%'
        AND address like '".($_POST['address']==null? '%':htmlspecialchars($_POST['address']))."%'
    "; 
    }

    /**
     * Affiche les éléments de la table User
     * A partir de $x1 jusqu'à $x1+$x2
     * Et en fonction des filtres de requeteFindUser()
     */
    function printDataBase($x1, $x2){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete
        $sql =  "SELECT * ".requeteFindUser()."LIMIT ".$x1.", ".$x2; 
        $res = $conn->query($sql);
        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $res;
    }

    /**
     * Compte le nombre d'éléments dans la table User
     * En fonction des filtres de requeteFindUser()
     */
    function nbUserFind(){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete
        $sql =  "SELECT COUNT(mail)".requeteFindUser(); 
        $res = $conn->query($sql);
        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $res->fetch()[0];
    }




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
    

