<?php session_start();

date_default_timezone_set("Europe/Paris");

// shift + alt + f : indentation automatique

    // Redirection vers la Page d'erreur
    function errorPage($msg="Page probablement inexistante"){
        echo "Error : $msg";
        require_once("Projet/view/other/error.html"); 
        exit();
    }


    // Quand le website sera fini -> mettre ce code dans un try catch pour la gestion des erreurs
    

    // Suppression de la session si modification de l'url pour la var de controle
    if(isset($_GET['controle']) & isset($_SESSION['controle'])) {
        if ($_GET['controle'] != $_SESSION['controle']) {
          unset($_GET['controle']);
          errorPage("Votre profil utilisateur a été modifié");                   
        }
    }

    // $controle : le controler à appeler
    // $action : la fonction (présente dans le controler) à utiliser pour afficher une page
    if (isset($_GET['controle']) & isset($_GET['action'])) {
        // verification que le typeUser n'a pas été modifié dans l'URL
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
    


    
    /***** Charge tous les controllers de ce type d'utilisateur *****/

    // Tous les utilisateurs sont des guests de base
    require_once("Projet/controller/guest.php");
    // guest isLogout else isLogin
    if ($_SESSION['controle'] == "user" | $_SESSION['controle'] == "modo" | $_SESSION['controle'] == "admin") {require_once("Projet/controller/isLogin.php");}
    else if ($_SESSION['controle'] == "guest") {require_once("Projet/controller/isLogout.php");}
    // charge le controller de utilisateurs
    require_once("Projet/controller/".$_SESSION['controle'].".php");

    // Renvoi l'utilisateur vers la page approprié
    $_SESSION['action']();


    

?>