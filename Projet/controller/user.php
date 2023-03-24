<!--******************************************************
* APP - Projet Système Numérique - Composante Informatique
* ISEP - A1 - G7C
* Semestre 2
* Auteur : - MAILLEY_Charles 
           - MAIZA_Fares
           - MARTINEZ_Eliot
           - PAVIOT-ADET_Flore
           - SPASOJEVIC_Fanny
           - VINGADASSAMY_Prasanaa
* Date de rendu  : 05/06/2023
********************************************************-->


<?php 

    // Les user sont aussi des guests
    include("Projet/controller/guest.php");

    /* Affiche la page d'accueil */
    function mainUser(){require('./Projet/view/user/main.tpl');}
    
    function displayProfil(){
        include("Projet/modele/user.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        $firstName = $result['firstName'];
        $lastName = $result['lastName'];
        $phoneNumber = $result['phoneNumber'];
        $mail = $result['mail'];
        
        require("Projet/view/user.profil.tpl");
    }
// Penser à concaténer l'adresse
    
?>