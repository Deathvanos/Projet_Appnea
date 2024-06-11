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
    function showUserGraph(){require_once('./Projet/view/modo/showUserGraph.tpl');}

    
    function manageFAQPage(){
        // Fonction login vers la base de données
        include_once("Projet/modele/modo.php");
        $data = modoFAQ();
        // Charge le fichier contenant la fonction du popup
        echo '<script src="Projet/view/other/js/popupDeleteFAQ.js"></script>';
        require('./Projet/view/modo/manageFAQPage.tpl');
    }


    function modifFAQPage(){
        if ($_GET['numfaq']!="new") {
            // Fonction login vers la base de données
            include_once("Projet/modele/modo.php");
            // Récupère la question choisi
            $faqSelect = array_filter(modoFAQ(), function($faqList) {
                return $faqList['id_question'] == $_GET['numfaq'];
            });
            $faqSelect = reset($faqSelect);
        }
        else { // new FAQ
            $txt = $GLOBALS['translat'];
            $faqSelect = array("id_question" => $txt['newFAQ_title'], 
                               "fr_question" => "", 
                               "fr_response" => "", 
                               "us_question" => "", 
                               "us_response" => "");
        }
        require('./Projet/view/modo/modifFAQPage.tpl');
    }


    function addFAQ() {
        include_once("Projet/modele/modo.php");

        if ($_POST['numfaq']!='new' & faqExist($_POST['numfaq'])) {
            modifFAQ($_POST['numfaq'], $_POST['fr_question'], $_POST['fr_response'], $_POST['us_question'], $_POST['us_response']);
        }
        else {// Sinon la FAQ n'existe pas donc on la créé
            createNewFAQ($_POST['fr_question'], $_POST['fr_response'], $_POST['us_question'], $_POST['us_response']);
        }
        // Retour à la page manage FAQ
        header('Location: index.php?controle=modo&action=manageFAQPage');
    }


    function findUser(){
        $arrayReturn = searchUser();
        $result = $arrayReturn[0];
        $nbElements = $arrayReturn[1];
        $posList = $arrayReturn[2];
        require_once('./Projet/view/modo/findUserModo.tpl');
    }
   


    /**
     * Fonction d'appel Ajax.
     * En confirmant le popup pour del une faq, cette fonction est appelé.
     * Cette fonction appel ensuite le modele pour del la faq.
     */
    function deleteFAQAjax() { 
        // Fichier de lang
        include_once( 'Projet/view/other/php/setLang.php');
        $txt = $GLOBALS['translat'];
        // Ne fonctionne que si un formulaire GET et que la varible temoin est validé
        if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
            // Appel du modèle pour suppresion de l'utilisateur
            include_once("Projet/modele/modo.php");
            removeFAQ($_GET['temoin']) ;
            // Réponse JSON indiquant que la suppression a réussi $GLOBALS['txt']['userMain']
            $response = array('message' => $txt['manageFAQ_OkDetete1'] . $_GET['temoin']. $txt['adminGestionUser_OkDetete2']);
        } else {
            // Réponse JSON indiquant qu'il y a eu une erreur
            $response = array('message' => $txt['adminGestionUser_FailDelete']);
        }
        // Ecrire en console de la réponse
        echo json_encode($response);
    }




?>
