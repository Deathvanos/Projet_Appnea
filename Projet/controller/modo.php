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
    function mainModo(){require('./Projet/view/modo/mainModo.tpl');}
    function manageFAQPage(){require('./Projet/view/modo/manageFAQPage.tpl');}



    function findUser(){
        $arrayReturn = searchUser();
        $result = $arrayReturn[0];
        $nbElements = $arrayReturn[1];
        $posList = $arrayReturn[2];
        require_once('./Projet/view/modo/findUserModo.tpl');
    }
   






?>
