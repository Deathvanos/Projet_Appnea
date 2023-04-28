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
    function mainGuest(){require('./Projet/view/guest/mainGuest.tpl');}
    /* Affiche la page d'accueil */
    function mainUser(){require('./Projet/view/user/mainUser.tpl');}

    // Header
    function teamsPage(){require('./Projet/view/guest/teams.tpl');}

    // Footer
    function contactPage(){require('./Projet/view/guest/contact.tpl');}

    function questionsPage(){require('./Projet/view/guest/pageQuestions.tpl');}

    //Conditions
    function conditionsPage(){require('./Projet/view/guest/pageConditions.tpl');}

    function displayProfil(){
        include_once("Projet/modele/user.php");
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

    function displayModifInfos(){
        include_once("Projet/modele/user.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        $firstName = $result[0]['firstName'];
        $lastName = $result[0]['lastName'];
        $phoneNumber = $result[0]['phoneNumber'];
        $mail = $result[0]['mail'];
        $address = $result[0]['address'];
        $city = $result[0]['city'];
        $country = $result[0]['country'];
        $photo = $result[0]['photo'];
        $photo_base64 = base64_encode($photo);
        unset($result);
        require("Projet/view/user/modifProfil.tpl");
    }

    function modifInfos(){
        include_once("Projet/modele/user.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        // Si les champs sont nuls, on ne modifie rien

        // (╯°□°)╯︵ ┻━┻
        if($_FILES["avatar"]["tmp_name"] == ""){
            $avatar = $result[0]['photo'];
        }else{
            $avatar = file_get_contents($_FILES["avatar"]["tmp_name"]);
        }

        $lastName = isset($_POST['lastname'])?$_POST['lastname']:$result[0]['lastName'];
        $firstName = isset($_POST['firstname'])?$_POST['firstname']:$result[0]['firstName'];
        $phoneNumber = isset($_POST['phoneNumber'])?($_POST['phoneNumber']):$result[0]['phoneNumber'];
        $mail = isset($_POST['mail'])?($_POST['mail']):$result[0]['mail'];
        $address = isset($_POST['address'])?($_POST['address']):$result[0]['address'];
        $city = isset($_POST['city'])?($_POST['city']):$result[0]['city'];
        $country = isset($_POST['country'])?($_POST['country']):$result[0]['country'];

        $id_user = $result[0]['id_utilisateur'];
        $infos_user = array("Nom"=>$lastName,"Prénom"=>$firstName,"Tel"=>$phoneNumber,"Mail"=>$mail,"Adresse"=>$address,"Ville"=>$city,"Pays"=>$country, "Photo"=>$avatar);

        updateUser($infos_user, $id_user);
        unset($result);
        displayProfil();
    }


    function checkVarSession() {
        Print_r($_SESSION); // _SESSION - txt
        echo "<u><b> <br><br>Voici la liste des informations concernant votre session :<br> </b></u>";
        foreach ($_SESSION as $cle => $valeur) {
            if(Gettype ($valeur) != gettype(array())) {
                echo "- ".$cle . " : " . $valeur . "<br>";
            }
            else {
                echo "<br> <b>$cle</b> <br>";
                foreach ($valeur as $Subcle => $Subvaleur) {
                    echo "- ".$Subcle . " : " . $Subvaleur . "<br>";
                }
            }
        }
    }



    function sensorUserPage() {
        include_once("Projet/modele/user.php");
                
        //Récuperation des données de chaques capteurs
        $td = getDataTemperature();
        $cd = getDataCardiaque();
        $hd = getDataHumidite();
        $sd = getDataSonore();

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


        require("Projet/view/user/sensorUser.tpl");
    }


?>
