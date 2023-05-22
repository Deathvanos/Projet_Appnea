<?php

/**
 * Fonction d'appel Ajax.
 * En confirmant le popup pour del un user, cette fonction est appelé.
 * Je n'ai pas réussi à la mettre dans le controller del'admin car : VM578:1  Uncaught SyntaxError
 * Cette fonction appel ensuite le modele pour del l'user.
 */
    if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['temoin'])) {
        // Appel du modèle pour suppresion de l'utilisateur
        include_once("Projet/modele/admin.php");
        removeUser($_GET['temoin']) ;
       // Fichier de lang
       include_once( 'Projet/view/other/php/setLang.php');
        // Réponse JSON indiquant que la suppression a réussi $GLOBALS['translat']['userMain']
        $response = array('message' => $translat['adminGestionUser_OkDetete1'] . $_GET['temoin']. $translat['adminGestionUser_OkDetete2']);
    } else {
        // Réponse JSON indiquant qu'il y a eu une erreur
        $response = array('message' => $translat['adminGestionUser_FailDelete']);
    }
    
    echo json_encode($response);



?>