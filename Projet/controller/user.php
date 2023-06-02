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

     date_default_timezone_set("Europe/Paris");
    /* Affiche la page d'accueil */
    function mainUser(){
        require_once('./Projet/view/user/mainUser.tpl');
    }

    function sensorUserPage() {
        include_once("Projet/modele/user.php");

        //Récuperation des données de chaques capteurs
        $td = getDataSensor('temperatureSensor');
        $cd = getDataSensor('heartSensor');
        $hd = getDataSensor('humiditySensor');
        $sd = getDataSensor('soundSensor');

        $d1 = $td[0]['date_start'];
        $d2 = $td[0]['date_end'];
        $tempValues = $td[0]['dataFile'];
        $cardValues = $cd[0]['dataFile'];
        $humValues = $hd[0]['dataFile'];
        $sonValues = $sd[0]['dataFile'];

        $_COOKIE['d1'] = $td[0]['date_start'];
        $_COOKIE['d2'] = $td[0]['date_end'];

        $_COOKIE['tempValues'] = $td[0]['dataFile'];
        $_COOKIE['cardValues'] = $cd[0]['dataFile'];
        $_COOKIE['humValues'] = $hd[0]['dataFile'];
        $_COOKIE['sonValues'] = $sd[0]['dataFile'];

        //echo print_r($_COOKIE['tempValues']);
        // $df1 = get_object_vars($data1)['values'];
        //$df2 = get_object_vars($data2)['values'];
        //array_merge($df1,$df2)
        //echo print_r( $data1 );

        require_once("Projet/view/user/sensorUser.tpl");
    }


?>
