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
    function mainUser(){require_once('./Projet/view/user/mainUser.tpl');}

   
    function sensorUserPage() {
        include_once("Projet/modele/user.php");

        $userMail = $_SESSION['userInfo']['mail'];
                
        //Récuperation des données de chaques capteurs
        $td = getDataSensor('temperatureSensor',$userMail);
        $cd = getDataSensor('heartSensor', $userMail);
        $hd = getDataSensor('humiditySensor', $userMail);
        $sd = getDataSensor('soundSensor', $userMail);

        $d1 = array_column($td, "date_start");
        $d2 = array_column($td, "date_end");
        $tempValues = array_column($td, "dataFile");
        $cardValues = array_column($cd, "dataFile");
        $humValues = array_column($hd, "dataFile");
        $sonValues = array_column($sd, "dataFile");

        $_COOKIE['d1'] = array_column($td, "date_start");
        $_COOKIE['d2'] = array_column($td, "date_end");

        $_COOKIE['tempValues'] = array_column($td, "dataFile");
        $_COOKIE['cardValues'] = array_column($cd, "dataFile");
        $_COOKIE['humValues'] = array_column($hd, "dataFile");
        $_COOKIE['sonValues'] = array_column($sd, "dataFile");

        require_once("Projet/view/user/sensorUser.tpl");
    }


?>
