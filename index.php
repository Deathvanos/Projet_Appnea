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


    // if new session then this is a guest 
    if (!isset($_SESSION['controle']) & !isset($_SESSION['action'])) {
        $_SESSION['userType'] = "guest";
    }
    
    // Renvoi l'utilisateur vers la page approprié
    header("Location: Projet/controller/".$_SESSION['userType']."/main.php");

?>