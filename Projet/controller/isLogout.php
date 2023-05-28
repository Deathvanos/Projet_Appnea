<?php

    // Affiche la page de connection
    function login(){require_once('./Projet/view/isLogout/login.tpl');}


        /************************************/
    /****** Fonctions check login *******/ // a mettre dans le controller du isLogout
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
?>