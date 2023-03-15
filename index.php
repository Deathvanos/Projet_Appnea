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
// session_unset() est OPTIONNEL : pour reset la session


    // $controle : le controler à appeler
    // $action : la fonction (présente dans le controler) à utiliser pour afficher une page
    if (isset($_GET['controle']) & isset($_GET['action'])) {
        $controle = $_GET['controle'];
        $action= $_GET['action'];
    }
    else {
        $controle = "C_guest";
        $action= "p_main";
         // Bug  : Les variables ne sont pas accessible dans les .tpl 
        $_GET['controle'] = $controle;
        $_GET['action'] = $action;
        $_SESSION['userType'] = "guest";
    }

    // Affiche la page dans la bonne langue
    include 'Projet/view/other/php/setLang.php';
    // Variables pour la maintenance
    $errorPage="Projet/view/other/error.html";

    
    
    // Renvoi l'utilisateur vers la page approprié
    require("Projet/controller/".$controle.".php");

    $action();

    

?>