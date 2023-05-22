<?php session_start();
// shift + alt + f : indentation automatique

    // Redirection vers la Page d'erreur
    function errorPage(){header('location: Projet/view/other/error.html');}


    // Quand le website sera fini -> mettre ce code dans un try catch pour la gestion des erreurs


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