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
    function contactPage(){
        
        // si y a du contenu isset()
            // si ele ok
                // alors send mail
                // confirm send
            // MSG ERREUR et remplir box
            
            print_r($_POST);

            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                echo "fghjk";
                // Récupérer les données du formulaire
                $objet = $_POST["objet"];
                $question = $_POST["question"];
            
                // Validation des données (vous pouvez ajouter vos propres validations ici)
            
                // Envoyer l'e-mail
                $to = "serviceappnea@outlook.com";
                $subject = $_POST['title'];
                $message = "Objet: " . $objet . "\n\n" . "Question: " . $question;
                $headers = "From: serviceappnea@outlook.com";
            
                if (mail($to, $subject, $message, $headers)) {
                    echo "E-mail envoyé avec succès.";
                } else {
                    echo "Erreur lors de l'envoi de l'e-mail.";
                }
            }


        require_once('./Projet/view/guest/contact.tpl');
    
    }

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
    /****** Fonctions check login *******/
    /************************************/
    function testConnection() {
        // Récupération des infos du guest
        $mail = htmlspecialchars($_POST['mail']);
        $mdp= htmlspecialchars($_POST['mdp']);

        /*** Vérification des infos avant la requete SQL ***/
        if (!preg_match('/^[a-zA-Z0-9~!@#$%^&*()_+-={[}]|\:;<>,.?\/]+$/', $mdp) ) { 
            // La chaîne ne contient que des caractères alphanumériques et certains symboles
            // caractères spéciaux possible ~ ! @ # $ % ^ & * ( ) _ - + = { [ } ] | : ; < > , . ?
                $_SESSION['errorLog'] = "Mail ou mot de passe non conforme.";
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit();
        }

        // Fonction login vers la base de données
        include_once("Projet/modele/isLogout.php");
        tryLogin();

        // Si la fonction tryLogin a fonctionné alors l'user exist -> connection
        // ('is'.$_SESSION['userInfo']["typeUser"])();
        $funcTypeUser = 'is'.$_SESSION['userInfo']["typeUser"];
        $funcTypeUser();
    }




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
