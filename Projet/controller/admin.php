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

    /** Affiche la page d'accueil **/
    function mainAdmin(){require_once('./Projet/view/admin/mainAdmin.tpl');}
    function createUserPage(){require_once('./Projet/view/admin/createUserPage.tpl');}
    function showUserInfo(){require_once('./Projet/view/admin/showUserInfo.tpl');}


    /** Affiche la page de findUser **/
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
     * Je n'ai pas réussi à la mettre dans le controller del'admin car : VM578:1  Uncaught SyntaxError
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



?>
