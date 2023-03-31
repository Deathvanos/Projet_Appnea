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

<?php  session_unset(); session_start();
// shift + alt + f : indentation automatique

    // Redirection vers la Page d'erreur
    function errorPage(){require('./Projet/view/other/error.html');}

    // $controle : le controler à appeler
    // $action : la fonction (présente dans le controler) à utiliser pour afficher une page
    if (isset($_GET['controle']) & isset($_GET['action'])) {
        $_SESSION['controle'] = strtolower ($_GET['controle']);
        $_SESSION['action']= $_GET['action'];
    }
    else {
        // session_unset() est OPTIONNEL : pour reset la session
        session_unset();
        // destroy the session
        session_destroy();
         // Bug  : Les variables ne sont pas accessible dans les .tpl 
        $_SESSION['controle'] = "guest";
        $_SESSION['action'] = "mainGuest";;
    }

    // Si on a une deconnection puis un retour arrière alors il est logout et va sur la main page
    if (($_SESSION['controle'] == "guest" & isset($_SESSION['userInfo'])) |
        ($_SESSION['controle'] != "guest" & (!isset($_SESSION['userInfo'])))) {
        header('Location: index.php');
        exit();
    }

    // Affiche la page dans la bonne langue
    include 'Projet/view/other/php/setLang.php';
    
    // Renvoi l'utilisateur vers la page approprié
    require("Projet/controller/".$_SESSION['controle'].".php");
    $_SESSION['action']();

    

?>