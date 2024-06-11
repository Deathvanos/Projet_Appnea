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
    function createUserPage(){
        include_once("Projet/modele/admin.php");
        $txt = $GLOBALS['translat'];
        echo '<script src="Projet/view/other/js/createUser.js"></script>';
        $liste_resultat = getIdBoxDispo();
        $_SESSION['createUser'] = "Merci de bien compléter les champs";
        if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        // Import infoDB pour se connecter a la DB
        // Génération mdp aléatoire
        $longueur = 8;
        $caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $motDePasse = '';
        
        $caracteresLongueur = strlen($caracteres);
        for ($i = 0; $i < $longueur; $i++) {
            $indexAleatoire = rand(0, $caracteresLongueur - 1);
            $caractereAleatoire = $caracteres[$indexAleatoire];
            $motDePasse .= $caractereAleatoire;
        }

        $motDePasseHashed = hash('ripemd160', $motDePasse);


        // Récupération des valeurs des champs du form 
        $lastName = $_POST['lastname'];
        $firstName = $_POST['firstname'];
        $phoneNumber = $_POST['phoneNumber'];
        $mail = $_POST['mail'];
        $codePostal = $_POST['codePostal'];
        $address = $_POST['address'];
        $city = $_POST['city'];
        $country = $_POST['country'];
        $birthday = $_POST['birthday'];
        $typeUser = $_POST['role'];
        $BoxId = NULL;
        if ($typeUser == 'User'){
            $BoxId = $_POST['boxId'];
        }
        // génération du token : 
        $token = uniqid();

        // Construction du lien de réinitialisation
        $resetLink = "https://appnea.websr.fr/index.php?controle=guest&action=resetPassword&token=" . $token;

        // Information du mail
        $title = "Creation profil APPNEA";
        $message =  "Cher client,\n\nMerci d'avoir acheté notre produit.\nVoici le lien pour crée votre mot de passe et ainsi activer votre compte : " . $resetLink;
        $subject = "APPNEA";
        $headers = "Content-Type: text/plain; charset=utf-8\r\n";
        $headers .= "From: serviceappnea@outlook.com\r\n";
        $headers .= "Reply-To: serviceappnea@outlook.com\r\n";
        $headers .= "X-Mailer: PHP/" . phpversion();

        include_once("Projet/modele/infoDB.php");

        // Connexion à la DB puis insertion d'un élément à la table
        $conn = connectionToDB();
        try{
            $sql = "INSERT INTO utilisateur (typeUser, firstName, lastName, birthday, phoneNumber, mail, password, country, city, codePostal, address, id_Box, token) 
            VALUES (:typeUser, :firstName, :lastName, :birthday, :phoneNumber, :mail, :motDePasseHashed, :country,:city, :codePostal, :address, :BoxId, :token );";
            $commande = $conn->prepare($sql);
            $commande->bindParam(':typeUser',$typeUser);
            $commande->bindParam(':firstName',$firstName);
            $commande->bindParam(':lastName',$lastName);
            $commande->bindParam(':birthday',$birthday);
            $commande->bindParam(':phoneNumber',$phoneNumber);
            $commande->bindParam(':mail',$mail);
            $commande->bindParam(':motDePasseHashed',$motDePasseHashed);
            $commande->bindParam(':country',$country);
            $commande->bindParam(':city',$city);
            $commande->bindParam(':codePostal',$codePostal);
            $commande->bindParam(':address',$address);
            $commande->bindParam(':BoxId',$BoxId);
            $commande->bindParam(':token',$token);
            
            $commande->execute();

            // envoie du mail
            if (mail($mail, $subject, $message, $headers)) {
                $_SESSION['createUser'] = "L'utilisateur a été crée et un mail a été envoyé";
            }
            else {
                $_SESSION['createUser'] = "Une erreur s'est produite sur l'envoi du mail \n mail ou numero de telephone déja existants'";

            }
        }
        catch (PDOException $e) {
            $_SESSION['createUser'] = "Une erreur s'est produite sur la création de l'utilisateur";
        }
        $conn = null;
        }
        require_once('./Projet/view/admin/createUserPage.tpl');

    }
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

    /**
     * Fonction d'appel Ajax.
     * En confirmant le popup pour del un user, cette fonction est appelé.
     * Cette fonction appel ensuite le modele pour del l'user.
     */
    function deleteUserAjax() { 
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            // Appel du modèle pour suppresion de l'utilisateur
            include_once("Projet/modele/admin.php");
            removeUser($_GET['temoin']) ;
            // Réponse JSON indiquant que la suppression a réussi $GLOBALS['txt']['userMain']
            $response = array('message' => $txt['adminGestionUser_OkDetete1'] . $_GET['temoin']. $txt['adminGestionUser_OkDetete2']);
        } else {
            // Réponse JSON indiquant qu'il y a eu une erreur
            $response = array('message' => $txt['adminGestionUser_FailDelete']);
        }
        // Ecrire en console de la réponse
        echo json_encode($response);
    }

 
    function createBoxAndSensor() {
        // Recuperation de la liste des capteurs
        include_once("Projet/modele/admin.php");
        $data = getBoxList();

        // J'aurai pu le mettre en filtre SQL
        if (isset($_POST['nbSensor']) && $_POST['nbSensor']!='*') {
            $data = array_filter($data, function($listBox) {return ($listBox['nbSensor'] == $_POST['nbSensor'] );});}
        if (isset($_POST['isUsed']) && $_POST['isUsed']!='*') {
            $data = array_filter($data, function($listBox) {
                if ($_POST['isUsed']==0){return ($listBox['isUsed'] == "notUsed" );}
                else {return ($listBox['isUsed'] != "notUsed" );}
        });}

        echo '<script src="Projet/view/other/js/boxsensorManagement.js"></script>';
        require_once('./Projet/view/admin/createBoxAndSensor.tpl');
    }




    function createBoxAjax() { 
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            include_once("Projet/modele/admin.php");
            $resultSQL = createNewBox($_GET['temoin']);
            if ($resultSQL=='ok') {$response = array('message' => "Confirmation de la création du boitier : ".$_GET['temoin']);}
            else {$response = array('message' => $resultSQL);}
        } // Réponse JSON indiquant qu'il y a eu une erreur
        else {$response = array('message' => "Erreur lors de la création du boitier");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }



    function createSensorAjax() { 
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            include_once("Projet/modele/admin.php");
            $resultSQL = createNewSensor($_GET['temoin'], $_GET['typeSensor']);
            if ($resultSQL=='ok') {$response = array('message' => "Confirmation de la création du boitier : ".$_GET['temoin']);}
            else {$response = array('message' => $resultSQL);}
        } // Réponse JSON indiquant qu'il y a eu une erreur
        else {$response = array('message' => "Erreur lors de la création du capteur");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }

    
    function getinfoBoxAjax() {
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            include_once("Projet/modele/admin.php");
            $resultSQL = getSensorFromBox($_GET['temoin']);
            $response = array('message' => $resultSQL);
        } // Réponse JSON indiquant qu'il y a eu une erreur
        else {$response = array('message' => "Erreur lors de la création du capteur");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }

    
    function getUserBoxAjax() {
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            include_once("Projet/modele/admin.php");
            $response = getBoxUser($_GET['temoin']);
        } // Réponse JSON indiquant qu'il y a eu une erreur
        else {$response = array('message' => "Erreur lors de la création du capteur");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }

    function getSensorNotUsedAjax() {
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            include_once("Projet/modele/admin.php");
            $resultSQL = getSensorNotUsed();
            $response = array('message' => $resultSQL);
        } // Réponse JSON indiquant qu'il y a eu une erreur
        else {$response = array('message' => "Erreur lors de la création du capteur");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }


    function getSensorSelectAjax() {
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            include_once("Projet/modele/admin.php");
            $resultSQL = getSensorSelect($_GET['temoin']);
            $response = array('message' => $resultSQL);
        } // Réponse JSON indiquant qu'il y a eu une erreur
        else {$response = array('message' => "Erreur lors de la création du capteur");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }


    function deleteBoxAjax() { 
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            // Appel du modèle pour suppresion de l'utilisateur
            include_once("Projet/modele/admin.php");
            // destruction des liens entre les anciens capteur et la box
            removelinkSensorFromBox($_GET['temoin']);
            removeBox($_GET['temoin']) ;
            // Réponse JSON indiquant que la suppression a réussi $GLOBALS['txt']['userMain']
            $response = array('message' => "Le boitier ". $_GET['temoin']. " a bien été supprimé");
        } else {$response = array('message' => "Erreur lors de la suppression du boitier");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }


    function deleteSensorAjax() { 
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            // Appel du modèle pour suppresion de l'utilisateur
            include_once("Projet/modele/admin.php");
            removeSensor($_GET['temoin']) ;
            // Réponse JSON indiquant que la suppression a réussi $GLOBALS['txt']['userMain']
            $response = array('message' => "Le capteur ". $_GET['temoin']. " a bien été supprimé");
        } else {$response = array('message' => "Erreur lors de la suppression du capteur");}
        // Ecrire en console de la réponse
        echo json_encode($response);
    }


    function changeSensorInBoxAjax() {
                // Fichier de lang
                include_once( 'Projet/view/other/php/setLang.php');
                $txt = $GLOBALS['translat'];
                // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
                if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                    // Récuperation des variables du POST
                    $jsonData = file_get_contents('php://input');
                    $myMappings = json_decode($jsonData, true);
                    include_once("Projet/modele/admin.php");
                    // destruction des liens entre les anciens capteur et la box
                    removelinkSensorFromBox($myMappings['id_Box']);
                    // Ajout des liens avec les nouveaux capteur et la box
                    $tempSensor = $myMappings['temperatureSensor'];
                    $humSensor = $myMappings['humiditySensor'];
                    $heartSensor = $myMappings['heartSensor'];
                    $soundSensor = $myMappings['soundSensor'];
                    addNewlinkSensorFromBox($myMappings['id_Box'], $tempSensor, $humSensor, $heartSensor, $soundSensor);
                    $response = array('message' => "Les capteurs 4 ont été attribié au boitier : ".$myMappings['id_Box']);
                } else {$response = array('message' => "Erreur lors de la modification du boitier");}
                // Ecrire en console de la réponse
                echo json_encode($response);
    }
?>
