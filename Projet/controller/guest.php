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


    /********************************************/
    /***** Fonctions pour afficher une page *****/
    /********************************************/

    /***** Header *****/

    function mainGuest(){require_once('./Projet/view/guest/mainGuest.tpl');}

    function productPage(){require_once('./Projet/view/guest/productPage.tpl');}

    function teamsPage(){require_once('./Projet/view/guest/teams.tpl');}

    function FAQPage(){require_once('./Projet/view/guest/FAQPage.tpl');}


    /***** Footer *****/
    function contactPage(){require_once('./Projet/view/guest/contact.tpl');}

    function CGUPage(){require_once('./Projet/view/guest/CGUPage.tpl');}


    function PrivacyPolicyPage(){require_once('./Projet/view/guest/privacyPolicyPage.tpl');}

    function CookiesPage(){require_once('./Projet/view/guest/cookiesPage.tpl');}



    /********************************************/
    /********* Fonctions de login Page **********/
    /********************************************/

    // Après verification de la demande de login, connection de l'utilisateur
    function isUser(){
        $_SESSION['controle'] = "user";
        header('Location: index.php?controle=user&action=mainUser');
    }
    function isModo(){
        $_SESSION['controle'] = "modo";
        header('Location: index.php?controle=modo&action=mainModo');
    }
    function isAdmin(){
        $_SESSION['controle'] = "admin";
        header('Location: index.php?controle=admin&action=mainAdmin');
    }



    /************************************/
    /** TEMP : check session variable ***/
    /************************************/



    /************************************/
    /** TEMP : check session variable ***/
    /************************************/

    function checkVarSession() {
        Print_r($_SESSION); // _SESSION - txt
        echo "<u><b> <br><br>Voici la liste des informations concernant votre session :<br> </b></u>";
        foreach ($_SESSION as $cle => $valeur) {
            if(Gettype ($valeur) != gettype(array())) {echo "- ".$cle . " : " . $valeur . "<br>";}
            else {
                echo "<br> <b>$cle</b> <br>";
                foreach ($valeur as $Subcle => $Subvaleur) {echo "- ".$Subcle . " : " . $Subvaleur . "<br>";}
            }
        }
    }

?>
