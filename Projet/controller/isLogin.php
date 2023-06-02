<?php


    /********************************************/
    /************** Edition Profil **************/
    /********************************************/


    function displayProfil(){
        include_once("Projet/modele/isLogin.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        $firstName = $result[0]['firstName'];
        $lastName = $result[0]['lastName'];
        $phoneNumber = $result[0]['phoneNumber'];
        $mail = $result[0]['mail'];
        $localisation = $result[0]['address'] . ", " . $result[0]['city'] . " " . $result[0]['country'];
        $photo = $result[0]['photo'];
        $birthday = $result[0]['birthday'];
        $codePostal = $result[0]['codePostal'];
        $photo_base64 = base64_encode($photo);

        //header("Content-type: image");
        require_once("Projet/view/isLogin/profil.tpl");
    }

    function displayModifInfos(){
        $error = 0;
        include_once("Projet/modele/isLogin.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        $firstName = $result[0]['firstName'];
        $lastName = $result[0]['lastName'];
        $phoneNumber = $result[0]['phoneNumber'];
        $mail = $result[0]['mail'];
        $address = $result[0]['address'];
        $city = $result[0]['city'];
        $country = $result[0]['country'];
        $photo = $result[0]['photo'];
        $birthday = $result[0]['birthday'];
        $codePostal = $result[0]['codePostal'];
        $photo_base64 = base64_encode($photo);
        unset($result);
        require_once("Projet/view/isLogin/modifProfil.tpl");
    }
    
    function displayModifInfos_Error(){
        include_once("Projet/modele/isLogin.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        $firstName = $result[0]['firstName'];
        $lastName = $result[0]['lastName'];
        $phoneNumber = $result[0]['phoneNumber'];
        $mail = $result[0]['mail'];
        $address = $result[0]['address'];
        $city = $result[0]['city'];
        $country = $result[0]['country'];
        $photo = $result[0]['photo'];
        $birthday = $result[0]['birthday'];
        $codePostal = $result[0]['codePostal'];
        $photo_base64 = base64_encode($photo);
        unset($result);
        $error = 1;
        require_once("Projet/view/isLogin/modifProfil.tpl");
    }

    function modifInfos(){
        $error = 0;
        include_once("Projet/modele/isLogin.php");
        $result = getProfil($_SESSION['userInfo']['mail']);
        // Si les champs sont nuls, on ne modifie rien

        if($_FILES["avatar"]["tmp_name"] == ""){
            $avatar = $result[0]['photo'];
        }else{
            $img_name = $_FILES["avatar"]["tmp_name"];
            $size = filesize($_FILES["avatar"]["tmp_name"]);
            if($size > 600000){
                $error = 1;
                //require_once("Projet/view/isLogin/modifProfil.tpl");
                displayModifInfos_Error();
                return;
            }
            $avatar = file_get_contents($_FILES["avatar"]["tmp_name"]);
        }

        $lastName = isset($_POST['lastname'])?$_POST['lastname']:$result[0]['lastName'];
        $firstName = isset($_POST['firstname'])?$_POST['firstname']:$result[0]['firstName'];
        $phoneNumber = isset($_POST['phoneNumber'])?($_POST['phoneNumber']):$result[0]['phoneNumber'];
        $mail = isset($_POST['mail'])?($_POST['mail']):$result[0]['mail'];
        $address = isset($_POST['address'])?($_POST['address']):$result[0]['address'];
        $city = isset($_POST['city'])?($_POST['city']):$result[0]['city'];
        $country = isset($_POST['country'])?($_POST['country']):$result[0]['country'];
        $birthday = isset($_POST['birthday'])?($_POST['birthday']):$result[0]['birthday'];

        $codePostal = isset($_POST['codePostal'])?($_POST['codePostal']):$result[0]['codePostal'];
        
        $id_user = $result[0]['id_utilisateur'];
        $infos_user = array("Nom"=>$lastName,"Prénom"=>$firstName,"Tel"=>$phoneNumber,"Mail"=>$mail,"Adresse"=>$address,"Ville"=>$city,"Pays"=>$country, "Photo"=>$avatar, "Birthday"=>$birthday, "CodePostal"=>$codePostal);

        updateUser($infos_user, $id_user);
        unset($result);
        displayProfil();
    }
    
    function deletePhoto(){
        include_once("Projet/modele/isLogin.php");
        $result_id = getIdByMail($_SESSION['userInfo']['mail']);
        deletePhotodB($result_id);
        displayProfil();
    }







    /********************************************/
    /************* Find user search *************/
    /********************************************/


    function searchUser(){
        // Ne concerne pas les users
        if ($_SESSION['controle'] != "user" ) {

            // Fonction login vers la base de données
            include_once("Projet/modele/isLogin.php");

            // La page est reload - isset($_POST['validat']) = true
            if (isset($_POST['nbElements'])){
                $nbElements = $_POST['nbElements'];
                $posList = $_POST['posList'];
                // En fonction du bouton clic -> action différentes
                switch ($_POST['validat']) {
                    // On supprime cette var pour réinitialiser les vars du $_POST à null
                    case 'reset': unset($_POST['mail']); break;
                    // Affiche les n éléments suivant
                    case 'next':
                        $nbUser = nbUserFind();
                        $posList += $nbElements;
                        if ($posList>= $nbUser) {$posList-=$nbElements;}
                        if ($posList<0) {$posList=0;}
                        break;
                    // Affiche les n éléments précédant
                    case 'last':
                        $posList -= $nbElements;
                        if ($posList<0) {$posList=0;}
                        break;
                    // Nombre d'éléments à afficher
                    case 3: $nbElements = 3; break;
                    case 4: $nbElements = 4; break;
                    case 5: $nbElements = 5; break;
                    // Validation le compteur retourne à 0
                    default: if(!isset($_POST['delUser'])) {$posList = 0;} break;
                }
            }
            // On arrive sur la page pour la first time or reset page - Il n'y a pas de filtre
            if(!isset($_POST['mail'])) {
                $nbElements = 5;
                $posList = 0;
                $_POST['typeUser'] = null;
                $_POST['firstName'] = null;
                $_POST['lastName'] = null;
                $_POST['mail'] = null;
                $_POST['birthday'] = null;
                $_POST['phoneNumber'] = null;
                $_POST['country'] = null;
                $_POST['city'] = null;
                $_POST['address'] = null;
                $_POST['cardiaqueStat'] = null;
                $_POST['sonorStat'] = null;
                $_POST['temperatureStat'] = null;
                $_POST['humidityStat'] = null;
            }
            // Va chercher la table User
            return array(printDataBase($posList, $nbElements), $nbElements, $posList) ;
        }
    }

    function printInfoSensor($sensor, $isUsed, $isNotBroken) {
        $txt = $GLOBALS['translat'];
        if ($sensor!=null) {if ($isUsed==1 & $isNotBroken==1) {echo '<td><p class="colorTrue">'.$txt['adminGestionUser_Active'].'</p></td>';return;}}
        echo '<td><p class="colorFalse">'.$txt['adminGestionUser_Lock'].'</p></td>';
    }
?>