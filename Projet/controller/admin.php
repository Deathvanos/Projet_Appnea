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

    /* Affiche la page d'accueil */

    function mainAdmin(){require_once('./Projet/view/admin/mainAdmin.tpl');}
    function createUserPage(){require_once('./Projet/view/admin/createUserPage.tpl');}
    function showUserInfo(){require_once('./Projet/view/admin/showUserInfo.tpl');}
    
    
    /* Affiche la page de findUser */
    function findUser(){
        $arrayReturn = searchUser();
        $result = $arrayReturn[0];
        $nbElements = $arrayReturn[1];
        $posList = $arrayReturn[2];
        // Charge le fichier contenant la fonction du popup
        echo '<script src="Projet/view/other/js/popupDeleteUser.js"></script>';
        // charge la page
        require_once('./Projet/view/admin/findUserAdmin.tpl');
    }


 

?>
