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

        
    // Header
    function teamsPage(){require('./Projet/view/guest/teams.tpl');}

    // Footer
    function contactPage(){require('./Projet/view/guest/contact.tpl');}
    // Après verification de la demande de login, connection de l'utilisateur

    
?>