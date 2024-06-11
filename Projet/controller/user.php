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
        include 'Projet/view/other/head_Font_Page.html';
        include_once("passerelle.php");
        $userMail = $_SESSION['userInfo']['mail'];
        include_once("Projet/modele/user.php");
        
        reloadUserData($userMail);

                
        //Récuperation des données de chaques capteurs
        $td = getDataSensor('temperatureSensor',$userMail );
        $cd = getDataSensor('heartSensor', $userMail);
        $hd = getDataSensor('humiditySensor', $userMail);
        $sd = getDataSensor('soundSensor', $userMail);

        $d1_t = array_column($td, "date_start");
        $d2_t = array_column($td, "date_end");
        $d1_c = array_column($cd, "date_start");
        $d2_c = array_column($cd, "date_end");
        $d1_h = array_column($hd, "date_start");
        $d2_h = array_column($hd, "date_end");
        $d1_s = array_column($sd, "date_start");
        $d2_s = array_column($sd, "date_end");

        
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

        //echo print_r($_COOKIE['tempValues']);
        // $df1 = get_object_vars($data1)['values'];
        //$df2 = get_object_vars($data2)['values'];
        //array_merge($df1,$df2)
        //echo print_r( $data1 );

        //include_once("passerelle.php")
        //reloadUserData($userMail)

        require_once("Projet/view/user/sensorUser.tpl");
    }


?>
