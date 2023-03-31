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

    // Affiche la page d'accueil d'un guest
    function mainGuest(){require('./Projet/view/guest/main.tpl');}
    /* Affiche la page d'accueil */
    function mainUser(){require('./Projet/view/user/main.tpl');}

    
    function displayProfil(){
        include("Projet/modele/user.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        $firstName = $result[0]['firstName'];
        $lastName = $result[0]['lastName'];
        $phoneNumber = $result[0]['phoneNumber'];
        $mail = $result[0]['mail'];
        $localisation = $result[0]['address'] . ", " . $result[0]['city'] . " " . $result[0]['country'];
        $photo = $result[0]['photo'];
        $photo_base64 = base64_encode($photo);

        //header("Content-type: image"); 
        require("Projet/view/user/profil.tpl");
    }
// Penser à concaténer l'adresse
    
?>