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
        /*$lastName = isset($_POST['lastname'])?($_POST['lastname']):$result[0]['lastName'];*/
        if($_POST['lastname'] == ""){
            $lastName = $result[0]['lastName'];
        } else{
            $lastName = $_POST['lastname'];
        }
        /*$firstName = isset($_POST['firstname'])?($_POST['firstname']):$result[0]['firstName'];*/
        if($_POST['firstname'] == ""){
            $firstName = $result[0]['firstName'];
        } else{
            $firstName = $_POST['firstname'];
        }
        
        /*$phoneNumber = isset($_POST['phoneNumber'])?($_POST['phoneNumber']):$result[0]['phoneNumber'];*/
        if($_POST['phone'] == ""){
            $phoneNumber = $result[0]['phoneNumber'];
        }else{
            $phoneNumber = $_POST['phone'];
        }


        /*$mail = isset($_POST['mail'])?($_POST['mail']):$result[0]['mail'];*/
        if($_POST['mail'] == ""){
            $mail = $result[0]['mail'];
        }else{
            $mail = $_POST['mail'];
        }
        /* $address = isset($_POST['address'])?($_POST['address']):$result[0]['address']; */
        if($_POST['address'] == ""){
            $address = $result[0]['address'];
        }else{
            $address = $_POST['address'];
        }
        
        /*$city = isset($_POST['city'])?($_POST['city']):$result[0]['city'];*/
        if($_POST['city'] == ""){
            $city = $result[0]['city'];
        }else{
            $city = $_POST['city'];
        }
        /*$country = isset($_POST['country'])?($_POST['country']):$result[0]['country'];*/
        if($_POST['country'] == ""){
            $country = $result[0]['country'];
        } else{
            $country = $_POST['country'];
        }
        $id_user = $result[0]['id_utilisateur'];
        $infos_user = array("Nom"=>$lastName,"Prénom"=>$firstName,"Tel"=>$phoneNumber,"Mail"=>$mail,"Adresse"=>$address,"Ville"=>$city,"Pays"=>$country, "Photo"=>$avatar);

        updateUser($infos_user, $id_user);
        unset($result);
        displayProfil();
    }
?>